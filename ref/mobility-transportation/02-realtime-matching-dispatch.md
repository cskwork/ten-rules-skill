# Rule 02 — Real-Time Matching and Dispatch

> 배차 지연은 곧 수익 손실이자 승객 신뢰의 붕괴다.
> Dispatch latency is revenue loss and passenger trust collapse combined.

## Why

Ride-hailing platforms run a two-sided marketplace where supply (drivers) and demand (riders) must be matched continuously in real time. Research published by Chiwei Yan, Helin Zhu, Nikita Korolko, and Dawn Woodard (Naval Research Logistics, 2020) shows that batched matching — collecting requests over a 3–5 second window and solving the assignment jointly — outperforms greedy one-at-a-time dispatch by 15–20% on utilization and ETA. Uber's matching engine processes tens of thousands of dispatch decisions per minute; any latency spike directly increases average pickup time, which is the single strongest predictor of rider churn. The matching algorithm must also account for supply scarcity zones and avoid over-dispatching to the same area simultaneously (convoy problem).

## How to apply

- Use batched matching with a configurable window (3–5 seconds default); re-evaluate every batch independently with a bipartite optimization (Hungarian algorithm or LP relaxation) rather than greedy first-come assignment.
- Expose driver location updates to the matching service at 4–6 second GPS heartbeat intervals; stale positions cause ETA errors that compound downstream.
- Separate the matching service from the ETA service: ETA is read-heavy and cacheable per (origin, destination) cell; matching is write-heavy and stateful.
- Implement supply-heat-map re-positioning incentives (surge zones) as a separate signal fed into the pricing layer — do not conflate supply shortage with dispatch logic.
- Instrument matching latency as a first-class SLO: p50 < 200 ms, p99 < 800 ms; alert before the rider-facing countdown timer becomes unreliable.

## Checklist

- [ ] Matching runs as a batched job with explicit window duration, not greedy one-at-a-time.
- [ ] Driver GPS updates arrive and are indexed within one heartbeat period of transmission.
- [ ] Matching latency p99 is within SLO and monitored with an alert.
- [ ] Assignment algorithm re-runs if a matched driver rejects or goes offline before pickup.
- [ ] Convoy prevention: system caps the number of drivers dispatched to the same micro-zone concurrently.

## References

- Yan, Zhu, Korolko, Woodard — "Dynamic pricing and matching in ride-hailing platforms," Naval Research Logistics 67(8), 2020 — https://doi.org/10.1002/nav.21931
- Uber Engineering Blog — "How Uber Computes ETA at the Lowest Cost" — https://www.uber.com/blog/engineering/how-uber-computes-eta-at-the-lowest-cost/
- Xu et al. — "Large-Scale Order Dispatch in On-Demand Ride-Hailing Platforms," KDD 2018 — https://dl.acm.org/doi/10.1145/3219819.3219824
