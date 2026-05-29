# Rule 04 — Immutable Audit Log

> 모든 읽기와 쓰기는 변경할 수 없는 기록으로 남겨야 한다.
> Every read and every write must leave an immutable record.

## Why

Enterprise data platforms handle data that drives billion-dollar decisions, regulatory filings, and legally binding reports. SOC 2 Type II, GDPR, HIPAA, and government FedRAMP controls all require evidence that access was controlled and that the evidence itself has not been tampered with. An audit log that can be deleted or overwritten is not an audit log — it is a liability. Append-only logs stored with cryptographic integrity checks (hash chaining or write-once object storage) provide the tamper-evidence guarantee that compliance auditors require and that incident investigators depend on.

## How to apply

- Write audit events to an append-only store (e.g., write-once S3 bucket, immutable Kafka topic with retention lock) rather than a mutable database table.
- Capture: timestamp, actor identity, resource identifier, operation type, access policy evaluated, outcome (granted/denied), and source IP or service identity.
- Log data reads, not only writes; many compliance regimes (GDPR recital 39, HIPAA §164.312) require read access to be auditable.
- Hash-chain audit records or use a signed log approach so tampering is detectable even by privileged operators.
- Define and enforce a retention period (typically 1–7 years depending on regulation); automated expiry must itself be logged.

## Checklist

- [ ] Audit log store is append-only and protected against deletion by platform admins
- [ ] Every data read of classified or PII data generates an audit event
- [ ] Audit records include actor, resource, policy evaluated, and outcome
- [ ] Records are hash-chained or signed to detect tampering
- [ ] Retention period is set, documented, and automated expiry is itself logged

## References

- DAMA International, *DAMA-DMBOK 2nd Edition* — https://dama.org/learning-resources/dama-data-management-body-of-knowledge-dmbok/
- NIST, *SP 800-162: Guide to Attribute Based Access Control (ABAC)* — https://csrc.nist.gov/pubs/sp/800/162/upd2/final
- AICPA, *SOC 2 — SOC for Service Organizations: Trust Services Criteria* — https://www.aicpa-cima.com/resources/landing/system-and-organization-controls-soc-suite-of-services
- Martin Kleppmann, *Designing Data-Intensive Applications* (O'Reilly, 2017) — https://dataintensive.net/
