from pydantic import BaseModel, Field
from langchain.agents import tool


class Reasoned(BaseModel):
    reasoning: str = Field(
        ...,
        description="Free-form rationale, strategy, or justification for the agent's decision or belief."
    )


class DirectionInput(Reasoned):
    direction: str = Field(..., description="Direction to move (north, south, east, west)")

@tool("go", args_schema=DirectionInput)
def go(direction: str, reasoning:str) -> str:
    """Move in the specified direction (north, south, east, west)."""
    return f"go {direction}"

class TakeDropInput(Reasoned):
    item: str = Field(..., description="Name of item to take or drop")

@tool("take", args_schema=TakeDropInput)
def take(item: str, reasoning: str) -> str:
    """Pick up an item and add it to your inventory."""
    return f"take {item}"

@tool("drop", args_schema=TakeDropInput)
def drop(item: str, reasoning: str) -> str:
    """Drop an item from your inventory onto the ground."""
    return f"drop {item}"

class OpenInput(Reasoned):
    container: str = Field(..., description="Name of container or door to open")

@tool("open", args_schema=OpenInput)
def open_container(container: str, reasoning: str) -> str:
    """Open a visible container or door."""
    return f"open {container}"

class InsertInput(Reasoned):
    item: str = Field(..., description="Item to insert")
    container: str = Field(..., description="Container to insert item into")

@tool("put_in", args_schema=InsertInput)
def put_in(item: str, container: str, reasoning: str) -> str:
    """Put an item into a container."""
    return f"put {item} in {container}"

class PutOnInput(Reasoned):
    item: str = Field(..., description="Item to place")
    surface: str = Field(..., description="Surface to place item on")

@tool("put_on", args_schema=PutOnInput)
def put_on(item: str, surface: str, reasoning: str) -> str:
    """Place an item on top of another object (e.g., put plate on table)."""
    return f"put {item} on {surface}"

class TakeFromInput(Reasoned):
    item: str = Field(..., description="Item to take")
    container: str = Field(..., description="Container to take item from")

@tool("take_from", args_schema=TakeFromInput)
def take_from(item: str, container: str, reasoning: str) -> str:
    """Take an item out of a container."""
    return f"take {item} from {container}"

class CookInput(Reasoned):
    ingredient: str = Field(..., description="Ingredient to cook")
    appliance: str = Field(..., description="Cooking appliance (oven, stove, BBQ)")

@tool("cook", args_schema=CookInput)
def cook(ingredient: str, appliance: str, reasoning: str) -> str:
    """Cook an ingredient using a specified appliance (e.g., oven, stove)."""
    return f"cook {ingredient} with {appliance}"

class CutInput(Reasoned):
    verb: str = Field(..., description="cutting verb: slice, dice, chop")
    ingredient: str = Field(..., description="Ingredient to cut")
    sharp_object: str = Field(..., description="Cutting tool, e.g., knife")

@tool("cut", args_schema=CutInput)
def cut(verb: str, ingredient: str, sharp_object: str, reasoning: str) -> str:
    """Cut an ingredient using a tool and specified verb (e.g., slice apple with knife)."""
    return f"{verb} {ingredient} with {sharp_object}"

class ExamineInput(Reasoned):
    game_object: str = Field(..., description="Object to examine (or read, e.g. cookbook)")

@tool("examine", args_schema=ExamineInput)
def examine(game_object: str, reasoning: str) -> str:
    """Look at or read an object in the environment (e.g., cookbook, recipe)."""
    return f"examine {game_object}"

class PrepareMealInput(Reasoned):
    pass

@tool("prepare_meal", args_schema=PrepareMealInput)
def prepare_meal(reasoning: str) -> str:
    """Assemble a meal from cooked ingredients."""
    return "prepare meal"

class EatMealInput(Reasoned):
    pass

@tool("eat_meal", args_schema=EatMealInput)
def eat_meal(reasoning: str) -> str:
    """Eat the prepared meal to complete the goal."""
    return "eat meal"

TOOLS = [
    go, take, drop, open_container, put_in, put_on, take_from, cook, cut,
    examine, prepare_meal, eat_meal
]

# --- LANGMEM specific tools ---

class search_episodic_memory(Reasoned):
    """Retrieve specific past observations or actions from the current game episode."""
    query: str = Field(
        ...,
        description=(
            "A descriptive string that represents what the agent aims to recall from earlier steps in the current episode. "
            "This is not a question, but a natural-language statement that reflects the kind of observation or event the agent is trying to retrieve. "
            "It may include full or partial sentences, ideally reusing key terms or phrases from the current observation to ensure effective semantic similarity matching.\n\n"
            "Examples:\n"
            "- 'You open the fridge. Inside, you see a sliced onion and a bottle of milk.'\n"
            "- 'The kitchen smells of smoke. The oven door is slightly ajar.'\n"
            "- 'You picked up the cilantro from the countertop.'\n"
            "- 'The knife is on the table, next to a cutting board with chopped vegetables.'\n"
            "- 'You try to go north, but the door is locked.'"
        )
    )
    
class search_semantic_memory(Reasoned):
    """Retrieve general world knowledge, room layout, or object relations."""
    query: str = Field(..., description="What the agent wants to know about the world or objects.")
