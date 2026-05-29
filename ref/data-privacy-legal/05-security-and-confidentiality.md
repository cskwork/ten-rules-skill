# Rule 05 — Protect Data with Appropriate Safeguards

> 개인정보를 적절한 기술적, 관리적 조치로 보호하라. 무단 접근과 유실을 막아라.
> Protect personal data with appropriate technical and organizational measures against loss and misuse.

## Why

Integrity and confidentiality is a GDPR Article 5 principle, operationalized in Article 32, and it is the control area ISO/IEC 27701 extends from ISO 27001's security management system. Privacy without security is hollow: a breach exposes the people behind the data regardless of how lawfully it was collected. Security is the safeguard every other privacy promise depends on.

## How to apply

- Encrypt personal data in transit (TLS) and at rest; protect and rotate keys.
- Enforce least-privilege access; log who accessed which records and review it.
- Pseudonymize identifiers so a leaked dataset is harder to tie back to people.
- Bind processors and vendors with data processing agreements and verify their controls.
- Test and patch: scan dependencies, manage configs, and rehearse incident response.

## Checklist

- [ ] Personal data is encrypted in transit and at rest, with managed keys.
- [ ] Access follows least privilege and is logged and periodically reviewed.
- [ ] Every third-party processor is under a data processing agreement.
- [ ] Sensitive identifiers are pseudonymized where feasible.
- [ ] Security measures are tested, not just documented.

## References

- GDPR Article 32 security of processing — https://gdpr-info.eu/art-32-gdpr/
- ISO/IEC 27701 privacy information management — https://www.iso.org/standard/71670.html
