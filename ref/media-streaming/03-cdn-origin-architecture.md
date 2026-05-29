# Rule 03 — CDN-Origin Architecture

> 원본 서버 부하를 최소화하고 전 세계 시청자에게 낮은 지연으로 콘텐츠를 전달하라.
> Minimize origin load and deliver content to global audiences with low latency via CDN architecture.

## Why

A streaming platform origin cannot serve millions of concurrent viewers directly; the CDN cache hit ratio determines whether the origin survives peak load. Netflix offloads over 99% of its byte delivery to CDN edge nodes through its Open Connect Appliance program. Poorly configured TTLs, cache-busting query strings on segment URLs, or shared caches between mutable manifests and immutable segments cause cache misses that cascade to origin overload. CDN topology — choosing PoP (Point of Presence) locations relative to your audience geography — directly impacts startup latency and rebuffer rate.

## How to apply

- Use separate cache policies for manifests (short TTL: 5-30 seconds live, 60-300 seconds VOD) and segments (immutable TTL: one year); never treat them identically.
- Use content-addressed URLs for video segments (include a hash or version in the path, not a query parameter) to guarantee cache-ability across all CDN vendors.
- Configure a multi-CDN strategy with at least two providers; route traffic by real-user measurement (RUM) latency to the closest healthy PoP, enabling failover if one CDN degrades.
- Set correct Cache-Control headers at the origin; do not rely on CDN UI overrides, which are brittle across vendors and deployments.
- Use CDN log delivery (real-time or near-real-time) to feed a QoE analytics pipeline that detects cache miss spikes, 4xx/5xx errors, and origin response time degradation.

## Checklist

- [ ] Segment URLs are path-versioned (not query-string-versioned) so CDN proxies cache them correctly.
- [ ] Manifest TTL is separate from segment TTL in Cache-Control headers at origin.
- [ ] At least two CDN providers are configured; failover is tested quarterly.
- [ ] Origin has rate limiting and circuit breaking to prevent cascade overload during CDN miss storms.
- [ ] CDN cache hit ratio is monitored; alert if it drops below 95% for VOD content.

## References

- Akamai VOD Streaming Reference Architecture — https://www.akamai.com/resources/reference-architecture/vod-streaming
- Netflix Tech Blog, "Netflix and Fill" (Open Connect CDN) — https://netflixtechblog.com/netflix-and-fill-c43a32b490c0
- CableLabs, "Adaptive Bitrate and MPEG-DASH" — https://www.cablelabs.com/blog/adaptive-bitrate-and-mpeg-dash
