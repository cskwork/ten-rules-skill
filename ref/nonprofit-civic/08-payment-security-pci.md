# Rule 08 — Payment Security and PCI DSS Scope Reduction

> 카드 데이터를 직접 처리하지 마라 — 토큰화로 PCI 범위를 최소화하라
> Never touch raw card data; use tokenization to shrink PCI DSS scope to its minimum.

## Why

Nonprofit organizations are frequent targets for payment fraud because they often lack dedicated security teams and their donation platforms may run outdated software. A card data breach exposes donors, triggers PCI DSS penalties (up to $100,000/month for non-compliance), and generates press coverage that collapses donor trust — sometimes permanently. The correct architecture is to offload all card data handling to a PCI-certified payment processor via hosted fields or a redirect; the nonprofit's servers receive only an opaque token, never a card number. This reduces the organization's PCI scope from SAQ D (most complex) to SAQ A (simplest), cutting compliance overhead by roughly 90%.

## How to apply

- Integrate payment using the processor's hosted payment fields (Stripe Elements, Braintree Drop-in, PayPal Hosted Fields) so card numbers are entered directly in an iframe served by the processor's PCI-certified environment; your servers receive only a token.
- Never log, cache, or transmit card numbers, CVV codes, or full magnetic stripe data in your application code, request logs, or analytics events — even temporarily.
- Enforce HTTPS with HSTS (HTTP Strict Transport Security) on all pages, not only payment pages; a donor who lands on any non-HTTPS page can be intercepted before reaching the payment step.
- Conduct an annual PCI DSS self-assessment (SAQ A for tokenized hosted-fields implementations) and remediate any findings before accepting live donations.
- Enable fraud screening provided by the processor (Stripe Radar, PayPal Fraud Protection); configure velocity rules to block rapid-fire small test donations (a common card-testing pattern targeting nonprofits).
- Store only the last four digits, card brand, and expiry month/year for display in donor management dashboards; never store the full PAN.

## Checklist

- [ ] Payment form uses processor-hosted fields or redirect; no card data touches application servers
- [ ] Application and access logs verified to contain no card numbers, CVV, or full PANs
- [ ] HTTPS enforced site-wide with HSTS header (max-age >= 31536000)
- [ ] Annual PCI DSS SAQ A completed and findings remediated
- [ ] Velocity fraud rules configured in the payment processor console

## References

- PCI Security Standards Council — PCI DSS v4.0 — https://www.pcisecuritystandards.org/
- Stripe — Integration Security Guide — https://stripe.com/docs/security
- Fundraise Up — "How to Protect Your Nonprofit from Donation Fraud" — https://fundraiseup.com/blog/donation-fraud/
- OWASP — Payment Card Industry Data Security Standard Cheat Sheet — https://cheatsheetseries.owasp.org/cheatsheets/PCI_Data_Security_Standard_Cheat_Sheet.html
