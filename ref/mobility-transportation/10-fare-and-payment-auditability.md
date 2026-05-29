# Rule 10 — Fare and Payment Auditability

> 요금 계산 근거를 재현할 수 없다면, 분쟁은 반드시 플랫폼이 진다.
> If a fare calculation cannot be reproduced, the platform will always lose the dispute.

## Why

Fare disputes are the most common support category in ride-hailing and transit billing. Regulators in the EU (PSD2), the US (CFPB Reg E for prepaid accounts), and transit fare compliance auditors require that any charged amount be traceable to a documented calculation. When a rider disputes a fare, the platform must produce the exact inputs used at calculation time — not an approximation from current data, because distances, surge multipliers, and promotions change by the second. Transit ticketing systems face additional complexity: stored-value accounts must balance to the cent across millions of tap-in/tap-out events, and discrepancies trigger NTD financial audits. Payment systems must also be idempotent: network retries must not result in duplicate charges.

## How to apply

- Store every fare as an immutable ledger entry at the time of calculation: trip ID, timestamp, distance meters, duration seconds, base rate version, surge multiplier, each promotion code and its discount amount, tolls, taxes, and the final charged amount — never recompute retrospectively.
- Assign a globally unique, client-generated idempotency key to every payment initiation; the payment processor must deduplicate on this key so retries never double-charge.
- Implement a fare reconciliation job that runs nightly: sum all charged fares for the day, reconcile against payment processor settlement, and flag any variance above a configurable threshold (e.g., $0.01 per transaction) for investigation.
- Provide riders with a line-item receipt (base fare, per-mile rate, per-minute rate, surge, promotions, tolls, taxes) available in the app and by email; this receipt must be reproducible from stored data at any future point.
- For transit stored-value accounts, implement a double-entry accounting model: every debit to a rider account must have a corresponding credit to an operator revenue account; unbalanced entries must be caught at write time, not discovered in audits.

## Checklist

- [ ] Fare ledger entry stored immutably at calculation time with all inputs (never recomputed).
- [ ] Every payment initiation carries a client-generated idempotency key.
- [ ] Nightly reconciliation job runs and variances are alerted.
- [ ] Line-item receipt reproducible from stored data at any future date.
- [ ] Stored-value transit accounts use double-entry accounting; unbalanced entries are rejected at write time.

## References

- California CPUC TNC Regulations — financial reporting requirements — https://www.cpuc.ca.gov/-/media/cpuc-website/files/uploadedfiles/cpuc_public_website/content/licensing/transportation_network_companies/basicinformationfortncs.pdf
- FTA National Transit Database — financial reporting overview — https://www.transit.dot.gov/ntd/ntd-data
- Yan et al. — "Dynamic pricing and matching in ride-hailing platforms," Naval Research Logistics 67(8), 2020 — https://doi.org/10.1002/nav.21931
- OECD MaaS Data Architecture — payment and ticketing interoperability — https://www.oecd.org/en/publications/mix-and-maas-data-architecture-for-mobility-as-a-service_4272475b-en.html
