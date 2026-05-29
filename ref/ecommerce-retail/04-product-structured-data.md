# Rule 04 — Mark Up Every Product with Schema.org Product + Offer

> 모든 상품 페이지에 구조화된 데이터를 반드시 포함하라.
> Search engines and AI shopping surfaces can only surface your product accurately if you speak the vocabulary they require.

## Why

Schema.org's `Product` and `Offer` types — a joint initiative by Google, Microsoft, Yahoo, and Yandex — are the canonical vocabulary for describing products on the web. Correct implementation unlocks Google's rich results: price, availability, star ratings, and shipping information appear directly in search result snippets, lifting click-through rates substantially. A product page without structured data competes only on title and meta description; a product page with complete structured data competes with price, badge, and availability information visible before the user clicks. As AI-powered shopping surfaces (Google Shopping Graph, LLM-driven product search) expand, structured data becomes the primary channel through which your catalog is indexed and surfaced to buyers who may never scroll a traditional SERP.

## How to apply

- Emit a `<script type="application/ld+json">` block on every product page containing at minimum: `@type: Product`, `name`, `image`, `description`, `sku` or `mpn`, `brand`, and a nested `Offer` with `price`, `priceCurrency`, `availability` (using `schema.org/InStock` or `schema.org/OutOfStock`), and `url`.
- Add `aggregateRating` when the product has reviews; this unlocks star rating rich results.
- Include `OfferShippingDetails` to surface free-shipping badges directly in search results.
- Keep structured data in sync with visible page content: a price mismatch between the JSON-LD and the displayed price will trigger a Google Search Console manual action.
- Validate structured data with Google's Rich Results Test after every deploy that touches product pages.
- For product variants (size, color), emit a separate `Offer` per variant or use `itemOffered` correctly; do not aggregate variant data into a single ambiguous Offer.

## Checklist

- [ ] Every product page has a valid `Product` JSON-LD block with `name`, `image`, `Offer.price`, and `Offer.availability`.
- [ ] Price and availability in JSON-LD exactly match the values displayed on the page.
- [ ] `aggregateRating` is present when the product has at least one review.
- [ ] Google Rich Results Test passes with no errors on a sample of product pages.
- [ ] A CI step or post-deploy check validates structured data on key templates.

## References

- Schema.org — Product type — https://schema.org/Product
- Schema.org — Offer type — https://schema.org/Offer
- Google Search Central — Product structured data guide — https://developers.google.com/search/docs/appearance/structured-data/product
- Google Search Central — Introduction to structured data — https://developers.google.com/search/docs/appearance/structured-data/intro-structured-data
