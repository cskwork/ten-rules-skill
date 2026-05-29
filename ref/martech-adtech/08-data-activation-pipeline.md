# Rule 08 — Data Activation Pipeline

> 배치 ETL은 기회를 놓친다. 실시간 활성화 파이프라인으로 고객 순간을 포착하라.
> Batch ETL misses the moment; design activation pipelines for real-time streaming so audience updates reach ad platforms within minutes of the triggering event.

## Why

A customer who abandons a cart at 14:00 and receives a retargeting ad at 14:05 converts at a dramatically higher rate than one reached at 02:00 the next morning after an overnight batch job completes. Marketing platforms such as Meta Advantage and Google Performance Max optimize toward events; stale event data degrades their learning algorithms and wastes budget during the warm-up period. CDPs that rely on nightly ETL loads cannot support real-time personalization, triggered email, or dynamic creative optimization. The data activation pipeline — from event capture through identity resolution to segment membership update to platform API push — must be treated as a latency-sensitive system, not a reporting pipeline.

## How to apply

- Instrument event collection with a streaming backbone (Kafka, Kinesis, or Pub/Sub) rather than polling batch jobs; target audience segment update latency of under 5 minutes for behavioral triggers.
- Use server-side event forwarding (Meta Conversions API, Google Ads Data Hub, TikTok Events API) as the primary activation method; client-side pixels are a secondary redundancy layer, not the source of truth.
- Separate read-optimized segment query stores from write-optimized event ingest stores; never run audience queries against the primary event log.
- Define SLOs for activation pipeline latency (e.g., p95 segment membership update within 3 minutes of qualifying event) and alert when breached.
- Test pipeline end-to-end with synthetic events in staging before deploying changes; a silent pipeline failure — events arriving but not activating — is harder to detect than a crash.

## Checklist

- [ ] Event collection uses a streaming backbone, not scheduled batch jobs
- [ ] Server-side API integrations are the primary channel for ad platform activation
- [ ] Segment query store is separate from event ingest store
- [ ] Activation latency SLO defined and monitored (e.g., p95 under 5 minutes)
- [ ] End-to-end pipeline tested with synthetic events before each deployment

## References

- CDP Institute Buyer's Guide (real-time activation requirements) — https://www.cdpinstitute.org/resources/customer-data-platform-buyers-guide/
- Apache Kafka documentation: event streaming introduction — https://kafka.apache.org/documentation/
- Aerospike programmatic advertising data flow — https://aerospike.com/blog/programmatic-advertising-data-flow-smarter-rtb/
