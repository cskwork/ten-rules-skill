# Rule 10 — Data Portability and Offboarding

> 고객은 언제든지 자신의 데이터를 완전히 내보낼 수 있어야 한다
> Customers must be able to export all of their data completely and at any time.

## Why

Enterprise procurement teams now include data-portability requirements in contracts as a standard clause, not an exception. GDPR Article 20 (right to data portability) and CCPA Section 1798.100 give individual users the right to receive their data in a portable format. For B2B SaaS, this extends to bulk export of all tenant-scoped data on contract termination. Platforms that make exit difficult — deliberately or through neglect — face regulatory risk, reputational damage, and difficulty closing new deals where the buyer's legal team reviews vendor lock-in risk. Data portability is also a competitive signal: confident products let customers leave cleanly.

## How to apply

- Provide a self-service data export function in the admin UI that produces a complete, machine-readable export (JSON or CSV) of all tenant data without requiring support involvement.
- Document the export schema: field names, data types, and relationships. Enterprise customers need to import the data into another system; undocumented exports are worthless.
- Define a data retention and deletion schedule in the terms of service. After contract termination, specify how long data is held (e.g., 30 days in cold storage) before permanent deletion, and confirm deletion in writing.
- Implement a GDPR/CCPA data-subject access request (DSAR) workflow that allows tenant admins to fulfill user-level data requests within the regulatory deadline (30 days for GDPR, 45 days for CCPA).
- Log all export and deletion requests with timestamp, requester, and outcome. These logs are required for regulatory compliance demonstration.
- Test the export pipeline on realistic data volumes; a 10 GB export that times out at 5 GB is not a usable feature.

## Checklist

- [ ] Self-service bulk export is available to tenant admins in the product UI and produces a documented schema.
- [ ] Export handles large tenants (test with representative data volume) without timing out.
- [ ] Post-termination data retention period and deletion timeline are stated in the terms of service and enforced programmatically.
- [ ] DSAR workflow is implemented and can fulfill individual user data requests within 30 days.
- [ ] All export and deletion events are logged durably.

## References

- GDPR Article 20 — Right to data portability — https://gdpr-info.eu/art-20-gdpr/
- CCPA Section 1798.100 — Consumer right to know and data access — https://oag.ca.gov/privacy/ccpa
- AICPA SOC 2 Trust Services Criteria — Privacy and Confidentiality categories — https://www.aicpa-cima.com/resources/download/2017-trust-services-criteria
- Tod Golding, *Building Multi-Tenant SaaS Architectures* (O'Reilly, 2024) — Tenant lifecycle and offboarding — https://www.oreilly.com/library/view/building-multi-tenant-saas/9781098140632/
