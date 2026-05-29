# Rule 08 — Orchestrate with Explicit Dependencies

> 작업 순서는 명시적 의존성 그래프로 선언하고, 시간에 의존하지 마라.
> Declare task order as an explicit dependency graph, not by timing.

## Why

Pipelines that run "at 2am and hope the upstream finished" fail silently and intermittently. Orchestrators like Airflow and Dagster model work as a directed acyclic graph (DAG) so that a task starts only when its real inputs are ready, retries on transient failure, and surfaces lineage. Explicit dependencies plus retries are what turn fragile cron chains into recoverable, observable systems.

## How to apply

- Express pipelines as a DAG where edges are real data dependencies, not coincidental schedules.
- Trigger downstream tasks on upstream completion or data readiness (sensors / asset materialization), not fixed clock times.
- Configure retries with exponential backoff for transient failures; cap attempts and alert on exhaustion.
- Make each task atomic and idempotent (Rule 01) so the orchestrator can safely re-run it.
- Support targeted backfills and reruns of single tasks or date ranges without rerunning the whole graph.
- Keep orchestration logic out of business transforms; the orchestrator schedules, the transform computes.

## Checklist

- [ ] Task order is defined by data dependencies, not timing
- [ ] Downstream tasks wait on real upstream readiness
- [ ] Transient failures retry with backoff and bounded attempts
- [ ] Any single task or date range can be rerun in isolation
- [ ] Scheduling concerns are separate from transformation logic

## References

- Apache Airflow — https://airflow.apache.org/docs/
- Dagster — https://docs.dagster.io/
