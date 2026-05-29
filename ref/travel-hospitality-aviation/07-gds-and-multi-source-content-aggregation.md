# Rule 07 — GDS and Multi-Source Content Aggregation

> 이종 공급자 콘텐츠는 표준 스키마로 정규화한 뒤 화면에 노출하라.
> Normalize heterogeneous supplier content to a canonical schema before displaying it.

## Why

An OTA or corporate travel tool aggregates content from three or more GDSs (Amadeus, Sabre, Travelport), direct NDC connections, hotel CRS feeds, and car rental APIs — all with different field names, unit conventions, date formats, and content models. Displaying raw supplier content without normalization produces absurdities: seat pitch in centimeters on one carrier and inches on another, hotel star ratings on a 1–5 scale from one source and a 1–7 scale from another, duplicate itineraries from multiple GDS connections shown as separate results. The canonical content model is also the boundary where business rules (commission, markup, display ranking) are applied once rather than per-source.

## How to apply

- Define a canonical content schema (flight segment, fare component, property, room type, ancillary service) before integrating any supplier; all supplier adapters transform to this schema, not to each other.
- For hotel content, use a hotel content aggregator or deduplicate on IATA location code plus the supplier's own property ID, mapped to a master property ID in your hotel content database; display duplicates are a direct revenue loss.
- Normalize units at ingestion: store all distances in kilometers, all weights in kilograms, all currency amounts as integers in minor units (cents) with an ISO 4217 currency code; convert for display only.
- Implement adapter-level error isolation: a failure in one supplier feed (e.g., Sabre API timeout) must not suppress results from other sources; return partial results with a source-level status indicator.
- Cache normalized content (property descriptions, photos, amenity lists) separately from real-time availability; property content changes on a timescale of days, availability on a timescale of seconds.
- Version your canonical schema; when a supplier adds a new ancillary type or room category, add it to the schema as an optional extension before updating adapters.

## Checklist

- [ ] Canonical content schema is documented and version-controlled; adapters reference the schema, not each other.
- [ ] Hotel deduplication uses a master property ID mapped from all supplier property codes.
- [ ] All monetary amounts are stored as minor-unit integers with ISO 4217 currency code.
- [ ] A supplier feed failure returns partial results; the UI indicates which sources are degraded.
- [ ] Property content cache TTL is distinct from (and longer than) availability cache TTL.

## References

- Amadeus for Developers API documentation — https://developers.amadeus.com/
- AltexSoft: OTA Inventory Systems and Content Aggregation — https://www.altexsoft.com/blog/ota-inventory-system/
- AltexSoft: Travel and Booking APIs — https://www.altexsoft.com/blog/travel-and-booking-apis-for-online-travel-and-tourism-service-providers/
- IATA PADIS (Passenger and Airport Data Interchange Standards) — https://www.iata.org/en/programs/workgroups-and-projects/passenger/padis/
