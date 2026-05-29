# Rule 09 — Manage ML and Prompt Technical Debt

> 모델과 프롬프트의 기술 부채를 적극적으로 관리하라.
> Actively manage ML and prompt technical debt.

## Why

Sculley et al., "Hidden Technical Debt in Machine Learning Systems" (NeurIPS 2015), shows ML systems accrue debt invisibly through data dependencies, entanglement, hidden feedback loops, and undeclared consumers. Prompts, embeddings, and model versions are configuration that drifts and rots. Treating these as throwaway scripts guarantees expensive, hard-to-trace failures later.

## How to apply

- Version prompts, model IDs, retrieval configs, and eval sets in source control like code.
- Pin model versions explicitly; test before adopting a new model rather than auto-upgrading.
- Track data and feature dependencies; an upstream change can silently break the model (CACE: changing anything changes everything).
- Remove dead prompts, unused features, and stale indices instead of accumulating them.
- Document undeclared consumers of your outputs so changes do not break them downstream.

## Checklist

- [ ] Prompts, model IDs, and configs are version-controlled
- [ ] Model versions are pinned and tested before upgrade
- [ ] Data/feature dependencies are documented
- [ ] Dead prompts and stale indices are pruned

## References

- Sculley et al. 2015, Hidden Technical Debt in ML Systems — https://proceedings.neurips.cc/paper_files/paper/2015/hash/86df7dcfd896fcaf2674f757a2463eba-Abstract.html
- Google Rules of Machine Learning — https://developers.google.com/machine-learning/guides/rules-of-ml
