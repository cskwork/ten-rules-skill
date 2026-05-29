# Rule 01 — Make Pipelines Idempotent and Reproducible

> 파이프라인은 몇 번을 다시 돌려도 같은 결과를 내야 한다.
> A pipeline must produce the same result no matter how many times it is re-run.

## Why

Pipelines fail, retry, and get backfilled. If a re-run double-counts rows or drifts from the first run, every downstream number becomes untrustworthy. Idempotency is the foundational reliability property of data engineering: it is what makes retries, backfills, and recovery safe. Without it, no other rule below can be relied on.

## How to apply

- Make every write idempotent: use overwrite-by-partition, MERGE/upsert on a stable business key, or delete-then-insert scoped to the run's partition.
- Never append blindly; an `INSERT` that runs twice must not create duplicates.
- Parameterize every run by a logical interval (e.g. `ds`/`execution_date`), not by wall-clock `now()`.
- Keep transformations pure: same input partition plus same code equals same output, with no hidden state.
- Pin code, config, and dependency versions so a historical run can be reproduced exactly.
- Design backfills to reprocess any past partition without touching unrelated data.

## Checklist

- [ ] Running the same task twice yields identical output (row count and values)
- [ ] Writes target a partition or key range that the run fully owns
- [ ] No transformation reads `now()`, random, or sequence values non-deterministically
- [ ] A single past partition can be backfilled in isolation
- [ ] Code and dependency versions are pinned and recorded per run

## References

- Apache Airflow — https://airflow.apache.org/docs/
- dbt incremental models — https://docs.getdbt.com/docs/build/incremental-models
