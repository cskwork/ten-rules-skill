# Rule 10 — Isolate Promotion and Pricing Logic from the Catalog and Order Core

> 프로모션 로직은 상품 카탈로그와 주문 핵심 로직으로부터 반드시 분리하라.
> Pricing rules change weekly; order and catalog data must remain stable. Mixing them creates bugs that cost real money.

## Why

Promotions — discount codes, flash sales, bundle deals, tiered pricing, loyalty points redemption, free-shipping thresholds — are the highest-frequency change surface in any retail system. In a system where promotion logic is embedded in product records or in the order placement code, a botched promotion deployment can price every product at $0, apply a discount to ineligible items, or break checkout for all users simultaneously. Tax calculation has similar properties: tax rates vary by jurisdiction, product type, and buyer tax status, and they change on legislative schedules outside the engineering team's control. Separating pricing and promotion into a dedicated service or module means a flash-sale configuration change cannot destabilize the order pipeline, and a tax rule update does not require touching catalog code.

## How to apply

- Build a price calculation pipeline: `base_price -> catalog_adjustments -> promotion_stack -> tax -> final_price`; each stage is a pure function that takes context (customer, cart, date, region) and returns a modified price with a reason.
- Store promotion definitions as data (discount type, amount, eligibility rules, validity window, usage limits, stack priority), not as code; a rule change is a database or config update, not a deployment.
- Enforce promotion constraints at application layer: maximum uses per code, per customer, per cart; validate at "apply" time and re-validate at order placement to prevent race conditions with concurrent carts.
- Use a tax calculation service or library (Avalara, TaxJar, or a jurisdiction table) rather than hardcoding rates; tax nexus rules change frequently and vary by state, country, and product category.
- Log the full price calculation trace on every order: which promotions were applied, in what order, with what discount amounts; this trace is required to answer customer service disputes and auditor questions.
- Never let promotions produce a negative item price; add a floor at $0 (or the configured minimum) in the pipeline.

## Checklist

- [ ] Promotion logic lives in a module or service separate from product catalog and order placement code.
- [ ] Promotion definitions are stored as data with validity, usage limits, and eligibility rules enforced at application layer.
- [ ] Price calculation trace (which promotions applied, in what amount) is persisted with every order.
- [ ] Tax rates come from a maintained external service or versioned jurisdiction table, not hardcoded constants.
- [ ] A promotion cannot produce a negative line-item price; a floor is enforced.

## References

- Baymard Institute — E-commerce Cart and Checkout UX (promotion code entry) — https://baymard.com/research/checkout-usability
- Nielsen Norman Group — E-commerce UX Research Reports — https://www.nngroup.com/reports/topic/e-commerce/
- Avalara — Sales Tax for E-commerce — https://www.avalara.com/us/en/products/sales-and-use-tax.html
