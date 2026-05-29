# E-commerce & Retail — 10 Rules (index)

Source: Grounded in Baymard Institute large-scale checkout and UX research (baymard.com), Nielsen Norman Group e-commerce usability reports (nngroup.com), PCI DSS v4 from the PCI Security Standards Council (pcisecuritystandards.org), Schema.org Product/Offer vocabulary (schema.org), Google Core Web Vitals guidance (web.dev), Steve Krug's *Don't Make Me Think* (3rd ed., Peachpit), and Luke Wroblewski's *Web Form Design: Filling in the Blanks* (Rosenfeld Media). Building software for e-commerce and retail means designing systems where the purchase funnel, inventory truth, payment security, and real-time performance directly translate into or destroy revenue.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-checkout-friction.md` | Minimize steps and fields in checkout | Checkout flow, cart, order forms, guest purchase |
| 02 | `02-inventory-truth.md` | Inventory state must be the single source of truth | Stock display, add-to-cart, order placement, multi-channel sync |
| 03 | `03-pci-payment-security.md` | Never touch raw card data; delegate to a certified vault | Payment forms, card tokenization, stored payment methods |
| 04 | `04-product-structured-data.md` | Mark up every product with Schema.org Product + Offer | Product pages, SEO, price/availability display, search integration |
| 05 | `05-core-web-vitals-performance.md` | LCP under 2.5 s and CLS under 0.1 on every product page | Page speed, image loading, layout stability, storefront builds |
| 06 | `06-trust-signals.md` | Surface trust signals at every moment of purchase doubt | Product pages, cart, checkout, return policy, reviews |
| 07 | `07-search-and-discovery.md` | Faceted search and relevance must match buyer intent | Catalog search, filtering, category pages, autocomplete |
| 08 | `08-mobile-first-purchase.md` | Thumb-reachable tap targets and single-tap payment on mobile | Mobile layout, touch forms, Apple Pay / Google Pay integration |
| 09 | `09-order-state-machine.md` | Model the order lifecycle as an explicit, auditable state machine | Order management, fulfillment, cancellation, returns, refunds |
| 10 | `10-pricing-and-promotions.md` | Isolate promotion and pricing logic from the catalog and order core | Discount codes, flash sales, tiered pricing, tax calculation |

Default for "building or modifying a product page": read 01, 04, 05, 06 at minimum.
