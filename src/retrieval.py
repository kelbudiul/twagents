from langgraph.graph import StateGraph, END
from langgraph.graph.state import CompiledStateGraph
from langgraph.prebuilt import ToolNode
from langchain.prompts import ChatPromptTemplate
from langchain_core.language_models.chat_models import BaseChatModel
from langchain_core.messages import HumanMessage, SystemMessage, ToolMessage, AIMessage
from textworld.gym.envs import TextworldGymEnv
from typing import TypedDict, Literal, Callable, Sequence, Annotated
import operator
from langsmith import traceable

from src.prompts import RETRIEVAL_PROMPT
from src.tools import TOOLS


class State(TypedDict):
    messages: Annotated[Sequence, operator.add]
    step: int
    trace: list[dict]
    current_obs: str
    score_count: int
    done: bool
    infos: dict
    llm_response: AIMessage
    retrieved_memory: str
    episode_num: int

# --- Prompts ---

prompt = ChatPromptTemplate.from_messages([
    ("system", RETRIEVAL_PROMPT),
    ("placeholder", "{messages}"),
    ("user", 
     """Current Observation:\n{current_obs}\n"
     "Game Goal:\n{game_goal}\n"
     "Inventory:\n{inventory}"
     "**RELEVANT MEMORY FROM PREVIOUS EPISODES**:\n{retrieved_memory}\n\n""")
])


#--- Control ---

def check_done(state: State) -> Literal["DECIDE", END]:
    return END if state.get("done", False) else "DECIDE"

#----- Nodes -----

def make_decide_node(llm):
    @traceable(name="tool_decision_node")
    def decide_node(state: State, config) -> State:
        messages = state.get("messages", [])
        obs = state["current_obs"]
        goal = state["infos"].get("objective", "")
        inventory = state["infos"].get("inventory", "")

        retriever = config["configurable"]["episodic_store"]
        results = retriever.search(("memories", "episodic"), query=obs, limit=4)
     
        if results:
            memory_text = "\n".join([r.value['page_content'] for r in results])
        else:
            memory_text = "No relevant memories found."

        bound_llm = llm.bind_tools(TOOLS, tool_choice="any", parallel_tool_calls=False)
        chain = prompt | bound_llm

        response = chain.invoke({
            "messages": messages,
            "retrieved_memory": memory_text,
            "current_obs": obs,
            "game_goal": goal,
            "inventory": inventory
        })


        return {"messages": [response], "llm_response": response, "retrieved_memory": memory_text}
    return decide_node

def make_env_node(env) -> Callable[[State], State]:
    def step(state: State, config) -> State:
        tool_msg = state["messages"][-1]
        assert tool_msg.type == "tool", "Expected ToolMessage"
        action = tool_msg.content.strip()
        llm_response = state["llm_response"]
        tool_call = llm_response.tool_calls[0]
        reasoning = tool_call["args"].get("reasoning", "")
        episodic_store = config["configurable"]["episodic_store"]

        obs, reward, done, infos = env.step(action)

        update_from_env = f"""
        {obs.strip()}
"""

        trace_entry = {
            "step": state["step"],
            "action": action,
            "observation_before": state.get("current_obs", ""),
            "reasoning": reasoning,
            "feedback_after_action": infos.get("feedback", ""),
            "score_count": state.get("score_count", 0) + reward,
            "tokens_total": llm_response.response_metadata.get("token_usage", {}).get("total_tokens", 0),
            "tokens_prompt": llm_response.response_metadata.get("token_usage", {}).get("prompt_tokens", 0),
            "tokens_completion": llm_response.response_metadata.get("token_usage", {}).get("completion_tokens", 0),      
        }


        # Store new memory
        memory_entry = {
            "page_content": (
                f"Episode Nr: {state['episode_num']}\n"
                f"[Step {state['step']}]\n"
                f"Observation Before:\n{state['current_obs'].strip()}\n\n"
                f"Action:\n{action}\n\n"
                f"Resulting Observation:\n{obs.strip()}\n\n"
                f"Score:\n{state['score_count'] + reward}"
            )
        }

        episodic_store.put(("memories", "episodic"), f"episode_{state['episode_num']}step_{state['step']}", memory_entry)

        return {
            **state,
            "step": state["step"] + 1,
            "current_obs": obs,
            "score_count": trace_entry["score_count"],
            "done": done,
            "infos": infos,
            "trace": state.get("trace", []) + [trace_entry],
            "messages": [HumanMessage(content=update_from_env)],
        }
    return step


#--- Graph ---

def build_graph(llm: BaseChatModel, env: TextworldGymEnv) -> CompiledStateGraph:
    graph = StateGraph(State)
    graph.add_node("DECIDE", make_decide_node(llm))
    graph.add_node("ENV_TOOL", ToolNode(name="ENV_TOOL", tools=TOOLS))
    graph.add_node("EXECUTE_ENV", make_env_node(env))

    graph.set_entry_point("DECIDE")
    graph.add_edge("DECIDE", "ENV_TOOL")
    graph.add_edge("ENV_TOOL", "EXECUTE_ENV")
    graph.add_conditional_edges("EXECUTE_ENV", check_done)

    return graph.compile(name="RetrievalAgent")
