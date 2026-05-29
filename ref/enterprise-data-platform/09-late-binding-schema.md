# Rule 09 — Late-Binding Schema

> 저장 방식과 조회 방식을 분리하면, 스키마 변경이 소비자를 깨뜨리지 않는다.
> Separating how data is stored from how it is queried means schema changes do not break consumers.

## Why

Enterprise data platforms accumulate consumers over years; a single gold-tier dataset may serve thirty downstream reports, five ML pipelines, and two external API feeds simultaneously. Coupling the physical storage schema tightly to the consumer query schema means every upstream schema change forces a coordinated migration of all consumers — an operational impossibility at scale. Kleppmann's treatment of schema evolution in *Designing Data-Intensive Applications* establishes late-binding (schema-on-read, view layers, and format evolution via Avro/Protobuf) as the correct approach for systems with many independent readers. The storage layer evolves independently; consumers bind to a stable logical view.

## How to apply

- Expose datasets to consumers through versioned logical views or semantic layer definitions, not direct table access; physical table renames or repartitions do not affect consumers.
- Use schema evolution-capable serialisation formats (Apache Avro, Protobuf, or Parquet with schema registry) for all inter-system data exchange; new optional fields are backward-compatible, field removals require a deprecation window.
- Register all physical schema changes in the platform's schema registry with a version number and changelog entry.
- Provide consumers a compatibility check tool: before a schema change ships, it reports which downstream views or contracts would break.
- Never delete a physical field that a published view or contract references; deprecate it with a sunset date and replace it in a minor schema version first.

## Checklist

- [ ] Consumers access data through versioned logical views, not direct physical tables
- [ ] All inter-system exchange uses a schema-registry-backed format (Avro, Protobuf, or Parquet with registry)
- [ ] Physical schema changes are registered and versioned before deployment
- [ ] A compatibility check runs against active consumer contracts before any schema change merges
- [ ] Field removal follows a documented deprecation-and-sunset process

## References

- Martin Kleppmann, *Designing Data-Intensive Applications* (O'Reilly, 2017), Chapter 4: Encoding and Evolution — https://dataintensive.net/
- Palantir, *Foundry Ontology Overview* — https://www.palantir.com/docs/foundry/ontology/overview
- Zhamak Dehghani, *Data Mesh: Delivering Data-Driven Value at Scale* (O'Reilly, 2022) — https://www.oreilly.com/library/view/data-mesh/9781492092384/
