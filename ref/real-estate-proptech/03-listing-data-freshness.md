# Rule 03 — Listing Data Freshness and Status Accuracy

> 매물 상태가 1시간만 늦어도 소비자는 이미 없는 집에 연락한다 — 지연은 신뢰 손실이다.
> A one-hour listing delay means consumers contact agents about homes that no longer exist — staleness destroys trust faster than any bug.

## Why

Real estate listing inventory turns fast: in competitive markets, homes go pending within hours. Displaying a "For Sale" badge on a property that went Under Contract or Closed is the most common source of consumer complaints against listing portals. MLS rules enforced by NAR require status changes to be entered within one to two business days, but portals that cache data for 24 hours will regularly show stale inventory. Stale listings drive wasted agent calls, erode consumer trust, and in some markets constitute a misleading business practice under FTC guidelines.

## How to apply

- Pull listing status updates from the MLS feed with a maximum cache TTL of 15 minutes for the StatusChange and ListPrice fields; other fields may tolerate longer TTLs (photos: 4 hours, description: 1 hour).
- Implement a webhook or delta-feed subscription (RESO Web API `$delta` queries) so status changes push to your system rather than requiring full polls.
- Display a "last synced" timestamp on every listing detail page so users know the data age; if sync age exceeds 30 minutes, surface a warning banner.
- Mark listings with StandardStatus of Pending, UnderContract, or Closed with a prominent visual overlay before the page fully loads — do not wait for the hero image to display first.
- Build a reconciliation job that runs every 6 hours and cross-checks your stored status against the live MLS feed to catch any missed delta events.

## Checklist

- [ ] StatusChange field cache TTL is 15 minutes or less.
- [ ] Delta/webhook subscription is in place; full polling is a fallback, not the primary mechanism.
- [ ] Listing detail pages display last-synced timestamp.
- [ ] Pending/Closed visual overlays render before above-the-fold content.
- [ ] Reconciliation job runs at least every 6 hours and alerts on mismatch counts above threshold.

## References

- RESO Web API Delta Query specification — https://www.reso.org/reso-web-api/
- NAR IDX Policy — National Association of Realtors — https://www.nar.realtor/internet-data-exchange-idx-policy
- SimplyRETS: The RESO Data Dictionary and feed architecture — https://simplyrets.com/blog/data-dictionary
- Luxury Presence: IDX Real Estate Websites guide 2026 — https://www.luxurypresence.com/blogs/real-estate-website-internet-data-exchange-idx-integration/
