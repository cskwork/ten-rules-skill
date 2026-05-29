# Rule 08 — Reconciliation and Settlement

> 내부 원장과 외부 은행·카드 네트워크 명세서는 매일 자동으로 대사되어야 하며, 불일치는 즉시 경보해야 한다.
> Reconcile the internal ledger against external bank and card-network statements daily; alert on any discrepancy immediately.

## Why

A payment platform's internal ledger reflects what the system believes is true; the bank or card network's settlement file reflects what actually moved. Discrepancies arise from timing differences, failed reversals, duplicate submissions, fee misapplication, and integration bugs. If left undetected, these discrepancies become write-offs, regulatory findings, or customer-visible balance errors. Payment card networks (Visa, Mastercard) require daily settlement file processing and expect settlement funds to arrive within defined windows; failure to settle on time results in fines. Reconciliation is also the primary control for detecting fraud that bypasses transaction-level checks.

## How to apply

- Ingest settlement files (ISO 8583 messages, Nacha ACH files, SWIFT MT940/camt.053 statements, or card network CSV reports) into a staging table daily; do not post to the ledger until each line item is matched.
- Match each external settlement item to an internal transaction by reference number, amount, currency, and value date; flag unmatched items as exceptions for manual review.
- Produce a daily reconciliation report showing: matched count, unmatched internal items (posted but not settled), unmatched external items (settled but not posted), and net difference.
- Automate exception escalation: unmatched items older than T+1 business day should page on-call; items older than T+3 should escalate to finance and compliance.
- Maintain a formal break-resolution workflow: every exception must be resolved with either a matching adjustment entry or a documented write-off with approvals.

## Checklist

- [ ] External settlement files are ingested and reconciled on every business day by a defined cutoff time.
- [ ] Matching logic covers reference number, amount, currency, and value date.
- [ ] Unmatched items older than T+1 trigger an automated alert.
- [ ] A reconciliation summary report is generated and retained for audit.
- [ ] All break resolutions are documented with approver and resolution type.

## References

- Modern Treasury — "Ledgers" product documentation — https://www.moderntreasury.com/products/ledgers
- Nacha — "ACH Network Rules" (settlement and return timeframes) — https://www.nacha.org/rules
- PCI Security Standards Council — PCI DSS v4.0.1 — https://www.pcisecuritystandards.org/standards/
