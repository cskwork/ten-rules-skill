# Rule 07 — Financial Data Isolation

> 고객별, 통화별, 목적별로 자금을 엄격히 분리하여 혼용 및 오귀속을 방지하라.
> Segregate funds and financial data by customer, currency, and purpose to prevent commingling and mis-attribution.

## Why

Financial regulators require that a platform never mix client funds with operating funds (client money segregation), and that funds held for different purposes — escrow, reserve, float, collateral — are distinguishable at all times. In a multi-tenant ledger, a data model that does not enforce hard boundaries between tenants or currencies will eventually produce incorrect balances due to schema or query errors — and tracing back to the cause requires reconstructing history from scratch. Beyond regulation, commingling is a material risk during insolvency: if a platform fails, commingled client funds may be unavailable to customers.

## How to apply

- Model each account in the ledger with an explicit owner_id, currency (ISO 4217 code), and account_type (e.g., customer_wallet, operating, reserve, escrow) — never aggregate across these dimensions in a single balance query without first filtering on all three.
- Use separate GL (general ledger) account codes for client money versus operating money; never transfer between them except through explicitly controlled reconciliation entries.
- For FX: never implicitly convert currencies when debiting/crediting; record the source currency amount, the target currency amount, and the exchange rate as explicit fields on the transaction.
- Enforce row-level security or tenant-scoped application logic so that a query for tenant A can never return rows belonging to tenant B.
- In multi-currency systems, produce a balance sheet reconciliation per currency; a combined multi-currency balance that ignores FX rates is meaningless.

## Checklist

- [ ] Every ledger account row carries owner_id, currency, and account_type.
- [ ] No balance query aggregates across currencies without explicit currency filtering.
- [ ] Client money accounts and operating accounts are in separate GL account ranges.
- [ ] Multi-tenant queries are enforced at the data layer (RLS or application filter), not only at the API layer.
- [ ] FX transactions record source amount, target amount, and rate as distinct fields.

## References

- Modern Treasury — "Ledgers" product documentation — https://www.moderntreasury.com/products/ledgers
- FCA — "CASS: Client Assets Sourcebook" (client money segregation rules) — https://www.handbook.fca.org.uk/handbook/CASS/
- Plaid — API Overview (account data model) — https://plaid.com/docs/api/
