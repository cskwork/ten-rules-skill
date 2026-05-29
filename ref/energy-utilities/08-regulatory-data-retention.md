# Rule 08 — Retain Operational and Billing Records per Jurisdiction-Specific Mandates

> 운영 및 청구 기록은 관할 규정별 보존 기간을 코드에 명시적으로 반영해야 한다.
> Operational and billing records must have jurisdiction-specific retention periods encoded explicitly in the system, not assumed or left to application default.

## Why

Energy utilities operate under layered retention mandates from multiple regulatory bodies simultaneously: FERC (18 CFR Part 125) requires electric utilities to retain certain operational records for 5 to 25 years depending on record type; NERC CIP mandates retention of security event logs, access control records, and configuration baselines for 3 years (CIP-007, CIP-010); state public utility commissions typically require billing records to be available for customer dispute resolution for 3 to 7 years; GDPR and US state privacy laws impose maximum retention limits that conflict with the minimums above for data containing personal information. Building a system that applies a single uniform TTL, or that deletes records on an implicit schedule, will simultaneously violate some obligations and comply with others — and the regulator that catches the violation sets the penalty amount, not the developer.

## How to apply

- Define a record classification taxonomy that maps every record type (meter read, billing invoice, SCADA event log, access control log, configuration snapshot, customer communication) to its governing regulation, minimum retention period, and maximum retention period where privacy law applies.
- Store the retention class and calculated expiry date alongside every record at write time; do not compute retention eligibility at deletion time from current policy, because policies change and the applicable rule is the one in effect when the record was created.
- Implement legal hold as a first-class flag that suspends deletion for records subject to litigation or regulatory investigation; legal hold must override all automated deletion and TTL-based archival.
- For records that contain personal data subject to privacy law (customer PII, usage profiles), implement a purpose-limitation annotation: record the legal basis for retention and trigger a deletion workflow when the retention basis expires and no hold is active.
- Build deletion as an auditable operation: produce a deletion log (what was deleted, when, by what policy trigger, by whom) retained for the longest applicable regulatory period.

## Checklist

- [ ] Record classification taxonomy is documented and covers all major record types in the system.
- [ ] Retention class and computed expiry date are stored with every record at creation.
- [ ] Legal hold flag exists and is tested to block all automated deletion paths.
- [ ] Deletion operations produce an immutable deletion log.
- [ ] Retention policy is reviewed against regulatory updates at least annually and tested after any schema change.

## References

- NERC CIP Standards: record retention requirements embedded in CIP-007, CIP-010 — https://www.nerc.com/pa/Stand/Pages/CIPStandards.aspx
- FERC: 18 CFR Part 125 — Preservation of Records of Public Utilities and Licensees — https://www.ecfr.gov/current/title-18/chapter-I/subchapter-C/part-125
- GDPR Article 5(1)(e) — Storage limitation principle (conflicts with utility retention minimums) — https://gdpr-info.eu/art-5-gdpr/
