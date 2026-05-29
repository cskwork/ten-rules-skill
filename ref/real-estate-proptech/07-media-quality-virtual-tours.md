# Rule 07 — Media Quality and Virtual Tours as First-Class Data

> 사진과 가상 투어는 장식이 아니다 — 매물의 첫인상이자 전환율을 결정하는 핵심 데이터다.
> Photos and virtual tours are not decoration — they are the primary conversion driver and must be treated as structured, validated data.

## Why

Listings with professional photos sell 32% faster and for up to 11% more than those with amateur images (multiple broker studies; Redfin data). Buyers in 2025 expect high-resolution photos, interactive floor plans, and 3D virtual tours as standard; portals that accept low-resolution or missing media lose listing quality scores on Google and aggregator platforms. Virtual tours became table-stakes during the COVID-19 period and have remained so: NAR 2023 Generational Trends report found that 58% of younger buyers made an offer on a home they toured virtually only. Media pipelines that allow sub-standard images or broken tour links undermine listing agent confidence in the platform.

## How to apply

- Enforce minimum media standards at upload time: JPEG/WebP minimum 2000px on the long edge, maximum 20 MB per image, minimum 10 photos for a residential listing before it can go Active.
- Transcode uploaded images to multiple resolution tiers (thumbnail 300px, card 800px, full 1920px, zoom 3840px) and serve via CDN with content-addressed URLs so re-uploads do not cause cache poisoning.
- Accept 3D tour embeds from the major providers (Matterport, iGuide, Ricoh Tours) via a canonical RESO `VirtualTourURLUnbranded` field; validate that the URL is reachable (HTTP 200) at ingest and re-validate nightly.
- Store floor-plan images and square footage as separate structured fields (not embedded in photo captions); validate consistency between listed square footage and the uploaded floor plan where possible.
- Provide a media completeness score on the listing agent dashboard (e.g., "Your listing is missing a virtual tour — listings with tours get 3x more views") to incentivize quality without making virtual tours a hard requirement for MLS compliance.

## Checklist

- [ ] Image upload validates minimum resolution (2000px long edge) and rejects below threshold with a clear message.
- [ ] CDN serves images at thumbnail, card, full, and zoom tiers from content-addressed URLs.
- [ ] Virtual tour URL is validated at ingest and re-validated nightly; broken tours trigger agent notification.
- [ ] Floor plan is stored as a separate structured field, not only as a photo.
- [ ] Agent dashboard shows a media completeness score for each listing.

## References

- NAR 2023 Profile of Home Buyers and Sellers — National Association of Realtors — https://www.nar.realtor/research-and-statistics/research-reports/highlights-from-the-profile-of-home-buyers-and-sellers
- Matterport 3D tour platform documentation — https://matterport.com/
- RESO Data Dictionary VirtualTourURLUnbranded field definition — https://www.reso.org/data-dictionary/
- Ascendix Tech: Property Listing Portal core features — https://ascendixtech.com/property-listing-portal-software-development/
