# Rule 01 — Build Evals Before You Scale

> 규모를 키우기 전에 평가 체계부터 만들어라.
> Build the evaluation before you scale the system.

## Why

Without a measurable eval suite you are tuning prompts and models on vibes, and every change risks silent regression. Google's Rules of Machine Learning (Rule #2) makes metric design a top priority before modeling. Eval-driven development treats a held-out test set of representative inputs plus graded outputs as the contract the system must satisfy.

## How to apply

- Write a labeled eval set of real, representative inputs before optimizing prompts or models.
- Define explicit pass criteria per task: exact-match, rubric score, or LLM-as-judge with a fixed rubric.
- Gate every prompt, model, or retrieval change on the eval suite; never merge a drop.
- Track aggregate score plus per-category slices to catch regressions hidden by averages.
- Version eval sets; grow them with every production failure you observe.

## Checklist

- [ ] A held-out eval set exists and is version-controlled
- [ ] Pass/fail criteria are explicit and reproducible
- [ ] Changes are scored against the suite before release
- [ ] New production failures are added back as eval cases

## References

- Google Rules of Machine Learning — https://developers.google.com/machine-learning/guides/rules-of-ml
- OpenAI Prompt Engineering Guide — https://platform.openai.com/docs/guides/prompt-engineering
