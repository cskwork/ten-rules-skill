# Rule 07 — Trace and Observe Every Call

> 모든 호출을 추적하고 관찰 가능하게 만들어라.
> Trace and make every call observable.

## Why

You cannot improve, debug, or audit what you cannot see, and LLM systems fail silently with plausible-but-wrong output. The NIST AI RMF "Measure" function depends on continuous monitoring of deployed systems. Capturing the full prompt, context, response, latency, cost, and tool calls per request turns mysterious failures into diagnosable events and feeds the eval loop in Rule 01.

## How to apply

- Log every request end to end: inputs, retrieved context, prompt, model version, output, tokens, latency, cost.
- Propagate a correlation/trace ID across retrieval, model, and tool spans for one request.
- Capture user feedback and failure reports and route them into the eval set.
- Monitor RED-style signals (rate, errors, duration) plus token cost and groundedness over time.
- Alert on drift and rate-of-change, not just static thresholds.
- Never log secrets or PII; redact before persistence.

## Checklist

- [ ] Full input/output/context is captured per request
- [ ] Latency, token count, and cost are recorded
- [ ] Requests carry a trace ID across all spans
- [ ] Logs exclude secrets and PII

## References

- NIST AI Risk Management Framework — https://www.nist.gov/itl/ai-risk-management-framework
- Google Rules of Machine Learning — https://developers.google.com/machine-learning/guides/rules-of-ml
