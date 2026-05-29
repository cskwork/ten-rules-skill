# Rule 06 — Regulatory Audit Trail

> 금융 시스템의 모든 변경은 누가, 언제, 왜 했는지를 변경 불가능한 방식으로 기록해야 한다.
> Every state change in a financial system must record who acted, when, and why — and that record must be tamper-evident.

## Why

Financial regulators, auditors, and courts require a complete, time-ordered, tamper-evident record of all actions that affect customer funds, identity data, and consent. PCI DSS Requirement 10 mandates audit logs for access to cardholder data; FATF Recommendation 11 mandates retention of transaction records for at least five years. In fraud investigations and legal disputes, audit logs are the primary evidence; a gap or inconsistency in the log is treated as a system defect — or as evidence of cover-up. Unlike application logs for debugging, the regulatory audit trail must survive even if the application is compromised.

## How to apply

- Write audit events to a separate, append-only store (a dedicated audit log table with no DELETE permission, or an immutable object store with WORM policy).
- Every event must include: timestamp (UTC, sub-second precision), actor identity (user ID, service account, or API key), action type, affected resource ID, before/after state snapshot, and originating IP / session ID.
- Use a cryptographic hash chain or HMAC signature on sequential audit records so that tampering or deletion is detectable.
- Never mix operational application logs (stdout, log aggregators) with the regulatory audit trail — they have different retention, access control, and integrity requirements.
- Define retention per jurisdiction: five years is the FATF minimum; many jurisdictions require seven to ten years for transaction records.

## Checklist

- [ ] Audit log table or store is append-only; no application role has DELETE or UPDATE on it.
- [ ] Every financial write path emits an audit event before returning success to the caller.
- [ ] Each audit event includes actor ID, resource ID, timestamp (UTC), and action type.
- [ ] Log integrity is verifiable (hash chain, signed records, or WORM storage policy).
- [ ] Retention policy is documented and enforced per jurisdiction requirements.

## References

- PCI Security Standards Council — PCI DSS v4.0.1 Requirement 10 — https://www.pcisecuritystandards.org/standards/
- Financial Action Task Force — "The FATF Recommendations" (Recommendation 11) — https://www.fatf-gafi.org/en/publications/Fatfrecommendations/Fatf-recommendations.html
- Modern Treasury — "Ledgers" product documentation — https://www.moderntreasury.com/products/ledgers
