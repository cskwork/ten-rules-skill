# Media & Streaming — 10 Rules (index)

Source: Grounded in the Netflix Tech Blog (netflixtechblog.com), ISO/IEC 23009-1 (MPEG-DASH), IETF RFC 8216 (HLS), Charu C. Aggarwal's "Recommender Systems: The Textbook" (Springer, 2016), Tien Tzuo's "Subscribed" (Portfolio, 2018), and Akamai's VOD Streaming Reference Architecture. Building software for Media & Streaming means operating video/audio delivery pipelines at internet scale where rebuffer events, DRM failures, or recommendation misses translate directly into subscriber churn and licensing penalties.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-adaptive-bitrate-pipeline.md` | Deliver every bitrate ladder via ABR manifests | Video ingest, encoding, playback, CDN origin setup |
| 02 | `02-multi-drm-content-protection.md` | Enforce multi-DRM on all protected assets | License server, key management, device playback |
| 03 | `03-cdn-origin-architecture.md` | Colocate origin and CDN for cache-hit maximization | CDN config, PoP selection, cache invalidation |
| 04 | `04-playback-quality-metrics.md` | Measure VMAF, rebuffer rate, and startup latency | Player instrumentation, QoE dashboards, A/B tests |
| 05 | `05-content-metadata-catalog.md` | Model content catalog with rich, normalized metadata | Catalog service, search, parental controls, localization |
| 06 | `06-recommender-system-design.md` | Serve personalized rankings via two-stage retrieval | Recommendation engine, homepage, search ranking |
| 07 | `07-subscription-and-entitlement.md` | Gate every asset access through entitlement checks | Subscription tiers, paywalls, trial flows, billing |
| 08 | `08-churn-and-retention-signals.md` | Track engagement signals to predict and prevent churn | Analytics pipeline, retention campaigns, product iteration |
| 09 | `09-live-streaming-reliability.md` | Design live pipelines for sub-30-second latency and N+1 redundancy | Live ingest, low-latency HLS/CMAF, failover |
| 10 | `10-global-compliance-and-geo-rights.md` | Enforce geo-rights and age ratings at the edge | Rights management, geo-blocking, content ratings |

Default for "add a new video playback or streaming feature": read 01, 02, 03, 04 at minimum.
