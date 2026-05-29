# Rule 07 — Net Revenue Retention and Expansion Design

> 제품의 모든 기능은 순수익 유지율을 높이도록 설계해야 한다
> Every product decision should be evaluated against its impact on net revenue retention.

## Why

Net Revenue Retention (NRR) — the percentage of ARR retained from existing customers after expansion, contraction, and churn — is the single most important growth metric in B2B SaaS according to SaaStr benchmarks. A business with NRR above 120% grows its existing revenue base even if it acquires zero new customers. Snowflake's pre-IPO NRR was 158%; Datadog consistently exceeds 130%. By contrast, NRR below 100% means the product is losing money from the installed base regardless of new bookings. NRR is therefore a product problem before it is a sales problem — features that create expansion paths (more seats, higher tiers, add-on modules) are as strategically important as features that close new deals.

## How to apply

- Map every feature to a commercial motion: does it increase seat count, push users to a higher tier, reduce churn risk, or enable an add-on upsell? If none of the above, reprioritize.
- Build in-product upgrade prompts at natural usage-limit moments (approaching seat cap, hitting API quota, needing an enterprise feature) rather than only in email campaigns.
- Instrument expansion signals: track which features are associated with tier upgrades, which accounts are near seat limit, which features are used only on higher tiers. Route signals to the customer success team.
- Design admin dashboards that surface the value the product delivers (ROI metrics, usage trends, benchmark comparisons) so renewal conversations have data rather than anecdotes.
- Implement a health score per tenant (login frequency, feature adoption breadth, active seats vs. licensed seats) and surface it internally to flag churn risk 90 days before renewal.
- Keep pricing tiers legible: if a customer cannot explain their own plan to their manager in one sentence, the expansion path is too opaque.

## Checklist

- [ ] Product roadmap items are tagged with their expected NRR impact (expansion, retention, or neither).
- [ ] In-product upgrade prompts fire at usage-limit moments and are A/B tested.
- [ ] Tenant health score is computed automatically and available to the CS team in real time.
- [ ] Expansion signals (near seat cap, high engagement on gated features) trigger automated workflows to CS.
- [ ] NRR is tracked as a primary product metric in the weekly engineering review, not only in finance.

## References

- SaaStr, Jason Lemkin — NRR as the #1 SaaS metric — https://www.saastr.com/the-most-important-saas-metrics-in-2023-with-monday/
- SaaStr — Top 10 SaaS metrics — https://www.saastr.com/dear-saastr-what-are-the-top-10-metrics-for-saas-companies-to-track/
- OpenView Partners SaaS Metrics and Benchmarks Resource Guide — https://openviewpartners.com/blog/saas-metrics-and-resources/
- SaaStr, Jason Lemkin — "What is a Good NRR? What is a Good Churn Rate?" — https://www.saastr.com/what-is-a-good-nrr-what-is-a-good-churn-rate/
