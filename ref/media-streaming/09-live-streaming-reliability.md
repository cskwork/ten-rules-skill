# Rule 09 — Live Streaming Reliability

> 라이브 스트리밍 파이프라인은 N+1 이중화와 30초 이하 지연으로 설계하라.
> Design live streaming pipelines for N+1 redundancy and sub-30-second end-to-end latency.

## Why

Live streaming failures are uniquely high-stakes: a major sports event or live concert has no replay value if the stream drops, and viewer abandonment during a live event is permanent rather than recoverable. Unlike VOD, live pipelines have no buffer: ingest, transcoding, packaging, and CDN delivery all operate in a real-time chain where a single point of failure surfaces immediately to all concurrent viewers. Netflix's live infrastructure, deployed for events like live sports and awards shows, is designed around N+1 redundancy at every stage — dual ingest paths, redundant transcoders, and multi-CDN delivery — because the cost of a failure during a live event far exceeds the cost of redundant infrastructure.

## How to apply

- Use N+1 redundancy at each pipeline stage: two independent ingest paths (primary + backup contribution encoder), at least two parallel transcoder instances processing the same input independently, and multi-CDN delivery with real-time failover.
- Choose Low-Latency HLS (LL-HLS, IETF RFC 9596) or Low-Latency DASH (CMAF chunked transfer) for live streams targeting sub-10-second glass-to-glass latency; standard HLS/DASH segment durations (6+ seconds) add 30-60 seconds of latency.
- Implement automated health checks on each pipeline stage with a watchdog that triggers failover within 2-5 seconds of detecting a stall in the primary path; human intervention is too slow for live events.
- Pre-warm CDN edge nodes before high-profile live events by simulating viewer traffic or using CDN pre-positioning APIs; cold cache misses at event start create origin overload exactly when demand spikes.
- Monitor end-to-end live pipeline latency, ingest frame drop rate, transcoder queue depth, and CDN origin hit rate on a live operations dashboard with alerting thresholds lower than normal VOD SLOs.

## Checklist

- [ ] Dual ingest paths (primary + backup) are configured and failover is tested before each major live event.
- [ ] Transcoding stage runs at least N+1 instances with output comparison to detect silent encoder failures.
- [ ] Low-Latency HLS or LL-DASH is used for events where < 30-second latency is required.
- [ ] Automated pipeline health checks trigger failover without manual intervention within 5 seconds.
- [ ] CDN pre-warming is executed at least 30 minutes before high-audience live events.

## References

- Netflix Tech Blog, "Behind the Streams: Three Years of Live at Netflix" — https://netflixtechblog.com/behind-the-streams-live-at-netflix-part-1-d23f917c2f40
- Apple Developer Documentation, "Enabling Low-Latency HLS" (LL-HLS specification) — https://developer.apple.com/documentation/http-live-streaming/enabling-low-latency-hls
- ISO/IEC 23009-1, "MPEG-DASH" (CMAF low-latency chunked transfer mode) — https://www.mpeg.org/standards/MPEG-DASH/
- Akamai Media Delivery Solutions — https://www.akamai.com/content-delivery-network/media-delivery
