# Rule 02 — Measure Delivery With the DORA Metrics

> 속도와 안정성을 DORA 지표로 함께 측정하라.
> Measure both speed and stability with the DORA metrics.

## Why

Gut feel is not a strategy. The DORA / Accelerate research (Nicole Forsgren et al.) found four metrics that statistically predict software delivery and organizational performance: deployment frequency, lead time for changes, change failure rate, and failed-deployment recovery time. Velocity and stability are not a trade-off; elite teams improve both together. DORA has since added reliability (meeting SLO targets) as a fifth key, and the 2024 report introduced rework rate as a stability measure alongside change failure rate.

## How to apply

- Instrument all four keys from real pipeline and incident data, not self-reported estimates.
- Treat the metrics as a set: optimizing speed while change failure rate climbs is regression, not progress.
- Benchmark your cluster (Low to Elite) and target the next band, not a vanity number.
- Use the metrics to find the constraint (e.g., long lead time points to batch size or review bottlenecks), then act on the cause.
- Never weaponize the metrics against individuals; they describe the system.

## Checklist

- [ ] The four core DORA keys are collected automatically from tooling (add reliability and rework rate if tooling supports them)
- [ ] Deployment frequency and lead time are reviewed alongside change failure rate and recovery time
- [ ] The team knows its current performance band and its target
- [ ] Metric movements drive a concrete improvement action, not just a dashboard

## References

- DORA — Software Delivery Performance Metrics — https://dora.dev/guides/dora-metrics/
- DORA — History of DORA's metrics (five keys, rework rate) — https://dora.dev/insights/dora-metrics-history/
- Google Cloud — Using the Four Keys — https://cloud.google.com/blog/products/devops-sre/using-the-four-keys-to-measure-your-devops-performance
