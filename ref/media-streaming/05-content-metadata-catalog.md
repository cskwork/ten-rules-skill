# Rule 05 — Content Metadata Catalog

> 콘텐츠 카탈로그를 풍부하고 정규화된 메타데이터로 설계하여 검색, 추천, 규정 준수를 지원하라.
> Design the content catalog with rich, normalized metadata to power search, recommendations, and compliance.

## Why

The content catalog is the operational backbone of every media platform: it feeds the recommender system, drives search, enforces parental controls, governs geo-rights, and provides data for royalty and licensing reports. Poor metadata — missing genres, incorrect ratings, absent localization data, or inconsistent episode numbering — causes content to be unsearchable, incorrectly recommended, or unlawfully delivered to underage or geographically restricted users. Unlike a typical product catalog, media metadata includes legally significant fields (age ratings, copyright notice, licensed territory) that must be accurate at ingest time, not corrected lazily.

## How to apply

- Model the catalog with a clear content hierarchy: Series -> Season -> Episode for episodic; Movie as a standalone asset; with a separate Offer entity linking a content item to a pricing tier, territory, and availability window.
- Mandate a minimum metadata schema at ingest: title, original language, synopsis, genres (from a controlled vocabulary), content advisory (age rating per territory: MPAA, BBFC, FSK, etc.), and at least one poster image per aspect ratio.
- Store localized metadata (titles, synopses, subtitles, dubbed audio tracks) in a separate locale table linked by content ID rather than embedded in the canonical record; this allows incremental localization without blocking release.
- Use a controlled vocabulary for genres, moods, and content tags; free-text genre fields produce inconsistent search and recommendation inputs.
- Expose catalog data through an internal API with versioned schemas; downstream services (recommendation engine, search index, player) consume the catalog API, never the raw database.

## Checklist

- [ ] Every publishable asset has a complete minimum metadata set (title, rating, genres, synopsis, poster) before the publish gate.
- [ ] Age ratings are stored per-territory, not as a single global value.
- [ ] Localized text and dubbed audio are linked by locale code, not embedded in the primary record.
- [ ] Genre and tag vocabulary is managed from a controlled list; free-text entry is blocked at the ingest UI.
- [ ] Catalog API is versioned; consumers declare the version they depend on.

## References

- EBU (European Broadcasting Union), "EBU Core Metadata Set" — https://tech.ebu.ch/MetadataEbuCore
- EIDR (Entertainment Identifier Registry) — https://www.eidr.org/
- Charu C. Aggarwal, "Recommender Systems: The Textbook" (Springer, 2016) — https://www.springer.com/gp/book/9783319296579
- Netflix Tech Blog, "Rapid Event Notification System at Netflix" (catalog event bus pattern) — https://netflixtechblog.com/rapid-event-notification-system-at-netflix-6deb1d2b57d1
