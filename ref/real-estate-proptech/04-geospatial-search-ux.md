# Rule 04 — Map-First Geospatial Search UX

> 부동산 검색은 지도가 먼저다 — 위치를 선택하는 것이 가격 범위보다 앞선다.
> In property search, the map comes first — location selection precedes price range in every user's mental model.

## Why

Real estate is fundamentally location-bound: buyers and renters optimize simultaneously on neighborhood, commute, school district, flood zone, and proximity to amenities. List-only search interfaces (pagination of cards) fail because users cannot resolve spatial relationships from text addresses. Eye-tracking and conversion studies from major portals (Zillow, Rightmove, Redfin UX reports) consistently show that map interaction precedes filter engagement. Polygon-draw and custom-boundary tools increase time-on-site and lead capture versus radius or ZIP-code-only search.

## How to apply

- Make the map the default, above-the-fold view on desktop; on mobile, provide a persistent "Map" toggle that switches from list to map without losing filter state.
- Implement polygon-draw search (free-draw custom boundary) in addition to radius and ZIP/postal-code filters; store saved polygon searches in user accounts.
- Cluster markers at zoom levels where individual pins would overlap; declutter by showing count bubbles, not individual markers, below zoom level 13.
- Load listing pins and basic metadata (price, beds, status) in a lightweight GeoJSON or vector-tile endpoint separate from the full listing detail; the map must respond to pan and zoom within 300 ms.
- Layer optional contextual overlays (school districts, flood zones, transit lines, walk scores) as toggleable map layers fetched from authoritative sources (FEMA, NCES, transit APIs); never bake these into the base map.
- Use PostGIS or an equivalent spatial index (H3, S2) for backend polygon containment queries; do not perform listing-in-polygon filtering in application code.

## Checklist

- [ ] Map view is the default on desktop and accessible within one tap on mobile.
- [ ] Polygon-draw search is implemented and saved searches persist polygons, not just bounding boxes.
- [ ] Map pan/zoom triggers a new listing query and updates results within 300 ms.
- [ ] Marker clustering is active below zoom level 13.
- [ ] Contextual overlays (school, flood, transit) are toggleable and sourced from authoritative external APIs.
- [ ] Backend uses a spatial index for containment queries.

## References

- RESO Web API geospatial query support — https://www.reso.org/reso-web-api/
- iHomeFinder: IDX Feed and geospatial search features — https://www.ihomefinder.com/blog/agent-and-broker-resources/idx-feed-real-estate/
- IDX Broker polygon map tool documentation — https://www.idxbroker.com/
- Ascendix Tech: How to Build a Property Listing Portal — https://ascendixtech.com/property-listing-portal-software-development/
