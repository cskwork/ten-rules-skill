# Rule 07 — Layer Transformations: Raw, Cleaned, Curated

> 원천을 보존하고, 정제와 가공을 분리된 계층으로 쌓아라.
> Preserve the source and stack cleaning and curation as separate layers.

## Why

Mixing ingestion, cleaning, and business logic in one step makes pipelines impossible to debug or reprocess. The medallion architecture (Bronze, Silver, Gold), popularized by Databricks, and dbt's staging/intermediate/marts convention both encode the same durable principle: progressively refine data through named layers, each with a clear contract. Keeping raw data immutable means you can always rebuild downstream from source.

## How to apply

- Land raw source data unchanged and immutable (Bronze / staging) so any downstream layer is rebuildable.
- Clean, deduplicate, conform types, and validate in the middle layer (Silver / intermediate).
- Build business-level aggregates and serving tables in the top layer (Gold / marts).
- Keep each layer single-purpose; never reach across layers or skip them with ad-hoc logic.
- Make every layer derivable solely from the layer below, so a full rebuild is deterministic.
- Apply Rule 03 data-quality gates between layers, not just at the end.

## Checklist

- [ ] Raw landed data is immutable and replayable
- [ ] Cleaning/conforming is isolated in a middle layer
- [ ] Business logic and aggregates live only in the serving layer
- [ ] Each layer is fully derivable from the one below
- [ ] Quality checks gate the transitions between layers

## References

- Databricks medallion architecture — https://www.databricks.com/glossary/medallion-architecture
- dbt project structure best practices — https://docs.getdbt.com/best-practices/how-we-structure/1-guide-overview
