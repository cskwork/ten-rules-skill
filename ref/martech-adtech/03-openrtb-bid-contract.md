# Rule 03 — OpenRTB Bid Contract

> OpenRTB 입찰 계약서의 모든 필드를 정확히 준수하고, 임의로 변형하지 말라.
> Honour every field in the OpenRTB bid-request and bid-response contract exactly; do not silently drop, transform, or fabricate values.

## Why

Programmatic advertising exchanges process billions of bid requests per day. A single field deviation — a malformed `imp.banner.format`, a missing `site.page`, or a fabricated `device.ua` — causes the buying platform to reject the bid, misprice inventory, or apply incorrect targeting. More seriously, injecting false values (spoofed domain, hidden iframe depth) is the primary mechanism of ad fraud and domain spoofing, which cost the industry an estimated $84 billion globally in 2023. OpenRTB 2.6 (maintained by IAB Tech Lab on GitHub) is the canonical protocol; version mismatches between SSP and DSP implementations are among the most common root causes of revenue discrepancies.

## How to apply

- Validate every outbound bid request against the OpenRTB 2.6 JSON schema before transmission; reject malformed requests at the exchange boundary rather than passing them downstream.
- Populate `site.page` and `site.domain` from the actual page URL, never from a configured default; inventory spoofing begins here.
- Implement ads.txt / app-ads.txt validation on the buy side: only bid on inventory where the seller is authorized in the publisher's ads.txt file.
- Pass `imp.ext.skadn` (SKAdNetwork) fields on iOS and `imp.ext.iab_dsa` fields in EU inventory to satisfy platform and regulatory requirements introduced after OpenRTB 2.5.
- Log the full bid request and response pair for at least 7 days to support discrepancy investigation with partners.

## Checklist

- [ ] Bid requests validated against OpenRTB 2.6 schema before leaving the exchange
- [ ] `site.page` and `site.domain` reflect the actual page, not a configured placeholder
- [ ] ads.txt / sellers.json lookups run before placing bids
- [ ] SKAdNetwork and DSA extension fields included where required by platform or regulation
- [ ] Bid request/response pairs logged for discrepancy reconciliation

## References

- IAB Tech Lab OpenRTB specification — https://iabtechlab.com/standards/openrtb/
- OpenRTB 2.6 specification on GitHub — https://github.com/InteractiveAdvertisingBureau/openrtb2.x/blob/main/2.6.md
- IAB Tech Lab ads.txt standard — https://iabtechlab.com/ads-txt/
