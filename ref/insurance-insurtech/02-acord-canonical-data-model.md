# Rule 02 — ACORD Canonical Data Model

> 보험 데이터는 ACORD 표준을 단일 진실 공급원으로 삼아야 통합 비용이 사라진다.
> Insurance data must treat ACORD standards as the single source of truth to eliminate integration cost.

## Why

Insurance systems — carriers, MGAs, reinsurers, agents, regulators — exchange data through dozens of integrations. Without a shared data contract, every point-to-point integration becomes a custom translation layer that accumulates technical debt. ACORD (Association for Cooperative Operations Research and Development) maintains over 1,200 standardized transaction types covering policy, claims, billing, and reinsurance in XML and AL3 formats, and provides API and microservices schemas for modern architectures. Teams that skip ACORD and invent internal schemas pay the cost in every future integration project.

## How to apply

- Map your core domain entities (Policy, Risk, Party, Coverage, Claim, Loss) to the ACORD object model at the start of data modeling; document deviations explicitly.
- At system boundaries (carrier APIs, agent portals, reinsurance feeds), use ACORD XML or ACORD API schemas as the interchange format; translate to/from internal models at the adapter layer.
- For Property & Casualty use ACORD AL3 for batch feeds and ACORD XML for transactional exchange; for Life & Annuity use the ACORD Life XML standards.
- Version your ACORD schema usage; log which ACORD standard version each integration uses so upgrades can be planned.
- When building new products, validate field names and code values against the ACORD data dictionary before naming internal fields.

## Checklist

- [ ] Core domain entities are mapped to ACORD object model; all deviations from ACORD naming are documented.
- [ ] External integrations with carriers, reinsurers, or agents use ACORD XML or ACORD API schemas at the boundary.
- [ ] ACORD standard version is tracked per integration and included in integration documentation.
- [ ] Internal field names do not contradict ACORD code values or terminology without documented justification.
- [ ] AL3 batch feeds (P&C) and XML transactional formats are used according to ACORD guidance for their respective use cases.

## References

- ACORD Data Standards — https://www.acord.org/standards-architecture/acord-data-standards
- ACORD Property & Casualty Data Standards — https://www.acord.org/standards-architecture/acord-data-standards/Property_Casualty_Data_Standards
- ACORD Life & Annuity Data Standards — https://www.acord.org/standards-architecture/acord-data-standards/Life_Annuity_Data_Standards
- *The INSURTECH Book*, VanderLinden, Millie, Anderson, Chishti (Wiley, 2018) — https://www.oreilly.com/library/view/the-insurtech-book/9781119362210/
