# Rule 10 — Search Performance and Cache Strategy

> 가용성 응답은 명시적 TTL로 캐시하라. 만료된 운임을 예약 가능한 것처럼 노출하지 마라.
> Cache availability responses with explicit TTLs; never serve stale fares as bookable.

## Why

Fare and rate search is the highest-traffic, highest-latency operation in any travel platform. A single low-price calendar query against a GDS can fan out to hundreds of origin-destination pair requests; without caching, a busy OTA would exhaust its GDS transaction quota within minutes. At the same time, availability and pricing data have a defined shelf life — IATA fare quotes expire (typically 60–90 minutes for airline offers, shorter during high-demand periods); hotel rates are valid until the rate plan close-out time. Serving a cached fare after expiry and allowing a customer to complete payment at that price creates a booking at a potentially non-existent rate, requiring either manual repricing (customer experience failure) or selling at a loss (revenue failure). The cache strategy must encode expiry semantics, not just TTL values.

## How to apply

- Cache at two distinct layers: (a) content cache — property descriptions, airline schedules, amenity data (TTL: hours to days); (b) availability/price cache — live fare quotes, room rates (TTL: 5–30 minutes, sourced from the supplier's own offer expiry field).
- Annotate every cached availability record with the supplier's offer expiry timestamp; at checkout, re-validate against the supplier before presenting the payment form, and surface a "price changed" interstitial rather than proceeding silently.
- Use cache-aside pattern (application reads from cache, fetches from supplier on miss, writes back with TTL); never use write-through for availability data because the supplier is the authoritative source.
- Key fare/rate cache entries on the full search parameters — origin, destination, dates, passenger type codes, cabin class, currency, point-of-sale — any variation in these parameters must produce a distinct cache key.
- Implement a negative cache for "no availability" responses from suppliers: cache the absence of inventory for a short TTL (60–120 seconds) to prevent hammering a supplier that has returned empty results.
- For low-price calendar and flexible-date displays, pre-warm the cache with a background job on a defined schedule (e.g., nightly for 90-day lookahead); mark pre-warmed entries as "indicative pricing" and re-validate on click.

## Checklist

- [ ] Availability cache TTL is sourced from supplier offer expiry, not a hardcoded global value.
- [ ] Checkout flow re-validates price against supplier before presenting payment form.
- [ ] Cache keys include all search parameters that affect price or availability.
- [ ] Negative cache is implemented for no-availability responses; TTL is short (under 2 minutes).
- [ ] Pre-warmed calendar prices are labeled as indicative until re-validated.

## References

- Amadeus Flight Offers Search API (availability and caching semantics) — https://developers.amadeus.com/
- IATA NDC Offers architecture and offer expiry — https://www.iata.org/en/programs/airline-distribution/retailing/ndc/
- AltexSoft: Travel Agency Inventory System — https://www.altexsoft.com/blog/ota-inventory-system/
- "Designing Data-Intensive Applications" (Martin Kleppmann, O'Reilly) — https://dataintensive.net/
