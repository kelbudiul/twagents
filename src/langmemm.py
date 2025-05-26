from langgraph.graph import StateGraph, START, END
from langgraph.graph.state import CompiledStateGraph
from langgraph.prebuilt import ToolNode
from langchain.prompts import ChatPromptTemplate
from textworld.gym.envs import TextworldGymEnv
from typing import TypedDict
from pprint import pprint
from typing import Literal, Callable
from langsmith import traceable
from src.prompts import LANGMEM_PROMPT
from src.tools import TOOLS, search_episodic_memory, search_semantic_memory
from langchain_core.language_models.chat_models import BaseChatModel
from langchain_core.messages import HumanMessage
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.messages import SystemMessage
from langchain_core.messages import ToolMessage
from langchain_core.messages import AIMessage
from typing import TypedDict, Literal, Callable, Sequence, Annotated
import operator
from pydantic import BaseModel, Field
from src.schemas import SemanticFact, Step, TopographicRelation

# --- States ---
class State(TypedDict):
    messages: Annotated[Sequence, operator.add]
    step: int
    trace: list[dict]
    current_obs: str
    score_count: int
    done: bool
    infos: dict
    llm_response: AIMessage
    episodic_memory: str
    semantic_memory: str
    map_knowledge: str 
    episode_num: int


# --- Prompts ---
prompt = ChatPromptTemplate.from_messages([
    ("system", LANGMEM_PROMPT),
    ("placeholder", "{messages}"),
    ("user", "Observation:\n{current_obs}"),
    ("user", "Inventory:\n{inventory}"),
    ("user", "Game Goal:\n{game_goal}"),
    ("user", "--- Room Layout & Directions ---\n{map_knowledge}"),
    ("user", "--- Semantic Memory ---\n{semantic_memory}"),
    ("user", "--- Episodic Memory ---\n{episodic_memory}"),
])


# --- Utils ---

def format_semantic_fact(f: SemanticFact) -> str:
    """
    Formats a SemanticFact into a human-readable string for display or prompt injection.
    Handles boolean-like values (as strings), preserves original structure, and avoids normalization.
    """

    entity = f.entity
    attr = f.attribute
    value = f.value

    if value is None:
        return f"{entity} {attr}"

    value_lower = value.strip().lower()

    # Handle boolean-style strings in a readable way
    if attr.startswith("is_"):
        state = attr[3:]  # remove 'is_' for display
        if value_lower == "true":
            return f"{entity} is {state}"
        elif value_lower == "false":
            return f"{entity} is not {state}"
        else:
            return f"{entity} is {state} ({value})"

    if attr.startswith("can_"):
        ability = attr[4:]
        if value_lower == "true":
            return f"{entity} can {ability}"
        elif value_lower == "false":
            return f"{entity} cannot {ability}"
        else:
            return f"{entity} can {ability} ({value})"

    # Generic case (e.g., spatial, relational, descriptive facts)
    return f"{entity} {attr} {value}"


# --- Control ---
def check_done(state: State) -> Literal["DECIDE", END]:
    return END if state.get("done", False) else "DECIDE"

def route_after_decide(state: State) -> Literal["ENV_TOOL", "MEMORY_CONTROLLER"]:
    calls = state["llm_response"].tool_calls
    if not calls:
        raise ValueError("No tool calls detected")
    

    memory_tools = {"search_episodic_memory", "search_semantic_memory"}
    if any(call["name"] in memory_tools for call in calls):
        return "MEMORY_CONTROLLER"
    else:
        return "ENV_TOOL"
    
# --- Nodes ---


def make_decide_node(llm):
    @traceable(name="tool_decision_node")
    def decide_node(state: State, config) -> State:
        messages = state.get("messages", [])
        bound_llm = llm.bind_tools([*TOOLS, search_semantic_memory, search_episodic_memory], tool_choice="any", parallel_tool_calls=True)
        chain = prompt | bound_llm
        obs = state["current_obs"]
        goal = state["infos"].get("objective", "")
        inventory = state["infos"].get("inventory", "")
        map_knowledge = state["map_knowledge"]
        semantic_memory = state["semantic_memory"]
        episodic_memory = state["episodic_memory"]
        
        response = chain.invoke({"messages": messages, 
                                "current_obs": obs,
                                "game_goal": goal,
                                "inventory": inventory,
                                "map_knowledge": map_knowledge,
                                "semantic_memory": semantic_memory,
                                "episodic_memory": episodic_memory})

        return {"messages": [response], "llm_response": response}
    return decide_node



def make_env_node(env) -> Callable[[State], State]:
    def step(state: State, config) -> State:
        messages = state["messages"]
        tool_msg = state["messages"][-1]
        assert tool_msg.type == "tool", "Expected ToolMessage"
        action = tool_msg.content.strip()
        llm_response = state["llm_response"]
        tool_call = llm_response.tool_calls[0]
        reasoning = tool_call["args"].get("reasoning", "")


        obs, reward, done, infos = env.step(action)

        update_from_env = f"""
        {state['infos'].get("objective", "")}
        \nObservation after action:
        {obs.strip()}
        \nGame Goal:
        \nInventory:
        {infos.get("inventory", "")}
"""


        new_trace = {
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

        memory_entry = (
            f"Episode Nr: {state['episode_num']}\n"
            f"[Step {state['step']}]\n"
            f"Observation Before:\n{state['current_obs']}\n\n"
            f"Action:\n{action}\n\n"
            f"Resulting Observation:\n{obs}\n\n"
        )

        episodic_store_manager = config["configurable"]["episodic_store_manager"]
        episodic_store_manager.invoke({"messages": [{"role": "user", "content": memory_entry}]})
        semantic_store_manager = config["configurable"]["semantic_store_manager"]
        semantic_store_manager.invoke({"messages": [{"role": "user", "content": memory_entry}]})

        return {
            "step": state["step"] + 1,
            "current_obs": obs,
            "score_count": new_trace["score_count"],
            "done": done,
            "infos": infos,
            "trace": state.get("trace", []) + [new_trace],
            "messages": [HumanMessage(content=update_from_env)],
        }
    return step


def make_memory_controller_node():
    def memory_controller(state: State, config) -> State:
        semantic_store_manager = config["configurable"].get("semantic_store_manager")
        episodic_store_manager = config["configurable"].get("episodic_store_manager")

        semantic_facts = []
        map_facts = []
        episodic_facts = []
        tool_messages = []

        # Configurable limits
        MAX_ITEMS = 5

        for call in state["llm_response"].tool_calls:
            name = call["name"]
            args = call["args"]
            tool_call_id = call["id"]
            query = args.get("query", "")

            if name == "search_semantic_memory":
                results = semantic_store_manager.search(query=query) or []

                for r in results:
                    try:
                        content = r.value  # r is a SearchItem

                        # Try topographic format
                        if isinstance(content, TopographicRelation):
                            base = f"{content.place} is {content.relation_type} to {content.connects_to} via {content.direction}"
                            
                            if content.obstacle:
                                base += f" (blocked by {content.obstacle})"
                            
                            if content.access_condition:
                                base += f" [requires: {content.access_condition}]"

                                map_facts.append(base)
                        # Otherwise treat as semantic triple
                        elif isinstance(content, SemanticFact):
                            semantic_facts.append(format_semantic_fact(content))

                    except Exception as e:
                        print(f"[MemoryController] Error parsing semantic memory: {e}\nEntry: {r}")

            elif name == "search_episodic_memory":
                results = episodic_store_manager.search(query=query) or []

                for r in results:
                    try:
                        content = r.value
                        if isinstance(content, Step):
                            episodic_fact = "Episode:" + str(content.episode) + "\n" + "Step:" + str(content.step) + "\n" + "Observation:" +content.observation + "\n" + "Action:" + content.action + "\n" + "Result:" + content.result

                            if content.outcome:
                                episodic_fact += "\n" + "Outcome:" + str(content.outcome)
                            episodic_facts.append(episodic_fact)

                    except Exception as e:
                        print(f"[MemoryController] Error parsing episodic memory: {e}\nEntry: {r}")



            # Compose tool return message for LLM
            tool_result = (
                "\n".join(
                    list(set(semantic_facts)) +
                    list(set(map_facts)) +
                    list(set(episodic_facts))
                ).strip()
                or "(no relevant memory found)"
            )

            print(f"\t{tool_result}")

            tool_messages.append(
                ToolMessage(tool_call_id=tool_call_id, content=tool_result)
            )

        return {
            "messages": tool_messages,
            "semantic_memory": "\n".join(list(set(semantic_facts))[:MAX_ITEMS]) or "(no relevant semantic memory found)",
            "map_knowledge": "\n".join(list(set(map_facts))[:MAX_ITEMS]) or "(no relevant topographic memory found)",
            "episodic_memory": "\n".join(list(set(episodic_facts))[:MAX_ITEMS]) or "(no relevant episodic memory found)"
        }

    return memory_controller



# --- Graph ---
def build_graph(llm: BaseChatModel, env: TextworldGymEnv) -> CompiledStateGraph:
    decide_node = make_decide_node(llm=llm)
    memory_controller_node = make_memory_controller_node()
    env_node = make_env_node(env=env)
    tool_node = ToolNode(name="ENV_TOOL", tools=TOOLS)
    

    graph = StateGraph(State)
    graph.add_node("DECIDE", decide_node)
    graph.add_node("MEMORY_CONTROLLER", memory_controller_node)
    graph.add_node("ENV_TOOL", tool_node)
    graph.add_node("EXECUTE_ENV", env_node)

    graph.set_entry_point("DECIDE")
    graph.add_conditional_edges("DECIDE", route_after_decide, {
        "MEMORY_CONTROLLER": "MEMORY_CONTROLLER",
        "ENV_TOOL": "ENV_TOOL"
    })
    graph.add_edge("MEMORY_CONTROLLER", "DECIDE")
    graph.add_edge("ENV_TOOL", "EXECUTE_ENV")
    graph.add_conditional_edges("EXECUTE_ENV", check_done)

    return graph.compile(name="LangMemAgent")