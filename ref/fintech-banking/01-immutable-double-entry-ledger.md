# Rule 01 — Immutable Double-Entry Ledger

> 모든 금전 이동은 두 개의 원장 항목으로 기록되며, 한 번 기록된 항목은 절대 수정되지 않는다.
> Every money movement posts a debit and a credit; posted entries are never overwritten, only reversed.

## Why

Double-entry bookkeeping (debit = credit for every transaction) is the only design that makes balance errors detectable: if debits and credits do not sum to zero, something is wrong. Financial regulators, auditors, and payment card networks require a complete, traceable history of every balance change. Overwriting records destroys the audit trail and makes it impossible to reconstruct balances at a point in time — a requirement for dispute resolution, tax filings, and fraud investigations. An append-only, reversible ledger is the foundation on which every other financial guarantee in this list rests.

## How to apply

- Model transactions as journal entries: each entry has an account ID, direction (debit/credit), amount, currency, timestamp, and a reference to the parent transaction.
- Make the journal table append-only: no UPDATE or DELETE on posted rows. Corrections are reversal entries linked to the original via a reversal_of foreign key.
- Enforce the zero-sum invariant in a database transaction: reject any commit where the sum of debits does not equal the sum of credits within the same journal entry.
- Derive all balances by summing the journal rather than storing a mutable balance column; or maintain a balance cache that is always re-derivable from the journal.
- Use a monotonically increasing sequence (sequence number or event ID) to order entries and detect gaps.

## Checklist

- [ ] No UPDATE or DELETE statements touch posted journal rows.
- [ ] Each journal entry atomically posts debit and credit together (single DB transaction).
- [ ] A balance computed from the journal matches any cached balance column.
- [ ] Reversal entries carry a reversal_of reference to the original entry.
- [ ] Integration tests verify the zero-sum invariant after every transaction type.

## References

- Modern Treasury — "Enforcing Immutability in your Double-Entry Ledger" — https://www.moderntreasury.com/journal/enforcing-immutability-in-your-double-entry-ledger
- Square Engineering — "Books: an immutable double-entry accounting database service" — https://developer.squareup.com/blog/books-an-immutable-double-entry-accounting-database-service/
- Tigerbeetle — "Designing Safe Financial Systems" (whitepaper on financial ledger correctness) — https://tigerbeetle.com/blog/a-tigers-tail-the-design-history-of-tigerbeetle
