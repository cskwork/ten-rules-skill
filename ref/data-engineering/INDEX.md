# Data Engineering — 10 Rules (index)

Source: market-researched synthesis grounded in Ralph Kimball (dimensional modeling), Martin Kleppmann (Designing Data-Intensive Applications), dbt best practices and the medallion/lakehouse pattern, and Zhamak Dehghani (Data Mesh). Data engineering is the discipline of modeling, moving, and serving trustworthy data through reproducible pipelines.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-idempotent-reproducible-pipelines.md` | Idempotent, reproducible, backfillable runs | Any pipeline that writes data, retries, or backfills |
| 02 | `02-dimensional-modeling-grain.md` | Declare the grain; model facts and dimensions | Designing tables, marts, or a warehouse schema |
| 03 | `03-data-quality-tests.md` | Test data; fail loudly on bad data | Adding transforms, marts, or ingestion |
| 04 | `04-data-contracts.md` | Govern producer/consumer interfaces with contracts | Shared datasets crossing team or service boundaries |
| 05 | `05-schema-evolution.md` | Evolve schemas without breaking readers | Changing columns, types, or serialization formats |
| 06 | `06-partitioning-layout.md` | Partition for query and write patterns | Storage layout, performance, or cost tuning |
| 07 | `07-layered-architecture.md` | Layer raw, cleaned, curated (medallion/dbt) | Structuring an ELT/ETL pipeline end to end |
| 08 | `08-orchestration-dependencies.md` | Orchestrate via explicit DAG dependencies | Scheduling, dependencies, retries, backfills |
| 09 | `09-observability-lineage.md` | Observe freshness, volume, and lineage | Monitoring, alerting, debugging, root-cause work |
| 10 | `10-domain-ownership-data-as-product.md` | Data as a product with clear ownership | Cataloging, governance, scaling a data platform |

Default for "build or modify an ELT/ETL pipeline": read 01, 03, 07, 08 at minimum.

## References

- Kimball Group — https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/kimball-techniques/dimensional-modeling-techniques/
- Designing Data-Intensive Applications — https://dataintensive.net/
- dbt best practices — https://docs.getdbt.com/best-practices
- Data Mesh principles — https://martinfowler.com/articles/data-mesh-principles.html
