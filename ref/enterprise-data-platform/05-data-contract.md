# Rule 05 — Data Contracts

> 데이터 생산자와 소비자 사이의 약속은 코드로 명시하고 자동으로 검증하라.
> The agreement between data producer and consumer must be explicit in code and verified automatically.

## Why

Enterprise platforms connect dozens of upstream producers to hundreds of downstream consumers. Without a formal contract — specifying schema, field semantics, nullability, SLA, and data-quality guarantees — every schema migration becomes a silent breaking change that manifests as silent incorrect analytics weeks later. A data contract is the domain-level equivalent of an API versioning contract: it moves failures from runtime surprise to pipeline registration time, where they are cheap to fix. This pattern is foundational in data mesh architectures where domain teams publish data products to other domains without a central team mediating every change.

## How to apply

- Define each data product's contract as a machine-readable artifact (YAML or JSON schema) covering: field names and types, required/nullable fields, primary key, partition scheme, row-level SLA (freshness, volume range), and semantic description of each field.
- Validate the contract at pipeline registration and on every pipeline run; fail the pipeline before writing to downstream if the contract is violated.
- Version contracts with semantic versioning; additive changes (new nullable columns) are minor; field removal or type changes are major and require consumer migration windows.
- Store contracts in the platform's metadata catalog, linked to the lineage graph so consumers can discover and subscribe to them.
- Publish contract SLA breaches as observable events that consumer teams receive as alerts, not as silent data gaps.

## Checklist

- [ ] Every published dataset has a machine-readable contract specifying schema, nullability, and freshness SLA
- [ ] Pipeline execution validates the contract before writing output and fails fast on violation
- [ ] Contracts are versioned; breaking changes require a published migration timeline
- [ ] Consumers can subscribe to contract-breach alerts without polling the data
- [ ] Contracts are stored in the metadata catalog linked to lineage

## References

- Zhamak Dehghani, *Data Mesh: Delivering Data-Driven Value at Scale* (O'Reilly, 2022) — https://www.oreilly.com/library/view/data-mesh/9781492092384/
- Martin Fowler, *Data Mesh Principles and Logical Architecture* — https://martinfowler.com/articles/data-mesh-principles.html
- Martin Kleppmann, *Designing Data-Intensive Applications* (O'Reilly, 2017) — https://dataintensive.net/
