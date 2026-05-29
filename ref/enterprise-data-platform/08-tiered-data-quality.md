# Rule 08 — Tiered Data Quality Gates

> 품질이 검증되지 않은 데이터는 분석 계층에 진입할 수 없다.
> Data that has not passed quality validation must not enter the analytical tier.

## Why

Enterprise platforms often ingest data from dozens of operational systems with inconsistent data practices: duplicated records, null primary keys, timestamp drift, and out-of-range values are endemic. Allowing unvalidated data to flow freely into the analytical tier corrupts dashboards, ML feature stores, and operational decisions. The bronze/silver/gold tier pattern (also called medallion architecture) enforces quality gates between tiers so that analysts and models only consume data that has passed documented quality checks. Quality failures are isolated to lower tiers where they can be investigated and corrected without poisoning production consumers.

## How to apply

- Define at least three tiers: raw/bronze (exactly as received, no quality checks), validated/silver (schema-conformant, referential integrity enforced, outliers flagged), curated/gold (business-rule validated, deduplicated, enriched, contract-compliant).
- Automate quality checks as part of the pipeline between each tier; records that fail a check are routed to a quarantine dataset with a failure reason code, not silently dropped or coerced.
- Publish quality scores (completeness, uniqueness, validity, timeliness) as metadata on every silver and gold dataset, queryable by consumers.
- Gate ML feature ingestion and BI semantic layers to the gold tier only; bronze and silver are for engineering investigation, not business consumption.
- Define minimum acceptable quality thresholds in the data contract; SLA breaches on quality scores alert the domain owner.

## Checklist

- [ ] Bronze, silver, and gold tiers are defined with documented promotion criteria
- [ ] Quality failures route records to a quarantine dataset with a failure reason, not silent discard
- [ ] Quality scores are published as metadata on every silver and gold dataset
- [ ] BI tools and ML feature stores are restricted to gold-tier data sources
- [ ] Data contracts specify minimum quality thresholds; breaches trigger owner alerts

## References

- DAMA International, *DAMA-DMBOK 2nd Edition* — https://dama.org/learning-resources/dama-data-management-body-of-knowledge-dmbok/
- Martin Kleppmann, *Designing Data-Intensive Applications* (O'Reilly, 2017) — https://dataintensive.net/
- Databricks, *What is a Medallion Architecture?* — https://www.databricks.com/glossary/medallion-architecture
