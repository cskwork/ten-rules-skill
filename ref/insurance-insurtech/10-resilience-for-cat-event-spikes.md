# Rule 10 — Resilience for Catastrophic Event Spikes

> 재난 사태 시 청구 폭증을 정상 설계 기준으로 삼아야 시스템이 살아남는다.
> Catastrophic event claim surges must be the design baseline, not an edge case, for the system to survive.

## Why

A regional hurricane, wildfire, or severe weather event can generate thousands of simultaneous first notices of loss in hours from a carrier's entire book of business in one geography. A system designed for average daily load will collapse precisely when policyholders need it most — creating regulatory penalties, reputational damage, and bad-faith exposure. Unlike most SaaS verticals, insurance cannot defer claims intake: the first notice of loss starts the regulatory clock for response time in most states. Resilience during catastrophe is a regulatory requirement, not just a quality-of-life concern.

## How to apply

- Size compute and database capacity for a catastrophic event scenario (e.g., 50x normal FNOL volume for a concentrated geography) not for average daily load; use auto-scaling with pre-warmed capacity for the highest-risk regions.
- Decouple FNOL intake from claims adjudication using an async message queue; the intake surface must remain available even when downstream adjudication is backlogged.
- Implement geographic triage: during a declared catastrophe event, route claims from the affected area to a dedicated CAT response queue with elevated priority and simplified intake form.
- Define a degraded-mode contract: during peak load, the system may queue adjudication but must never drop an FNOL submission; acknowledge receipt immediately with a claim number.
- Test disaster scenarios with load tests targeting at least 10x normal peak; include failure injection (database timeout, payment provider unavailability) and verify graceful degradation behavior.

## Checklist

- [ ] Infrastructure auto-scaling policy targets a documented catastrophic event capacity multiplier (minimum 10x normal peak).
- [ ] FNOL intake is decoupled from adjudication by an async queue; intake availability does not depend on adjudication availability.
- [ ] A CAT event routing mode exists that creates a dedicated high-priority queue for claims from a declared catastrophe geography.
- [ ] Degraded-mode contract is documented: FNOL submissions are always acknowledged with a claim number even when adjudication is queued.
- [ ] Load tests covering at least 10x normal peak with failure injection are run before each major release and results are retained.

## References

- *Insurance Technology: Navigating the Innovation, Risk, and Future of Insurance*, Steven Haynes (Elsevier, 2024) — https://www.amazon.com/dp/0443439729
- *The INSURTECH Book*, VanderLinden, Millie, Anderson, Chishti (Wiley, 2018) — https://www.oreilly.com/library/view/the-insurtech-book/9781119362210/
- NAIC Model Laws (claims response time requirements) — https://content.naic.org/model-laws
- ISO (Insurance Services Office) Catastrophe Management best practices — https://www.verisk.com/insurance/catastrophe-management/
