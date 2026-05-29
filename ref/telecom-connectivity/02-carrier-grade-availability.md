# Rule 02 — Design for 99.999% Uptime from Day One

> 통신 시스템의 가용성 목표는 연간 다운타임 5분 이하로 설계 초기부터 내재화해야 한다
> Carrier-grade availability (five nines, 5.26 minutes downtime per year) must be an architectural constraint, not a post-launch tuning goal.

## Why

Telecoms are legally bound by SLAs with regulators and wholesale partners; a provisioning system outage that prevents activations or blocks emergency calls (911/112) triggers regulatory penalties and contract breach. The industry term "carrier grade" has a precise technical meaning: 99.999% availability, sub-second failover, no single point of failure, and graceful degradation under partial failure. Software that treats availability as a non-functional afterthought will never reach carrier-grade status through incremental patching — the architecture must embed redundancy from the first design decision.

## How to apply

- Deploy every stateful component (charging function, HSS, provisioning engine) in active-active pairs across at least two availability zones; never accept active-passive as sufficient for critical paths.
- Define and enforce Recovery Time Objective (RTO) and Recovery Point Objective (RPO) per service class: billing RTO < 30s, RPO = 0 (no lost CDRs); subscriber provisioning RTO < 60s.
- Use circuit breakers (e.g., Resilience4j, Go's gobreaker) on all downstream calls with explicit timeouts; never allow an upstream service timeout to cascade into a hung transaction.
- Instrument Mean Time Between Failures (MTBF) and Mean Time To Repair (MTTR) as first-class SLI metrics alongside the standard RED method (Rate, Errors, Duration).
- Test failover quarterly with chaos engineering; carrier-grade systems that have never been tested under failure are not carrier grade.

## Checklist

- [ ] No single point of failure exists on any path that processes calls, activations, or billing events
- [ ] Each service publishes an MTTR target and an automated runbook for its most common failure mode
- [ ] Circuit breakers are configured on all outbound integration calls
- [ ] Failover is automated and tested; manual intervention is not required to restore service
- [ ] SLA breach thresholds trigger automated alerting within 60 seconds of breach onset

## References

- Carrier-Grade: Five Nines, the Myth and the Reality (Pipeline Publishing) — https://www.pipelinepub.com/0407/pdf/Article%204_Carrier%20Grade_LTC.pdf
- TechTarget: Five-nines availability — what it really means — https://www.techtarget.com/searchnetworking/feature/The-Holy-Grail-of-five-nines-reliability
- TEKTELIC: What Does Carrier-Grade Mean? Key Parameters — https://tektelic.com/expertise/what-does-carrier-grade-mean-key-parameters/
