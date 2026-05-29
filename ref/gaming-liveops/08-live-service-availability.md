# Rule 08 — Live Service Availability

> 다운타임은 운영 장애가 아니라 플레이어 경험 장애다 — 계획된 점검도 신뢰를 소모한다.
> Downtime is a player-experience failure, not just an ops failure — even planned maintenance erodes trust.

## Why

Unlike a SaaS tool where users tolerate occasional maintenance windows, a live service game competes with every other leisure activity for a player's limited free time. A player who loads the game during a maintenance window and sees an error has lost their session permanently — they will not wait and try again. Vasiuk documents that studios with unplanned downtime exceeding 0.5% monthly availability see measurable D7 retention drops. The problem is compounded because game infrastructure spikes sharply at launch, at event start, and on patch day — the exact moments when players are most motivated to log in and when the service is most likely to fail.

## How to apply

- Define a per-service availability SLA (e.g., 99.9% = 43 min/month unplanned downtime) and track it publicly on an internal status page with player-visible status (statuspage.io or equivalent).
- Implement blue/green or canary deploys for all backend services; never take down a live service for a patch if a hot-swap deploy path exists.
- Pre-scale capacity automatically at known event start times using scheduled autoscaling; use load tests tuned to 3x expected peak to validate before each major event.
- Publish a post-incident report for every unplanned outage exceeding 15 minutes; include player impact (sessions affected), root cause, and remediation steps.
- Compensate players for unplanned downtime with in-game currency or items; define the compensation formula in policy before it is needed.

## Checklist

- [ ] Per-service availability SLA is defined and tracked
- [ ] Blue/green or canary deployment is the default path for all backend changes
- [ ] Pre-event autoscaling is scheduled and validated by load test
- [ ] Player-visible status page exists and is updated within 5 minutes of an incident
- [ ] Player compensation policy is documented before the first outage

## References

- Sergei Vasiuk, *Running a Successful Live Service Game* (CRC Press, 2024) — https://www.amazon.com/Running-Successful-Live-Service-Game/dp/103271820X
- Google Cloud for Games — infrastructure and scaling reference — https://cloud.google.com/solutions/gaming
- GDC Vault — reliability and infrastructure talks — https://gdcvault.com/
