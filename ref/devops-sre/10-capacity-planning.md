# Rule 10 — Plan Capacity and Manage Load

> 부하를 예측하고 한계를 알고 우아하게 버텨라.
> Forecast load, know your limits, and degrade gracefully.

## Why

Systems fail not only from bugs but from running out of headroom. The Google SRE Book treats capacity planning as forecasting demand, knowing each service's limits through load testing, and provisioning ahead of need. Resilience patterns then protect the system when demand still spikes: timeouts, retries with backoff, circuit breakers, and load shedding keep a degraded service serving instead of collapsing. Stale-cache-with-warning beats a hard error.

## How to apply

- Forecast demand from organic growth plus known events (launches, seasonal peaks) and provision against it.
- Load-test to find each service's real breaking point rather than assuming headroom.
- Set explicit timeouts on every outbound call; never wait infinitely.
- Add retries with exponential backoff and jitter for idempotent ops, and circuit breakers to stop cascading failure.
- Shed or queue excess load and degrade non-critical features instead of failing the whole request.

## Checklist

- [ ] Capacity is forecast from growth plus known events, with headroom provisioned
- [ ] Service breaking points are known from load tests
- [ ] Every outbound call has an explicit timeout
- [ ] Circuit breakers and load shedding protect against cascading failure

## References

- Google SRE — Addressing Cascading Failures — https://sre.google/sre-book/addressing-cascading-failures/
- Google SRE — Software Engineering in SRE (capacity) — https://sre.google/sre-book/
