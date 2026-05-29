# Rule 02 — NERC CIP as a Hard Non-Negotiable Constraint

> NERC CIP 기준은 선택 사항이 아니라 설계의 시작점이다.
> NERC CIP standards are not a checklist to bolt on after design — they are the first constraint to satisfy.

## Why

The North American Electric Reliability Corporation Critical Infrastructure Protection (NERC CIP) standards are mandatory, enforceable federal regulations for any entity operating or touching the Bulk Electric System (BES) in North America. Violations carry civil penalties of up to $1 million per violation per day. The standards cover asset inventory (CIP-002), security management (CIP-003), personnel and training (CIP-004), electronic perimeters (CIP-005), physical security (CIP-006), system configuration and patch management (CIP-007), incident response (CIP-008), recovery plans (CIP-009), configuration change management (CIP-010), and supply chain risk (CIP-013). Any software that stores, processes, or transmits BES Cyber System Information (BCSI) is in scope and must comply from the first commit.

## How to apply

- Before writing a single line of code, classify every system by BES Cyber Asset impact rating (High, Medium, Low) per CIP-002; the rating drives which CIP controls apply and at what stringency.
- Implement role-based access control with individually authenticated accounts — no shared accounts, no anonymous access — and maintain access review records per CIP-004 and CIP-007.
- Build an automated, evidence-producing patch management pipeline: CIP-007 requires you to track applicable patches, apply or document exceptions, and prove it within 35 days (High/Medium) of patch release.
- Treat BES Cyber System Information (BCSI) as a specific data classification: encrypt at rest and in transit, restrict to need-to-know, and log every access event with sufficient detail to reconstruct who accessed what and when.
- Design the incident response workflow (CIP-008) into the application: alerting, escalation contacts, evidence preservation, and the 24-hour initial reporting SLA to NERC E-ISAC must be operationally executable, not just documented in a Word file.

## Checklist

- [ ] CIP-002 asset classification is complete before development begins; impact rating is documented and approved.
- [ ] No shared or anonymous accounts exist in any BES Cyber System; all access is individually authenticated.
- [ ] Patch management pipeline produces dated, signed evidence of patch application or documented exceptions.
- [ ] BCSI is identified, encrypted at rest and in transit, and access logs are retained for the mandated period.
- [ ] Incident response procedure includes the 24-hour NERC E-ISAC notification path and is tested at least annually.

## References

- NERC CIP Standards (CIP-002 through CIP-014): North American Electric Reliability Corporation — https://www.nerc.com/pa/Stand/Pages/CIPStandards.aspx
- FERC: New Reliability Safeguards for American Power Grid (CIP virtualization update) — https://www.ferc.gov/news-events/news/ferc-action-new-reliability-safeguards-american-power-grid
- NIST SP 800-82 Rev. 3: Guide to Operational Technology (OT) Security — https://csrc.nist.gov/pubs/sp/800/82/r3/final
