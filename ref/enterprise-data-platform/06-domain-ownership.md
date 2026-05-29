# Rule 06 — Domain Ownership

> 데이터의 품질 책임은 그것을 가장 잘 아는 도메인 팀에 있다.
> Accountability for data quality belongs to the domain team that knows the data best.

## Why

Centralised data engineering teams become bottlenecks in large enterprises because they must acquire domain knowledge to build and maintain pipelines for every business unit. This produces low-quality, poorly-labelled data — teams far from the business do not know what "active customer" means in the context of a specific product line. Data mesh architecture, as defined by Dehghani, shifts ownership to the domain: the team that generates the data is accountable for its quality, freshness, schema stability, and SLA. A platform's job is to make that ownership operable, not to centralise it.

## How to apply

- Assign a named domain data owner (a person or team) to every dataset at registration; the platform rejects datasets without an owner.
- Require domain teams to publish and maintain their own data contracts (see Rule 05) and respond to SLA breach alerts.
- Provide a self-serve infrastructure layer — pipeline scaffolding, schema validators, quality dashboards — so domain teams can operate without a central data engineering ticket queue.
- Make data product health (freshness, row count, quality score) visible to the domain owner in a self-serve dashboard, not only to platform operators.
- Federate governance: each domain follows platform-wide standards (classification, lineage, audit) but owns the content and semantics of their products.

## Checklist

- [ ] Every dataset has a named domain owner recorded in the metadata catalog
- [ ] Domain owners receive automated SLA breach and quality-gate failure alerts
- [ ] Self-serve tooling exists for domain teams to register, validate, and deploy their data products
- [ ] Platform-wide governance standards are enforced automatically, not via central team review
- [ ] Domain ownership is reviewed and reconfirmed at least annually

## References

- Zhamak Dehghani, *Data Mesh: Delivering Data-Driven Value at Scale* (O'Reilly, 2022) — https://www.oreilly.com/library/view/data-mesh/9781492092384/
- Martin Fowler, *Data Mesh Principles and Logical Architecture* — https://martinfowler.com/articles/data-mesh-principles.html
- DAMA International, *DAMA-DMBOK 2nd Edition* — https://dama.org/learning-resources/dama-data-management-body-of-knowledge-dmbok/
