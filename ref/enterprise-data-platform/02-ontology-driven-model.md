# Rule 02 — Ontology-Driven Model

> 테이블이 아니라 현실 세계의 개념으로 데이터 모델을 설계하라.
> Design the data model around real-world concepts, not around tables.

## Why

Enterprise platforms that model data as raw tables force every downstream application to re-interpret the same raw rows differently, producing inconsistent business logic spread across dozens of services. Palantir Foundry's ontology pattern — object types, properties, link types, and action types — demonstrates that mapping datasets to named business entities (Order, Patient, Asset) and their relationships dramatically reduces integration friction and enables non-technical operators to safely act on data. The ontology becomes a shared, versioned contract that ties data, logic, security, and action together in one place.

## How to apply

- Define an object type for every named business entity before writing pipelines; properties and link types follow from the entity model, not the other way around.
- Express relationships as named, directional link types (e.g., Order — fulfills → Shipment) so graph traversal is built into the model.
- Separate the semantic model (objects and links) from the physical model (storage tables and partitions); the semantic model is stable, the physical model can change.
- Version the ontology schema; breaking changes require a migration plan, not in-place edits.
- Encode business actions (create, approve, close) as first-class action types with their own access controls and audit trails, rather than as raw writes to tables.

## Checklist

- [ ] Every major business entity has a named object type with documented properties
- [ ] Relationships between entities are modelled as named link types, not as implicit foreign keys in queries
- [ ] The semantic model is versioned and change-controlled separately from storage schemas
- [ ] Action types are defined for all writes that carry business intent
- [ ] The ontology is browsable by domain analysts without requiring SQL access

## References

- Palantir, *Foundry Ontology Overview* — https://www.palantir.com/docs/foundry/ontology/overview
- Palantir, *Ontology Core Concepts* — https://www.palantir.com/docs/foundry/ontology/core-concepts
- Martin Kleppmann, *Designing Data-Intensive Applications* (O'Reilly, 2017) — https://dataintensive.net/
