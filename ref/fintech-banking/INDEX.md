# FinTech & Banking — 10 Rules (index)

Source: PCI DSS v4.0.1 (PCI Security Standards Council), PSD2 / EBA Regulatory Technical Standards on SCA (European Banking Authority), FATF 40 Recommendations (Financial Action Task Force), Stripe API design documentation (stripe.com/docs), Plaid API documentation (plaid.com/docs), and Modern Treasury ledger design guides. This rule set covers building production payment platforms, neobanks, lending products, and financial data services where regulatory compliance, monetary correctness, and fraud prevention are non-negotiable constraints — distinct from generic web engineering.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-immutable-double-entry-ledger.md` | Every money movement posts two ledger entries | Balance calculations, wallet credits/debits, settlement, reconciliation |
| 02 | `02-idempotent-payment-operations.md` | Payment mutations must be safe to retry | Charge endpoints, refund APIs, transfer jobs, webhook handlers |
| 03 | `03-pci-dss-cardholder-data-scope.md` | Minimize cardholder data scope to reduce PCI surface | Card input forms, token storage, payment processor integration |
| 04 | `04-kyc-aml-customer-due-diligence.md` | Verify identity and screen transactions before money moves | Onboarding flows, account opening, large or suspicious transfers |
| 05 | `05-strong-customer-authentication.md` | Authenticate with two independent factors for sensitive actions | Login, payment initiation, account changes, open banking consent |
| 06 | `06-regulatory-audit-trail.md` | Every financial event is logged immutably with actor and timestamp | Any write path that touches money, identity, or consent |
| 07 | `07-financial-data-isolation.md` | Segregate financial data by entity, currency, and purpose | Multi-tenant ledgers, FX handling, escrow, reserve accounts |
| 08 | `08-reconciliation-and-settlement.md` | Continuously reconcile internal ledger against external statements | End-of-day jobs, bank feed imports, card network settlement files |
| 09 | `09-fraud-and-velocity-controls.md` | Enforce velocity rules and anomaly detection at the transaction boundary | Payment submission, withdrawal, account-to-account transfer |
| 10 | `10-regulatory-reporting-and-data-residency.md` | Produce timely, accurate regulatory reports and keep data in permitted jurisdictions | Transaction reporting, tax data, cross-border flows, data exports |

Default for "building or modifying a payment or transfer flow": read 01, 02, 03, 05 at minimum.
