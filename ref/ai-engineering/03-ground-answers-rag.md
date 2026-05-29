# Rule 03 — Ground Answers in Retrieved Evidence

> 모델의 기억이 아니라 검색된 근거에 답을 묶어라.
> Ground answers in retrieved evidence, not model memory.

## Why

A frozen model cannot know your private, recent, or proprietary facts, and asking it to recall them invites fabrication. Retrieval-augmented generation (RAG), introduced by Lewis et al. (2020), pairs parametric model knowledge with a non-parametric external store so answers cite live, authoritative data. Grounding is the primary structural defense against hallucination on knowledge-intensive tasks.

## How to apply

- Retrieve relevant passages from an authoritative store and put them in context before generation.
- Instruct the model to answer only from provided context and to say "not in the sources" otherwise.
- Return citations or source IDs with every claim so answers are auditable.
- Tune chunking, embeddings, and top-k against retrieval metrics (recall@k), not guesswork.
- Refresh and re-index the store so retrieval reflects current reality.
- Separate retrieval quality failures from generation failures when debugging.

## Checklist

- [ ] Answers are constrained to retrieved context
- [ ] Each answer carries traceable source citations
- [ ] Retrieval quality is measured (recall@k or similar)
- [ ] The model abstains when the answer is not in the sources

## References

- Lewis et al. 2020, Retrieval-Augmented Generation — https://arxiv.org/abs/2005.11401
- Google Rules of Machine Learning — https://developers.google.com/machine-learning/guides/rules-of-ml
