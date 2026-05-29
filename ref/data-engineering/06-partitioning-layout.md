# Rule 06 — Partition for How Data Is Queried and Written

> 데이터를 어떻게 조회하고 쓰는지에 맞춰 분할하라.
> Partition data to match how it is queried and written.

## Why

Partitioning is the highest-leverage performance and cost decision in a warehouse or lake: it determines how much data each query scans and how a backfill rewrites only what it must. Poor partitioning produces either full-table scans (slow, expensive) or millions of tiny files (the small-file problem). It is also what makes Rule 01's partition-scoped idempotent writes possible.

## How to apply

- Partition by the column that dominates filtering, usually an event/ingestion date (`ds`).
- Match partition granularity to query and backfill needs; avoid over-partitioning into tiny fragments.
- Pick partition keys that let a backfill overwrite exactly one logical slice at a time.
- Compact small files and target reasonable file sizes (often hundreds of MB) for columnar formats.
- Add clustering/bucketing or sort keys for secondary high-cardinality filters within partitions.
- Push partition pruning down: ensure queries filter on the partition column, not a derived expression.

## Checklist

- [ ] The primary partition key matches the dominant query filter
- [ ] Partition granularity avoids both full scans and tiny-file sprawl
- [ ] A backfill rewrites only the targeted partitions
- [ ] Output file sizes are compacted to a healthy range
- [ ] Common queries demonstrably prune partitions

## References

- Apache Iceberg partitioning — https://iceberg.apache.org/docs/latest/partitioning/
- Delta Lake — https://docs.delta.io/latest/index.html
