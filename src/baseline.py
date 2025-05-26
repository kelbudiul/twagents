from langgraph.graph import StateGraph, START, END
from langgraph.graph.state import CompiledStateGraph
from langgraph.prebuilt import ToolNode
from langchain.prompts import ChatPromptTemplate
from textworld.gym.envs import TextworldGymEnv
from typing import TypedDict
from pprint import pprint
from typing import Literal, Callable
from langsmith import traceable
from src.prompts import BASELINE_PROMPT
from src.tools import TOOLS
from langchain_core.language_models.chat_models import BaseChatModel
from langchain_core.messages import HumanMessage
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.messages import SystemMessage
from langchain_core.messages import ToolMessage
from langchain_core.messages import AIMessage
from typing import TypedDict, Literal, Callable, Sequence, Annotated
import operator




class State(TypedDict):
    messages: Annotated[Sequence, operator.add]
    step: int
    trace: list[dict]
    current_obs: str
    score_count: int
    done: bool
    infos: dict
    llm_response: AIMessage


# --- Prompt ---
prompt = ChatPromptTemplate.from_messages([
    ("system", BASELINE_PROMPT),
    ("placeholder", "{messages}"),
    ("user", 
     """Current Observation:\n{current_obs}\n"
     "Game Goal:\n{game_goal}\n"
     "Inventory:\n{inventory}"""),
])



# --- Control ---
def check_done(state: State) -> Literal["DECIDE", END]:
    return END if state.get("done", False) else "DECIDE"


# --- Nodes ---

def make_env_node(env) -> Callable[[State], State]:
    def step(state: State, config) -> State:
        tool_msg = state["messages"][-1]
        assert tool_msg.type == "tool", "Expected ToolMessage"
        action = tool_msg.content.strip()
        llm_response = state["llm_response"]
        tool_call = llm_response.tool_calls[0]
        reasoning = tool_call["args"].get("reasoning", "")

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


def make_decide_node(llm):
    @traceable(name="tool_decision_node")
    def decide_node(state: State, config) -> State:
        messages = state.get("messages", [])
        obs = state["current_obs"]
        goal = state["infos"].get("objective", "")
        inventory = state["infos"].get("inventory", "")
        bound_llm = llm.bind_tools(TOOLS, tool_choice="any", parallel_tool_calls=False)
        chain = prompt | bound_llm
        
        response = chain.invoke({"messages": messages,
            "current_obs": obs,
            "game_goal": goal,
            "inventory": inventory})

        return {"messages": [response], "llm_response": response}
    return decide_node

# --- Graph ---
def build_graph(llm: BaseChatModel, env: TextworldGymEnv) -> CompiledStateGraph:

    decide_node = make_decide_node(llm=llm)
    env_node = make_env_node(env=env)
    tool_node = ToolNode(name="ENV_TOOL", tools=TOOLS)
    

    graph = StateGraph(State)
    graph.add_node("DECIDE", decide_node)
    graph.add_node("ENV_TOOL", tool_node)
    graph.add_node("EXECUTE_ENV", env_node)

    graph.set_entry_point("DECIDE")
    graph.add_edge("DECIDE", "ENV_TOOL")
    graph.add_edge("ENV_TOOL", "EXECUTE_ENV")
    graph.add_conditional_edges("EXECUTE_ENV", check_done)

    return graph.compile(name="BaselineAgent")