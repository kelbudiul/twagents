GPT_4O_MINI = "gpt-4o-mini-2024-07-18"
GPT_41 = "gpt-4.1"


LLM_MODEL = GPT_4O_MINI
LLM_TEMPERATURE = 0.3
LLM_BACKEND = "openai"
LLM_MAX_TOKENS = 512
EMBEDDINGS_MODEL = "text-embedding-ada-002"
EMBEDDINGS_BACKEND = "openai"

DEFAULT_MAX_STEPS = 35


# Mapping of difficulty levels (string key) to their corresponding max steps (integer value)
DIFFICULTY_MAX_STEPS_MAP = {
    "easy": 20,
    "medium": 25,
    "challenging": 35,
    "hard": 40,
    "very_hard": 45
}

LOG_DIR = "logs"

NUM_EPISODES = 4

GAMES = [
    # {
    #     "name": "tw-cooking-recipe1+take1+cook-xW11fkvmtmZUxng",
    #     "path": "memgames/tw-cooking-recipe1+take1+cook-xW11fkvmtmZUxng.z8",
    #     "difficulty": "easy"
    # },
    # {
    #     "name": "tw-cooking-recipe1+take1+cut-W5NyHaWWHY2nh3Vj",
    #     "path": "memgames/tw-cooking-recipe1+take1+cut-W5NyHaWWHY2nh3Vj.z8",
    #     "difficulty": "easy"
    # },
    # {
    #     "name": "tw-cooking-recipe1+cook-3E3oUL6ehg5oTb0o",
    #     "path": "memgames/tw-cooking-recipe1+cook-3E3oUL6ehg5oTb0o.z8",
    #     "difficulty": "easy"
    # },
    # {
    #     "name": "tw-cooking-recipe2+cut+go6-6e6viWW5HQkxHGqq",
    #     "path": "memgames/tw-cooking-recipe2+cut+go6-6e6viWW5HQkxHGqq.z8",
    #     "difficulty": "easy"
    # },
    # {
    #     "name": "tw-cooking-recipe3+cut+go9-2N8qfOdquplPCBEl",
    #     "path": "memgames/tw-cooking-recipe3+cut+go9-2N8qfOdquplPCBEl.z8",
    #     "difficulty": "easy"
    # },
    # {
    #     "name": "tw-cooking-recipe2+take2+cut-7Qa8fDPLcedOs85n",
    #     "path": "memgames/tw-cooking-recipe2+take2+cut-7Qa8fDPLcedOs85n.z8",
    #     "difficulty": "medium"
    # },
    # {
    #     "name": "tw-cooking-recipe2+take2+cook-0bWECWaGSg9RT6em",
    #     "path": "memgames/tw-cooking-recipe2+take2+cook-0bWECWaGSg9RT6em.z8",
    #     "difficulty": "medium"
    # },
    # {
    #     "name": "tw-cooking-recipe3+take3+cook-xQ0of98VFPlOfpvD",
    #     "path": "memgames/tw-cooking-recipe3+take3+cook-xQ0of98VFPlOfpvD.z8",
    #     "difficulty": "medium"
    # },
    # {
    #     "name": "tw-cooking-recipe3+take3+cook+go6-1Bxocqj2TJM9t7d7",
    #     "path": "memgames/tw-cooking-recipe3+take3+cook+go6-1Bxocqj2TJM9t7d7.z8",
    #     "difficulty": "medium"
    # },
    # {
    #     "name": "tw-cooking-recipe3+take3+cut+go6-m67BIYnEUElZI3Ey",
    #     "path": "memgames/tw-cooking-recipe3+take3+cut+go6-m67BIYnEUElZI3Ey.z8",
    #     "difficulty": "medium"
    # },
    # {
    #     "name": "tw-cooking-recipe2+take2+cook+cut-me7xiaQyI3JQiZ3j",
    #     "path": "memgames/tw-cooking-recipe2+take2+cook+cut-me7xiaQyI3JQiZ3j.z8",
    #     "difficulty": "challenging"
    # },
    # {
    #     "name": "tw-cooking-recipe3+take3+cook+cut-bRoRtWeZho95hq8o",
    #     "path": "memgames/tw-cooking-recipe3+take3+cook+cut-bRoRtWeZho95hq8o.z8",
    #     "difficulty": "challenging"
    # },
    # {
    #     "name": "tw-cooking-recipe3+take3+cook+cut+go6-3WmRUrBDte20ClWE",
    #     "path": "memgames/tw-cooking-recipe3+take3+cook+cut+go6-3WmRUrBDte20ClWE.z8",
    #     "difficulty": "challenging"
    # },
    # {
    #     "name": "tw-cooking-recipe2+take2+cook+cut+go6-B1VlILgKC3LBt7d1",
    #     "path": "memgames/tw-cooking-recipe2+take2+cook+cut+go6-B1VlILgKC3LBt7d1.z8",
    #     "difficulty": "challenging"
    # },
    # {
    #     "name": "tw-cooking-recipe4+take3+cook+cut+go6-GmR8hxxdI8EnCZj8",
    #     "path": "memgames/tw-cooking-recipe4+take3+cook+cut+go6-GmR8hxxdI8EnCZj8.z8",
    #     "difficulty": "challenging"
    # },
    # {
    #     "name": "tw-cooking-recipe3+take3+go6-gbQCRZEfgZBUg8X",
    #     "path": "memgames/tw-cooking-recipe3+take3+go6-gbQCRZEfgZBUg8X.z8",
    #     "difficulty": "hard"
    # },
    # {
    #     "name": "tw-cooking-recipe3+take3+cut+go9-pxWLSnxJiBxgtJxe",
    #     "path": "memgames/tw-cooking-recipe3+take3+cut+go9-pxWLSnxJiBxgtJxe.z8",
    #     "difficulty": "hard"
    # },
    # {
    #     "name": "tw-cooking-recipe3+take3+go9-JeZQSLxqCWBDtXq5",
    #     "path": "memgames/tw-cooking-recipe3+take3+go9-JeZQSLxqCWBDtXq5.z8",
    #     "difficulty": "hard"
    # },
    # {
    #     "name": "tw-cooking-recipe3+take3+cut+go12-aZpQCWvNs5kvIa3N",
    #     "path": "memgames/tw-cooking-recipe3+take3+cut+go12-aZpQCWvNs5kvIa3N.z8",
    #     "difficulty": "hard"
    # },
    # {
    #     "name": "tw-cooking-recipe3+take3+cook+go9-qydpu0eNhMdoIRD8",
    #     "path": "memgames/tw-cooking-recipe3+take3+cook+go9-qydpu0eNhMdoIRD8.z8",
    #     "difficulty": "hard"
    # },
    # {
    #     "name": "tw-cooking-recipe3+take3+cook+cut+go12-vYkMIv1GcngqcgYZ",
    #     "path": "memgames/tw-cooking-recipe3+take3+cook+cut+go12-vYkMIv1GcngqcgYZ.z8",
    #     "difficulty": "very_hard"
    # },
    # {
    #     "name": "tw-cooking-recipe3+cook+cut+go9-XQ2ZC7bEH2ZBtMyW",
    #     "path": "memgames/tw-cooking-recipe3+cook+cut+go9-XQ2ZC7bEH2ZBtMyW.z8",
    #     "difficulty": "very_hard"
    # },
    # {
    #     "name": "tw-cooking-recipe3+take3+cook+cut+go9-o3LjCZRid5xs5lX",
    #     "path": "memgames/tw-cooking-recipe3+take3+cook+cut+go9-o3LjCZRid5xs5lX.z8",
    #     "difficulty": "very_hard"
    # },
    # {
    #     "name": "tw-cooking-recipe5+take5+cook+cut+go6-7K2xSVY3Fa79I6jZ",
    #     "path": "memgames/tw-cooking-recipe5+take5+cook+cut+go6-7K2xSVY3Fa79I6jZ.z8",
    #     "difficulty": "very_hard"
    # },
    # {
    #     "name": "tw-cooking-recipe5+take4+cook+cut+go9-WEbyFZqrS7pQF1gM",
    #     "path": "memgames/tw-cooking-recipe5+take4+cook+cut+go9-WEbyFZqrS7pQF1gM.z8",
    #     "difficulty": "very_hard"
    # },
    # {
    #     "name": "tw-cooking-recipe2+take2+cook+cut+go9-XLg0fev2iK3gsXpX",
    #     "path": "memgames/tw-cooking-recipe2+take2+cook+cut+go9-XLg0fev2iK3gsXpX.z8",
    #     "difficulty": "very_hard"
    # }
]




