# Rule 04 — Govern Interfaces with Data Contracts

> 생산자와 소비자 사이의 데이터 인터페이스를 계약으로 못 박아라.
> Pin the data interface between producer and consumer with a contract.

## Why

Most data incidents start as an unannounced upstream change: a renamed column, a type swap, a dropped field. Data contracts shift quality as far upstream as possible by making the producer formally responsible for a stable, versioned interface. This is the structural fix the data-contracts movement and dbt's `contract` enforcement were built to deliver, turning silent breakage into an explicit, owned agreement.

## How to apply

- Define each shared dataset's schema, types, semantics, owner, and SLA as an explicit, version-controlled contract.
- Enforce the contract at the boundary: dbt model contracts, schema registry (Avro/Protobuf), or CI checks that reject violations.
- Assign a named owner accountable for honoring and evolving the contract.
- Treat consumers as customers: communicate changes and deprecations before they ship.
- Validate producer output against the contract in CI so breaches fail before release, not in production.

## Checklist

- [ ] Every shared dataset has a written, versioned contract
- [ ] Schema and types are enforced mechanically at the boundary
- [ ] Each contract names an accountable owner
- [ ] Producer changes are validated against the contract in CI
- [ ] Breaking changes follow a published deprecation path

## References

- dbt model contracts — https://docs.getdbt.com/docs/mesh/govern/model-contracts
- Data Mesh (Martin Fowler) — https://martinfowler.com/articles/data-mesh-principles.html
