# Rule 01 — Session Loop Integrity

> 핵심 세션 루프가 무너지면 그 어떤 기능도 플레이어를 붙잡지 못한다.
> If the core session loop breaks, no feature retains players.

## Why

Live-service games live or die by whether players return the next day. Koster's theory holds that fun is the brain recognizing learnable patterns — every system you build either feeds or disrupts that recognition cycle. The session loop (enter → engage → reward → exit with anticipation) is the single most load-bearing structure in the product; a confusing onboarding, a stalled reward beat, or a laggy match end screen causes drop-off that no amount of content patching recovers. Unlike a web app where a user can leave and come back without cost, a broken session loop in a game breaks trust and is tracked immediately in Day-1 and Day-7 retention cohorts.

## How to apply

- Map the full session loop on paper before writing a line of feature code: entry point, first action, feedback cycle, reward moment, re-engagement hook.
- Instrument every transition in the loop with a telemetry event (session_start, match_found, reward_granted, session_end) so regressions surface in data, not only in reviews.
- Gate every new feature on "does this interrupt or extend the core loop?" — a new social feature that forces players out of a match lobby fails this test.
- Keep the critical path (first-time user experience through first reward) under 5 minutes and free of mandatory paywalls.
- Load-test session entry (match queue, lobby join) at 10x expected peak — that is where live-service load spikes hit hardest.

## Checklist

- [ ] Core session loop is documented and reviewed before implementation
- [ ] Telemetry events cover every step of the loop
- [ ] Day-1 and Day-7 retention targets are defined and measured against cohort data
- [ ] FTUE (first-time user experience) critical path tested with new players, not developers
- [ ] Session entry latency under load is profiled and meets the SLA

## References

- Raph Koster, *A Theory of Fun for Game Design* (2nd ed.) — https://www.theoryoffun.com/
- Sergei Vasiuk, *Running a Successful Live Service Game* (CRC Press, 2024) — https://www.amazon.com/Running-Successful-Live-Service-Game/dp/103271820X
- Jesse Schell, *The Art of Game Design: A Book of Lenses* (3rd ed., Routledge) — https://www.routledge.com/The-Art-of-Game-Design-A-Book-of-Lenses-Third-Edition/Schell/p/book/9781138632059
