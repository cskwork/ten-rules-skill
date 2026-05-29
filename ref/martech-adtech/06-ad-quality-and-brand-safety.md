# Rule 06 — Ad Quality and Brand Safety

> 광고 소재와 게재 환경을 수집 시점에 검증하라. 사후 정정은 브랜드 신뢰를 회복하지 못한다.
> Validate ad creatives and placement environments at ingestion; post-hoc correction cannot recover brand trust once the ad has served.

## Why

Programmatic advertising's automated, high-velocity nature means that without proactive controls, a brand's ad can appear next to extremist content, be served inside hidden iframes that no human ever sees (invalid traffic, IVT), or be rendered in a malware-laced creative that installs software on the viewer's device. The Association of National Advertisers estimated $13 billion in wasted spend on invalid traffic in 2023 alone. Brand safety failures trigger immediate advertiser pullbacks and cause lasting reputational damage — high-profile examples include major brands unknowingly funding disinformation sites for years through programmatic buys. IAB Tech Lab's ads.txt, sellers.json, and SIVT (Sophisticated Invalid Traffic) detection standards exist precisely to address these risks at the supply chain level.

## How to apply

- Run all incoming creatives through a static and dynamic scanner (HTML/JS analysis, pixel firing simulation) before approving them for serving; reject any creative that loads external scripts not on an approved vendor list.
- Implement IAB Tech Lab's Seller Defined Audiences (SDA) and Content Taxonomy 3.0 to classify page context at the impression level, enabling keyword and category-based brand safety filtering.
- Subscribe to at least one third-party IVT measurement vendor (DoubleVerify, IAS, MOAT) and set hard block thresholds; treat IVT rate as a campaign health KPI alongside CTR and CVR.
- For publisher-side implementations, integrate ads.txt and sellers.json entries for every authorized reseller; audit quarterly for unauthorized entries.
- Establish a brand safety incident response runbook: detection trigger, pause-spend decision authority, partner notification, and post-mortem timeline.

## Checklist

- [ ] Creative scanner runs on every new creative before first serve
- [ ] Content taxonomy classification applied at impression level for brand safety filtering
- [ ] IVT measurement vendor active; block thresholds defined and enforced
- [ ] ads.txt and sellers.json entries audited quarterly
- [ ] Brand safety incident runbook documented with clear escalation path

## References

- IAB Tech Lab ads.txt specification — https://iabtechlab.com/ads-txt/
- IAB Tech Lab Content Taxonomy — https://iabtechlab.com/standards/content-taxonomy/
- IAB Tech Lab Invalid Traffic Detection — https://iabtechlab.com/standards/invalid-traffic-detection/
