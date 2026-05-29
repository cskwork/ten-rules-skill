# Rule 10 — Operational Observability

> 파이프라인이 조용히 실패하면, 잘못된 데이터가 이미 결정을 오염시킨 뒤다.
> When a pipeline fails silently, bad data has already contaminated decisions.

## Why

Data pipelines have a failure mode unique to this industry: they often succeed operationally (no exception thrown, job completes) but produce incorrect output — wrong row counts, stale snapshots, duplicated records. Traditional infrastructure monitoring (CPU, memory, uptime) does not detect these data-quality failures. Enterprise platforms require a second observability layer that treats data health as a first-class signal alongside compute health: measuring freshness, row-count deviation, null-rate change, and schema drift continuously, not only on-demand. Without this, SLA breaches are discovered by downstream users hours or days after they occur.

## How to apply

- Instrument every pipeline with RED metrics (Rate: rows processed per run, Errors: failed records and job failures, Duration: end-to-end latency) emitted to a central metrics store.
- Add data-health checks as post-run assertions: expected row count range, null rate below threshold, primary key uniqueness, freshness within SLA window; treat assertion failure as a pipeline failure.
- Publish a data-health status endpoint per dataset (freshness, last successful run, quality score) consumable by downstream monitoring without querying the data itself.
- Alert domain owners on SLA-breach conditions (stale data, row-count anomaly) through the same channel as infrastructure alerts, not a separate data-quality portal.
- Maintain a pipeline dependency graph so that when an upstream dataset degrades, all transitively dependent downstream datasets are identified and their owners notified automatically.

## Checklist

- [ ] Every pipeline emits Rate, Error, and Duration metrics to a central metrics store
- [ ] Post-run data-health assertions (row count, null rate, freshness) run on every execution and fail the job on breach
- [ ] A data-health status endpoint exists for each published dataset
- [ ] Domain owners receive SLA-breach alerts through operational alert channels, not a separate portal
- [ ] A pipeline dependency graph exists and drives cascading-failure notifications

## References

- Martin Kleppmann, *Designing Data-Intensive Applications* (O'Reilly, 2017) — https://dataintensive.net/
- DAMA International, *DAMA-DMBOK 2nd Edition* — https://dama.org/learning-resources/dama-data-management-body-of-knowledge-dmbok/
- Google, *Site Reliability Engineering: How Google Runs Production Systems* (O'Reilly, 2016), Chapter 6: Monitoring Distributed Systems — https://sre.google/sre-book/monitoring-distributed-systems/
