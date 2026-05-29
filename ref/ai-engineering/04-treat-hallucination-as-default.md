# Rule 04 — Treat Hallucination as the Default Failure Mode

> 환각은 예외가 아니라 기본값이라 가정하고 설계하라.
> Assume hallucination is the default, and design against it.

## Why

LLMs are trained to produce fluent, plausible text, not to know when they are wrong, so confident fabrication is the expected baseline, not a rare bug. The NIST AI Risk Management Framework names validity and reliability as core trustworthiness characteristics that must be actively measured. Any system that presents model output as fact without verification is shipping a known defect.

## How to apply

- Prefer grounding (Rule 03) and tool/function calls over free recall for any factual claim.
- Require the model to cite sources or return structured fields you can validate downstream.
- Add verification layers: cross-check claims, validate against schemas, or use a second model to critique.
- Calibrate and surface uncertainty; let the model abstain rather than guess.
- Measure a factuality or groundedness score in your eval suite and alert on regressions.

## Checklist

- [ ] Factual claims are grounded or tool-derived, not recalled
- [ ] Outputs are validated against a schema or source before use
- [ ] The system has a defined abstain / "I don't know" path
- [ ] A factuality metric is tracked in evals

## References

- NIST AI Risk Management Framework — https://www.nist.gov/itl/ai-risk-management-framework
- Lewis et al. 2020, Retrieval-Augmented Generation — https://arxiv.org/abs/2005.11401
