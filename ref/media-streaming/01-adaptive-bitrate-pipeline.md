# Rule 01 — Adaptive Bitrate Pipeline

> 네트워크 환경에 맞게 화질을 자동 조절하는 적응형 비트레이트 파이프라인을 구축하라.
> Build an adaptive bitrate pipeline so every player selects the optimal quality in real time.

## Why

Rebuffering is the single largest driver of viewer abandonment in streaming: a two-second stall increases abandonment probability by 6% according to Akamai research. ABR (Adaptive Bitrate) streaming solves this by encoding each title at multiple bitrate/resolution pairs and letting the player switch representations segment-by-segment based on measured bandwidth. Without a complete bitrate ladder served via HLS (RFC 8216) or MPEG-DASH (ISO/IEC 23009-1) manifests, the player has no fallback when network conditions degrade. Netflix's per-title encoding (described on the Netflix Tech Blog) extends this further: the ladder is computed per-title using VMAF perceptual quality scores rather than fixed resolution-to-bitrate mappings, reducing bandwidth consumption for simple content by up to 20%.

## How to apply

- Transcode every asset into a full bitrate ladder: at minimum 240p, 360p, 480p, 720p, 1080p, and optionally 1080p HDR and 4K, using per-title VMAF-guided encoding rather than fixed bitrate targets.
- Produce a valid MPEG-DASH MPD and HLS M3U8 manifest from the same CMAF (Common Media Application Format) segment set so a single encode serves all clients.
- Segment duration should be 2-6 seconds; shorter segments improve ABR responsiveness at the cost of manifest overhead; 4 seconds is a practical default.
- Store segments and manifests in object storage (S3-compatible), with the manifest treated as mutable and segments as immutable, to simplify CDN caching (manifests: short TTL, segments: long TTL or forever).
- Instrument the player to report representation switches, buffer occupancy, and measured throughput back to your QoE analytics service after every session.

## Checklist

- [ ] All assets have a complete bitrate ladder (minimum 5 renditions) before being marked publishable.
- [ ] Both HLS (M3U8) and DASH (MPD) manifests are generated from the same CMAF segments.
- [ ] Segment TTL in CDN is set to immutable (Cache-Control: max-age=31536000, immutable); manifest TTL is 5-30 seconds for live or 60+ seconds for VOD.
- [ ] Per-title or per-scene encoding quality is validated with VMAF scores >= target threshold before publication.
- [ ] Player ABR algorithm selection (buffered, throughput-based, or hybrid) is documented and A/B-testable.

## References

- Netflix Tech Blog, "Per-Title Encode Optimization" — https://netflixtechblog.com/per-title-encode-optimization-7e99442b62a2
- Netflix Tech Blog, "Toward A Practical Perceptual Video Quality Metric" — https://netflixtechblog.com/toward-a-practical-perceptual-video-quality-metric-653f208b9652
- IETF RFC 8216, "HTTP Live Streaming" (Apple / IETF) — https://datatracker.ietf.org/doc/html/rfc8216
- ISO/IEC 23009-1, "MPEG-DASH: Dynamic Adaptive Streaming over HTTP" — https://www.mpeg.org/standards/MPEG-DASH/
