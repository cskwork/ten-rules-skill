# Rule 08 — Technology Ownership and Exit

> 특정 공급업체에 종속되지 마라. 공공 서비스는 언제든 다른 공급업체로 전환할 수 있어야 한다.
> Never allow a vendor to own the service; government must retain the ability to exit a contract and continue operating.

## Why

Government organisations have historically signed long-term contracts with large IT suppliers that resulted in proprietary lock-in: custom platforms with no data portability, source code owned by the vendor, and skills embedded exclusively in the supplier's staff. When contracts end or vendors fail, agencies face the choice of paying whatever the incumbent demands or rebuilding from scratch at enormous cost. The GOV.UK Service Standard and the USDS Playbook both require that teams choose open standards, retain ownership of source code and data, and design contracts so that any competent supplier could take over. This is a procurement and architectural principle as much as a technical one.

## How to apply

- Require that all source code produced under contract is owned by the government or released as open source under an approved licence (MIT, Apache 2.0, OGL); do not accept "we built it, we own it" from vendors.
- Use open standards for all data exchange and storage formats; avoid proprietary database schemas, binary formats, or vendor-specific APIs as the primary integration mechanism.
- Retain all production data in formats the agency can export without the vendor's tooling; test this annually with a data extraction dry run.
- Break large contracts into smaller, outcome-based packages; a single supplier delivering the entire stack is a single point of failure and a single point of leverage.
- Document architecture decisions (ADRs — Architecture Decision Records) so incoming suppliers or in-house teams can understand why choices were made.
- Include exit clauses in every contract: data handover timelines, knowledge transfer requirements, and transition support obligations.

## Checklist

- [ ] Contract includes explicit IP ownership clause assigning code and data to the government
- [ ] All data is stored in open, exportable formats with documented extraction procedure
- [ ] No single vendor controls more than one critical tier of the service
- [ ] Architecture Decision Records (ADRs) maintained and accessible to the team
- [ ] Exit and transition plan documented in contract and tested in at least one rehearsal

## References

- GOV.UK Service Standard — Point 13: Use and contribute to open standards, common components and patterns — https://www.gov.uk/service-manual/service-standard/point-13-use-common-standards-components-and-patterns
- GOV.UK Technology Code of Practice — https://www.gov.uk/guidance/the-technology-code-of-practice
- US Digital Services Playbook — Play 5: Structure budgets and contracts to support delivery — https://playbook.usds.gov/
- UK Crown Commercial Service — Technology products and services guidance — https://www.crowncommercial.gov.uk/
