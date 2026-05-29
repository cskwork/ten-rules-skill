# Rule 05 — Usage Metering and Accurate Billing

> 사용량은 이벤트 단위로 계측하고 청구는 정확해야 한다
> Meter usage at the event level; billing errors destroy enterprise trust faster than downtime.

## Why

B2B SaaS revenue depends on recurring subscriptions plus usage-based expansion (seats, API calls, storage, compute). Inaccurate billing — undercounting or overcounting — creates churn and legal disputes. Enterprise finance teams reconcile invoices line by line; a surprise charge or a missing credit triggers procurement re-evaluation. Usage-based pricing (UBP) is now the dominant model for infrastructure-adjacent SaaS and is expanding into workflow tools. The metering pipeline must be idempotent and auditable: customers will ask for raw usage data to validate invoices.

## How to apply

- Emit a durable, immutable usage event for every billable action at the time it occurs. Do not reconstruct usage after the fact from application logs.
- Make the metering pipeline idempotent with deduplication keys so retry storms do not double-count events.
- Decouple the metering store (high-write event stream) from the billing engine (aggregation and invoice generation). Platforms such as Stripe Billing, Orb, or Lago handle the aggregation layer; do not re-implement it.
- Support mid-cycle plan changes (upgrade, downgrade, add seat) with correct proration logic. Test all proration edge cases in automated billing tests.
- Expose a usage dashboard to tenant admins so they can see real-time consumption before the invoice arrives. This reduces support tickets and churn caused by billing surprises.
- Implement a billing alert system: notify tenant admins when usage crosses defined thresholds (80%, 100%, 110% of plan limit) so they can upgrade proactively.

## Checklist

- [ ] Billable events are written to a durable store (not application logs) before the response is returned to the caller.
- [ ] Metering pipeline handles duplicate events idempotently via a deduplication key.
- [ ] Proration is calculated server-side and verified by automated tests covering upgrade, downgrade, and mid-cycle seat changes.
- [ ] Tenants can view their own usage breakdown in the product UI.
- [ ] Usage threshold alerts are configurable per tenant and delivered reliably.

## References

- Stripe Billing documentation — Metered billing and usage records — https://stripe.com/docs/billing/subscriptions/usage-based
- Orb — Usage-based billing platform — https://www.getorb.io/
- Lago — Open-source metering and billing API — https://github.com/getlago/lago
- SaaStr, Jason Lemkin — NRR and expansion revenue benchmarks — https://www.saastr.com/dear-saastr-what-are-the-top-10-metrics-for-saas-companies-to-track/
