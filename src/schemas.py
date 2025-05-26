from pydantic import BaseModel, Field
from typing import Optional

class SemanticFact(BaseModel):
    entity: str = Field(
        ..., 
        description=(
            "The primary object or concept being described in this fact. "
            "This is usually a tangible item, location, or functional object observed in the environment. "
            "Examples: 'knife', 'fridge', 'pantry', 'cookbook'."
        )
    )
    attribute: str = Field(
        ..., 
        description=(
            "The property, state, or capability attributed to the entity. "
            "Use structured and meaningful forms such as:\n"
            "- 'is_sliced', 'is_open', 'is_cooked' for boolean or state properties\n"
            "- 'can_cut', 'can_cook', 'can_open' for affordances\n"
            "- 'contains', 'is_on', 'is_in' for spatial or content relations\n"
            "Avoid vague attributes like 'is' unless clearly contextualized."
        )
    )
    value: Optional[str] = Field(
        None, 
        description=(
            "The value or object associated with the attribute, if applicable. "
            "This could be:\n"
            "- A boolean value ('true', 'false') for state flags (e.g., 'is_open': 'true')\n"
            "- A target object for relations (e.g., 'knife' is_on 'table')\n"
            "- A descriptive qualifier (e.g., 'temperature': 'hot')\n"
            "Leave blank if the attribute fully encodes the state (e.g., 'is_sliced' may not need a value)."
        )
    )


class Step(BaseModel):
    episode: int = Field(default=0, description="The current episode number within the game.")
    step: int = Field(default=0, description="The step number within the current episode.")
    observation: str = Field(..., description="The agent's observation of the game state at this step.")
    action: str = Field(..., description="The action decided and issued by the agent.")
    result: str = Field(
    ..., 
    description=(
        "The feedback or response from the game environment after the agent’s action. "
        "This may include changes in state, score updates, consequences of success or failure, "
        "or confirmation messages. Can reflect either positive, negative, or neutral outcomes."
    )
    )
    outcome: Optional[str] = Field(
    ..., description=(
    "Outcome classification of the current step. Possible values:\n"
        "- SUCCESS: Meaningful progress toward the objective.\n"
        "- WIN: Game completed in a winning state.\n"
        "- MILD_PROGRESS: Small but positive advancement.\n"
        "- FAILURE: Irreversible mistake or misstep.\n"
        "- LOST: Game-ending failure.\n"
        "- BLOCKED: Attempted action was invalid or impossible.\n"
        "- WASTED: Action was unnecessary or redundant.\n"
        "- LOOP: Repetitive and unproductive behavior.\n"
        "- NO_OP: Action had no effect.\n"
        "- UNKNOWN: Outcome could not be determined due to ambiguity or error."
    ))

class TopographicRelation(BaseModel):
    place: str = Field(..., description="The source room or location (e.g., 'kitchen').")
    direction: str = Field(..., description="Direction from source (e.g., 'north', 'upstairs').")
    connects_to: str = Field(..., description="Destination room (e.g., 'pantry').")
    
    relation_type: str = Field(
        default="adjacency",
        description="Type of spatial relation (e.g., 'adjacency', 'entrance', 'stairs', 'exit')."
    )

    obstacle: Optional[str] = Field(
        default=None,
        description="If present, describes an obstacle preventing movement (e.g., 'locked door')."
    )

    access_condition: Optional[str] = Field(
        default=None,
        description="A requirement to traverse this connection (e.g., 'needs key')."
    )