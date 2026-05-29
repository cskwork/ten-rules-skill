# Rule 06 — Keep Data Only as Long as Needed

> 필요한 기간만 보관하고 끝나면 지워라. 백업과 로그까지 포함해서.
> Retain data only as long as the purpose needs, then delete it, including backups and logs.

## Why

Storage limitation is a GDPR Article 5 principle: personal data must not be kept in identifiable form longer than necessary. Korea PIPA requires destruction once the purpose is fulfilled. Indefinite retention quietly grows the breach blast radius and the cost of every subject-access request, so deleting on schedule is both a legal duty and risk reduction.

## How to apply

- Define a retention period for each data category, tied to its purpose or a legal duty.
- Automate deletion or anonymization when the period expires; do not rely on manual cleanup.
- Include backups, archives, caches, and logs in the retention and deletion scope.
- Anonymize rather than keep when you need long-term aggregates but not identities.
- Document the schedule so it is auditable and consistently enforced.

## Checklist

- [ ] Every data category has a defined, justified retention period.
- [ ] Deletion or anonymization runs automatically when periods expire.
- [ ] Backups and logs are covered by the retention schedule, not exempt from it.
- [ ] Data kept for analytics long-term is anonymized, not just retained.
- [ ] The retention schedule is documented and auditable.

## References

- GDPR Article 5(1)(e) storage limitation — https://gdpr-info.eu/art-5-gdpr/
- Korea Personal Information Protection Commission (PIPC) — https://www.pipc.go.kr/eng/
