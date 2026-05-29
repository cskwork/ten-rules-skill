# Rule 08 — Engineer Latency and Cost as First-Class Constraints

> 지연시간과 비용을 처음부터 설계 변수로 다뤄라.
> Treat latency and cost as first-class design constraints.

## Why

Token-priced, network-bound model calls make latency and cost product-defining constraints, not afterthoughts; an accurate system nobody can afford or wait for fails in production. Google's Rules of ML favor the simplest model that meets the bar, and right-sizing the model is the highest-leverage lever. Cost and latency must be budgeted and measured like any SLO.

## How to apply

- Set explicit latency and cost-per-request budgets before building, and measure against them.
- Right-size the model: route easy cases to smaller/cheaper models, reserve large models for hard ones.
- Cache deterministic and repeated calls; use prompt caching for stable prefixes.
- Stream responses and parallelize independent calls to cut perceived latency.
- Trim context to what retrieval shows is relevant; long prompts cost tokens and accuracy.
- Set explicit timeouts and retries with backoff on every model and tool call.

## Checklist

- [ ] Latency and cost budgets are defined and tracked
- [ ] Model tier is matched to task difficulty (routing)
- [ ] Caching is applied to repeated or stable calls
- [ ] Every external call has a timeout and bounded retry

## References

- Google Rules of Machine Learning — https://developers.google.com/machine-learning/guides/rules-of-ml
- Anthropic Prompt Engineering — https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/overview
