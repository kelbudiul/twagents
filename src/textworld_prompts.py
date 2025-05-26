from typing import Sequence, TypedDict, Dict, Any, Optional
from langchain_core.prompts import BasePromptTemplate, PromptTemplate
from langchain_core.prompts import ChatPromptTemplate, MessagesPlaceholder
from langchain_core.messages import AnyMessage, HumanMessage, SystemMessage, ToolMessage
from langchain_core.tools import BaseTool, StructuredTool
from langchain import hub


TEXTWORLD_EXAMPLES = [
    """Setup: You are now playing a fast paced round of TextWorld! Here is your task for
today. First of all, you could, like, try to travel east. After that, take the
binder from the locker. With the binder, place the binder on the mantelpiece.
Alright, thanks!

-= Vault =-
You've just walked into a vault. You begin to take stock of what's here.

An open safe is here. What a letdown! The safe is empty! You make out a shelf.
But the thing hasn't got anything on it. What, you think everything in TextWorld
should have stuff on it?

You don't like doors? Why not try going east, that entranceway is unguarded.

Thought: I need to travel east
Action: Play
Action Input: go east
Observation: -= Office =-
You arrive in an office. An ordinary one.

You can make out a locker. The locker contains a binder. You see a case. The
case is empty, what a horrible day! You lean against the wall, inadvertently
pressing a secret button. The wall opens up to reveal a mantelpiece. You wonder
idly who left that here. The mantelpiece is standard. The mantelpiece appears to
be empty. If you haven't noticed it already, there seems to be something there
by the wall, it's a table. Unfortunately, there isn't a thing on it. Hm. Oh well
There is an exit to the west. Don't worry, it is unguarded.

Thought: I need to take the binder from the locker
Action: Play
Action Input: take binder
Observation: You take the binder from the locker.

Thought: I need to place the binder on the mantelpiece
Action: Play
Action Input: put binder on mantelpiece
Observation: You put the binder on the mantelpiece.
Your score has just gone up by one point.
*** The End ***
Thought: The game has ended
Final Answer: done

"""
]

SUFFIX = """Begin! \n\nSetup: {input}
{agent_scratchpad}"""

# TEXTWORLD_EXAMPLES_PROMPT = PromptTemplate.from_examples(
#     TEXTWORLD_EXAMPLES, SUFFIX, ["input", "agent_scratchpad"]
# )

GVS_TEXTWORLD_PROMPT = \
'''Please help me choose actions to navigate a TextWorld game.
At each turn, you will be given the output from the game 
and should choose a next action to perform in the game world to try to achieve the overall goal from the game,
which is described during the first turn.
You interact with the game by calling one of the available tool functions. 

Before choosing an action, you should think about what to do, based on the current state of the game world and the goal you are trying to achieve.
State your reasoning using the following format:

Game State:
 A brief summary of the current state of the game world. Summarize what you know about the current state of the game world.
  This summary should be one or two sentences at most.

Goals:
 A very concise summary of your current goals in the game world.
 Mention your overall goal in one short phrase, then list any subgoals that you are currently pursuing that will help you achieve your overall goal.

Thoughts:
 Suggest a strategy for making progress toward your current sub-goals, and explain why you think it is a good idea.

When thinking about what action to take next, consider the following:

* Missing items - Are there any required items (e.g. ingredients, appliances) that you are missing?
 Have you already seen them somewhere in this game? If not, where might they be found?

* Locations - If you have seen something that you need now but it isn't in the current room, where did you see it?

* Unexplored containers - Have you seen container objects that you haven't opened yet?

* Unexplored exits - Have you seen doorways or other paths you haven't explored yet?

* Looping - Are you stuck in a loop, performing the same actions over and over again? If so, what other actions could you try?

After explaining your reasoning, you should call a tool function to perform your chosen action in the game world.

'''

GVS_COT_PROMPT = \
'''Please help me to navigate a TextWorld game.
At each turn, you will be given the output from the game 
and should analyze the game state and suggest a strategy 
for getting closer to achieving the overall goal for the game.

The overall goal of the game is: to cook a meal and eat it.

To help me choose an action, you should think about what to do,
 based on the current state of the game world and the goal you are currently trying to achieve.

 When thinking about what actions to take next, consider the following:

* Missing items - Are there any required items (e.g. ingredients, appliances) that you are missing?
 Have you already seen them somewhere in this game? If not, where might they be found?

* Locations - If you have seen something that we need now but it isn't in the current room, where did you see it?

* Unexplored containers - Have you seen container objects that haven't been opened yet?

* Unexplored exits - Have you seen doorways or other paths we haven't explored yet?

* Looping - Are we stuck in a loop, performing the same actions over and over again?
 If so, what other actions could we try?

State your reasoning using the following format:

Game State:
 A brief summary of the current state of the game world. Summarize what you know about the current state of the game world.
  This summary should be one or two sentences at most.

Goals:
 A very concise summary of your current goals in the game world.
 Mention your main goal in one short phrase,
 then list any subgoals that you are currently pursuing that will help us achieve the overall goal.

Thoughts:
 Suggest a strategy for making progress toward your current sub-goals, and explain why you think it is a good idea.

'''

GVS_TOOL_ACTION_PROMPT = \
'''Please help me choose actions to navigate a TextWorld game.
At each turn, you will be given the history of output from the game 
plus an analysis of the current state of the game world and thoughts about the goals we are trying to achieve.
You interact with the game by calling one of the available tool functions, 
and should choose a next action to perform in the game world by selecting one of them. 
'''

EXTRA_INSTRUCTIONS = "\n\n" + "Don't quit the game until you have prepared a meal and eaten it."

EXTRA_INSTRUCTIONS_2 = "\n\n" + "You should call *EXACTLY ONE* tool at each turn. DO NOT call multiple tools in a single turn."

COOKING_INSTRUCTIONS_1 = "\n\n" + \
    "To fry something, cook it with a stove. \n\n" + \
    "To roast something, cook it with an oven. \n\n" + \
    "To bake something, cook it with an oven. \n\n" + \
    "To grill something, cook it with a BBQ."

COOKING_INSTRUCTIONS_2 = "\n\n" + \
    "Something is cooked if it is roasted, baked, grilled or fried. \n" + \
    "If the recipe requires cooking an ingredient, but it is already cooked, you should use it as is, without cooking it again."

COOKING_INSTRUCTIONS_3 = "\n\n" + \
    "In order to cook something, you need to be carrying it (don't put it in the oven or on the stove)."

def create_textworld_agent_prompt(tools: Sequence[BaseTool]) -> BasePromptTemplate:
    """Return default prompt."""
    if True:
        # prompt = hub.pull("hwchase17/react")
        # prompt = hub.pull("hwchase17/structured-chat-agent")
        prompt = hub.pull("hwchase17/openai-tools-agent")

        print("default.prompt=", prompt)
        print("--------------\n")
        promptTW = PromptTemplate.from_examples(   # ChatPromptTemplate.from_messages(
            TEXTWORLD_EXAMPLES, SUFFIX,
            ["input", "agent_scratchpad"], #, "tools", "tool_names"],
            prefix=GVS_TEXTWORLD_PROMPT)

        print("GvsTextWorldAgent prompt=", promptTW)
        #prompt = promptTW
        print("\n--------------\nUsing prompt:\n")
        print(prompt)

        return prompt
    # else:
    #     return TEXTWORLD_EXAMPLES_PROMPT


def get_textworld_objective():
    goal_text = "You are hungry! Let's cook a delicious meal. Check the cookbook in the kitchen for the recipe. Once done, enjoy your meal!"
    goal_text = goal_text.replace("Check", "Read")
    return goal_text


def get_textworld_extra_tips():
    return EXTRA_INSTRUCTIONS + EXTRA_INSTRUCTIONS_2


def get_cooking_instructions():
    cooking_text = COOKING_INSTRUCTIONS_1 + COOKING_INSTRUCTIONS_2 + COOKING_INSTRUCTIONS_3
    return cooking_text


def get_textworld_instructions():
    instruct_text = get_textworld_objective()
    instruct_text += get_textworld_extra_tips()
    instruct_text += get_cooking_instructions()
    return instruct_text


def create_select_action_prompt(tools: Sequence[BaseTool]) -> BasePromptTemplate:
    """Return a prompt for choosing a game action based on the current (analyzed) game state."""
    return ChatPromptTemplate.from_messages([
        ('system', GVS_TOOL_ACTION_PROMPT + EXTRA_INSTRUCTIONS_2),
        # *examples  # examples for few-shot prompting
        ('placeholder', "{messages}"), # message history
                    #MessagesPlaceholder(variable_name="messages"),  # message history
    ])


def create_game_observation_prompt():
    """Return a prompt for analyzing the most recent observation from the game.
    Output from the LLM should be an AI message that analyzes the game state
      and suggests strategy for the next action."""

    return ChatPromptTemplate.from_messages([
        ('system', GVS_COT_PROMPT),
        ('placeholder', "{messages}"), # message history
        ('human', "{observation}"),  # most recent observation will be supplied by a chained placeholder (RunnablePassThrough)
    ])
