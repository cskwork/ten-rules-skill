# Rule 09 — Gate Every Software Change Through Validation and MOC

> 소프트웨어 변경은 검증 절차와 변경 관리 승인 없이 생산 시스템에 적용하지 마라.
> No software change reaches a production manufacturing system without passing validation testing and a formal Management of Change approval.

## Why

In regulated manufacturing (pharmaceutical GMP, medical device, semiconductor advanced nodes), a software change to MES, recipe management, or SCADA is a process change. An unvalidated change can alter product quality imperceptibly — a wrong recipe parameter, a miscalculated yield formula, a misrouted lot — and the defect may ship to customers before it is detected. FDA 21 CFR Part 11, EU GMP Annex 11, and GAMP 5 require that computerized systems used in regulated production are validated, that changes are controlled, and that audit trails are maintained. Even in non-regulated factories, uncontrolled software changes are a leading cause of production incidents; Management of Change (MOC) is the industrial-standard gate. Skipping it to meet a deadline creates liability that often costs far more than the delay.

## How to apply

- Classify every software change by impact category: Minor (no functional change, cosmetic), Moderate (functional change, no safety/quality impact), Major (safety, quality, regulatory impact); apply proportional validation effort.
- Require a change request, impact assessment, test protocol, execution evidence, and approval sign-off before deploying any Moderate or Major change to production.
- Maintain a validated state baseline for each production system; deploying to production creates a new baseline entry. Rolling back is itself a change requiring MOC.
- Use automated test suites (regression, integration) as part of the validation protocol — manual-only test evidence is acceptable for initial validation but is not sufficient for recurring change management at scale.
- Store all validation documents (IQ/OQ/PQ protocols, test results, deviation reports) in a document management system with audit trail; do not store them only in Jira tickets or chat.

## Checklist

- [ ] Change classification criteria (Minor / Moderate / Major) are defined and documented for each system.
- [ ] All Moderate and Major changes have a signed change request, impact assessment, and test protocol before deployment.
- [ ] A validated state baseline record exists for every production system; deployments update it.
- [ ] Validation documents are stored in a controlled document management system, not ad hoc file shares.
- [ ] Rollback is treated as a change and requires its own MOC approval.

## References

- GAMP 5: A Risk-Based Approach to Compliant GxP Computerized Systems (ISPE, 2nd ed. 2022) — https://ispe.org/publications/guidance-documents/gamp-5-guide-2nd-edition
- FDA 21 CFR Part 11, *Electronic Records; Electronic Signatures* — https://www.ecfr.gov/current/title-21/chapter-I/subchapter-A/part-11
- EU GMP Annex 11, *Computerised Systems* — https://health.ec.europa.eu/medicinal-products/eudralex/eudralex-volume-4_en
- ISA-106, *Procedure Automation for Continuous Process Operations* — https://www.isa.org/standards-and-publications/isa-standards
