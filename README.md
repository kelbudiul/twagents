# 🧠 twagents

**twagents** is a framework for building and comparing **language model agents** with different memory architectures in interactive, text-based environments. It is designed to work with [TextWorld](https://aka.ms/textworld) and focuses on exploring how **working**, **episodic**, and **semantic** memory influence agent behavior, recall, and decision-making.

Rather than relying solely on fixed context windows, `twagents` introduces structured memory components that support **selective recall**, **strategic planning**, and **long-term knowledge accumulation**.

---

## 🤖 Agent Types

### 🔹 Baseline Agent

* **Memory**: Working memory only (recent state context).
* **Behavior**: Acts based solely on the most recent game output.
* **Use Case**: Serves as a minimal memory-free baseline.

### 🔹 Retrieval Agent

* **Memory**: Episodic memory (vector store of past observations).
* **Behavior**: Uses similarity-based recall to recover earlier steps.
* **Use Case**: Tests recall-based planning over time.

### 🔹 LangMem Agent

* **Memory**: Episodic + Semantic memory with tool-assisted recall.
* **Behavior**: Uses dedicated memory tools in a ReAct-style loop to retrieve structured past knowledge and facts.
* **Use Case**: Models higher-level cognitive memory usage and flexible reasoning.

---

## 📁 Project Structure

```
.
├── config.py                 # Global settings and constants
├── requirements.txt          # Required Python packages
├── logs/                     # Game logs and trace data per agent
│
├── src/
│   ├── agents/               # Agent definitions and control loops
│   ├── memory/               # Memory storage and retrieval logic
│   ├── game/                 # TextWorld interaction wrapper
│   ├── tools/                # Memory and environment tools callable by agents
│   └── utils/                # Utility functions and formatting
│
├── notebooks/                # Notebooks for running agents and analysis
│   ├── baseline_runner.ipynb
│   ├── retrieval_runner.ipynb
│   ├── langmem_runner.ipynb
│   └── analysis.ipynb
```

---

## ⚙️ Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/kelbudiul/twagents.git
cd twagents
```

### 2. Create a virtual environment (recommended)

```bash
python -m venv venv
source venv/bin/activate  # or venv\Scripts\activate on Windows
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

### 4. Set environment variables

Create a `.env` file in the root directory (or set variables manually) with the following:

```
OPENAI_API_KEY=your_openai_api_key
LANGCHAIN_API_KEY=your_langchain_api_key
LANGCHAIN_PROJECT=twagents
LANGSMITH_API_KEY=your_langsmith_api_key
```

These are required for interacting with language models and logging tools (e.g., LangSmith).

---

## 🧠 Memory System Overview

| Memory Type     | Purpose                                           | Used By            |
| --------------- | ------------------------------------------------- | ------------------ |
| Working Memory  | Short-term buffer of recent steps                 | All agents         |
| Episodic Memory | Chronological trace of past interactions          | Retrieval, LangMem |
| Semantic Memory | General facts, object properties, and affordances | LangMem            |

---

## 🎯 Project Goals

* Study the role of structured memory in language agent behavior.
* Benchmark agents on memory-intensive tasks in controlled environments.
* Build reusable components for long-term LLM reasoning architectures.

---

## 🙋 Contact

For questions, suggestions, or contributions, please open an [issue](https://github.com/kelbudiul/twagents/issues) or submit a pull request.

