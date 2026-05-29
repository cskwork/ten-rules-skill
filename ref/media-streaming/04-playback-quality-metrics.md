# Rule 04 — Playback Quality Metrics

> 재버퍼링 비율, 시작 지연, VMAF 점수를 측정하여 시청 품질을 지속적으로 개선하라.
> Measure rebuffer rate, startup latency, and perceptual quality scores to drive continuous QoE improvement.

## Why

Streaming quality is invisible in server logs; it is only observable at the player. A 1% increase in rebuffer rate correlates with a measurable increase in subscriber churn. Netflix built VMAF (Video Multimethod Assessment Fusion) precisely because PSNR and SSIM correlate poorly with human perception at streaming bitrates; using the wrong metric leads to encoding decisions that waste bandwidth or degrade perceived quality. Without client-side Quality of Experience (QoE) telemetry flowing back to the platform, engineering teams are flying blind when optimizing encoding ladders, CDN configuration, or ABR algorithms.

## How to apply

- Instrument the player SDK to report: startup time (time-to-first-frame), join latency, rebuffer events (count + total duration), representation switches, exit-before-start events, and playback errors with error codes.
- Aggregate QoE metrics into a time-series store segmented by CDN PoP, device type, ISP, content ID, and bitrate; surface anomalies within 5 minutes of occurrence.
- Use VMAF as the canonical perceptual quality metric for encoding decisions; target VMAF >= 93 for premium tiers and >= 85 for mobile/low-bandwidth tiers.
- Run A/B tests on encoding parameters (ladder shapes, codec selections, segment durations) using rebuffer rate and video start failure rate as primary success metrics, not just bitrate savings.
- Define SLOs (Service Level Objectives) for playback quality: e.g., P95 startup time < 3 seconds, rebuffer ratio < 0.5%, video start failure rate < 1%.

## Checklist

- [ ] Player SDK emits per-session QoE events to a central analytics pipeline.
- [ ] QoE dashboard is live and segmented by CDN, device, ISP, and content ID.
- [ ] VMAF scores are computed for every encode in the transcoding pipeline before publication.
- [ ] SLOs for startup time, rebuffer rate, and start failure rate are defined and alerting is configured.
- [ ] Encoding changes are validated against QoE metrics in a controlled A/B test before full rollout.

## References

- Netflix Tech Blog, "Toward A Practical Perceptual Video Quality Metric (VMAF)" — https://netflixtechblog.com/toward-a-practical-perceptual-video-quality-metric-653f208b9652
- Netflix Tech Blog, "Using Machine Learning to Improve Streaming Quality at Netflix" — https://netflixtechblog.com/using-machine-learning-to-improve-streaming-quality-at-netflix-9651263ef09f
- Netflix Tech Blog, "It's All A/Bout Testing: The Netflix Experimentation Platform" — https://netflixtechblog.com/its-all-a-bout-testing-the-netflix-experimentation-platform-4e1ca458c15
- ITU-T Recommendation P.1203, "Parametric bitstream-based quality assessment of progressive download and adaptive audiovisual streaming services over reliable transport" — https://www.itu.int/rec/T-REC-P.1203/en
