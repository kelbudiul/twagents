
import os

import textworld
from langchain_anthropic import ChatAnthropic
from langchain_core.embeddings.embeddings import Embeddings
from langchain_core.language_models.chat_models import BaseChatModel
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain_ollama import ChatOllama
from langchain_openai import ChatOpenAI, OpenAIEmbeddings
from langgraph.graph.state import CompiledStateGraph
from textworld import gym
from textworld.gym.envs import TextworldGymEnv

from langchain.chat_models import init_chat_model





def get_llm(backend: str, model: str, temperature: float = 0) -> BaseChatModel:    
    return init_chat_model(model, temperature=temperature, model_provider=backend)

    
def get_embeddings(backend: str, model: str) -> Embeddings:
    if backend == "openai":
        return OpenAIEmbeddings(model=model)
    else:
        raise ValueError(f"Unsupported embedding backend: {backend}")
    


def init_game_env(game_path: str, max_steps: int = 50) -> TextworldGymEnv:
    ENV_ID: str = textworld.gym.register_games(
        [game_path],
        request_infos=textworld.EnvInfos(max_score=True, admissible_commands=True, objective=True, inventory=True, description=True, won=True, lost=True, feedback=True, score=True, last_action=True, moves=True, extras=["recipe"]),
        max_episode_steps=max_steps,
    )
    ENV: TextworldGymEnv = gym.make(ENV_ID)
    return ENV


