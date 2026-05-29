# Rule 09 — Audit Trail and Non-Repudiation

> 모든 임상 기록의 열람, 수정, 공유는 변조 불가능한 로그로 남겨라: 감사 추적은 의무이자 법적 방어선이다.
> Every read, modification, and disclosure of a clinical record must produce a tamper-evident log: the audit trail is both a regulatory obligation and a legal defense.

## Why

HIPAA requires covered entities to maintain audit controls — hardware, software, and procedural mechanisms that examine activity in information systems containing ePHI (45 CFR 164.312(b)). The 2025 NPRM proposes making comprehensive audit logging a mandatory rather than addressable specification. In clinical and legal disputes, the audit log is the authoritative record of who accessed what and when. A patient alleging unauthorized disclosure, a malpractice claim disputing a record change, or a regulatory investigation of a breach all depend on a complete, tamper-evident audit trail. Log gaps — whether from omission in code or from log rotation that discards records — are independently sanctionable.

## How to apply

- Log every read, write, update, and delete of ePHI: include the acting user identity, their role, the patient identity, the resource accessed, the action taken, the timestamp (UTC), and the client IP or session identifier.
- Store audit logs in an append-only system separate from the application database — logs must be immutable from the application layer; only a privileged operations process (with its own audit trail) should be able to archive or delete.
- Retain audit logs for a minimum of six years (HIPAA record retention standard for covered entities); apply a documented retention and archival policy.
- Do not include PHI in log message bodies; reference records by internal ID only — the audit log proves access happened without duplicating the sensitive record.
- Expose audit logs to patients on request as part of the accounting-of-disclosures right under HIPAA Privacy Rule (45 CFR 164.528); build this as a self-service portal feature, not a manual support process.
- Alert on anomalous access patterns: bulk reads of records unrelated to an active patient encounter, access outside business hours, or repeated failed authentication attempts.

## Checklist

- [ ] Audit log captures: user ID, role, patient ID, resource, action, timestamp (UTC), session/IP for every ePHI access
- [ ] Audit logs stored in an append-only store separate from application database
- [ ] Log retention policy documented: minimum six years, archival process defined
- [ ] PHI absent from log message bodies; records referenced by ID only
- [ ] Accounting-of-disclosures report available to patients via self-service

## References

- HIPAA Security Rule: Audit Controls (45 CFR 164.312(b)) — https://www.hhs.gov/hipaa/for-professionals/security/index.html
- HIPAA Privacy Rule: Accounting of Disclosures (45 CFR 164.528) — https://www.hhs.gov/hipaa/for-professionals/privacy/guidance/disclosures/index.html
- HHS HIPAA Security Rule NPRM 2025 (proposed mandatory audit logging) — https://www.hhs.gov/hipaa/for-professionals/security/hipaa-security-rule-nprm/index.html
