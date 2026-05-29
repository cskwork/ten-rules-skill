# AI Engineering — 10 Rules (index)

Source: market-researched synthesis grounded in the Anthropic/OpenAI prompt engineering guides, eval-driven development, RAG (Lewis et al.), the NIST AI Risk Management Framework, Google's Rules of ML, and Sculley et al. on ML technical debt. AI engineering is the discipline of building reliable, safe, observable LLM applications.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-evals-before-scaling.md` | Build evals before you scale | quality, regression, model/prompt changes |
| 02 | `02-clear-structured-prompts.md` | Clear, structured, specific prompts | prompt design, output format, examples |
| 03 | `03-ground-answers-rag.md` | Ground answers in retrieved evidence | RAG, knowledge bases, factual Q&A |
| 04 | `04-treat-hallucination-as-default.md` | Hallucination is the default failure mode | factual claims, trust, verification |
| 05 | `05-guardrails-and-validation.md` | Guard inputs and outputs | injection, schema validation, tool access |
| 06 | `06-human-in-the-loop.md` | Human in the loop for high-stakes actions | irreversible/consequential actions, agents |
| 07 | `07-trace-everything.md` | Trace and observe every call | debugging, monitoring, audit, feedback |
| 08 | `08-engineer-latency-and-cost.md` | Latency and cost are first-class constraints | performance, model routing, caching, budget |
| 09 | `09-manage-ml-technical-debt.md` | Manage ML and prompt technical debt | versioning, model upgrades, dependencies |
| 10 | `10-responsible-ai-governance.md` | Govern for responsible, documented AI | bias, privacy, compliance, model cards |

Default for "build or review an LLM feature": read 01, 02, 04, 05 at minimum.
