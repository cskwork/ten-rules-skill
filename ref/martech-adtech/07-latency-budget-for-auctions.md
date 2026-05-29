# Rule 07 — Latency Budget for Auctions

> 입찰 응답 지연은 수익 손실이다. 경매 타임아웃 안에 응답을 완료하도록 시스템을 설계하라.
> Auction latency is lost revenue; design every component in the bid path to respond within the exchange timeout budget, treating latency as a first-class reliability metric.

## Why

OpenRTB exchanges enforce a hard bid-timeout — typically 80–150 ms for display, 300 ms for video — after which the bid is simply discarded, not queued. A DSP or ad server that responds 10 ms late loses that impression permanently and pays the infrastructure cost of the work already done. At scale, a 5% timeout rate on a platform processing 500,000 QPS represents 25,000 lost impressions per second. Unlike a web API where a slow response is still returned, in RTB silence is failure. Every network hop, database lookup, and feature-flag check in the bid path must fit inside the remaining budget after network transit time is subtracted.

## How to apply

- Measure and publish a latency budget breakdown for the full bid path: network ingress, request parsing, audience lookup, model scoring, bid calculation, and network egress. Each segment gets an allocated share.
- Use in-memory data stores (Redis, Aerospike) for audience segment lookups and frequency caps; no SQL or disk I/O in the hot path.
- Pre-compute and cache model scores (propensity scores, bid price predictions) outside the auction; refresh asynchronously, never block a live bid on model recomputation.
- Set a timeout shorter than the exchange deadline at each internal service boundary so the caller can fall back to a default bid rather than timing out entirely.
- Track p50, p95, p99 bid response latency per exchange partner as a dashboard KPI; alert at p99 > 80% of the partner's stated timeout.

## Checklist

- [ ] Latency budget documented per segment of the bid path
- [ ] Audience and frequency data served from in-memory store, no SQL in hot path
- [ ] Model scores pre-computed and cached; no synchronous inference in auction loop
- [ ] Internal service timeouts set below exchange deadline to allow graceful fallback
- [ ] p99 bid latency monitored and alerted per exchange partner

## References

- IAB Tech Lab OpenRTB 2.6 specification (timeout field semantics) — https://github.com/InteractiveAdvertisingBureau/openrtb2.x/blob/main/2.6.md
- Aerospike programmatic advertising data flow guide — https://aerospike.com/blog/programmatic-advertising-data-flow-smarter-rtb/
- Kevel Real-Time Bidding developer documentation — https://dev.kevel.com/docs/real-time-bidding
