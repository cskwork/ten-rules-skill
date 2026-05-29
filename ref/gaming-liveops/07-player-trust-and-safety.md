# Rule 07 — Player Trust and Safety

> 커뮤니티 안전은 클라이언트 필터가 아닌 서비스 레이어의 책임이다.
> Community safety is a service-layer responsibility, not a client-side filter.

## Why

The Fair Play Alliance (now Thriving in Games Group), a cross-industry coalition of nearly 200 studios including Riot Games, Supercell, Amazon Games, and EA, documents that harassment-driven churn is a leading cause of player loss in online titles. Client-side word filters and report buttons are trivially circumvented. Trust and safety must be built as a backend service concern: reports feed a moderation queue, automated signals feed a risk-scoring pipeline, and enforcement actions (mute, suspend, ban) execute server-side with appeal paths. The IGDA Code of Ethics requires developers to account for player welfare — enforcement mechanisms are an implementation of that obligation, not optional goodwill.

## How to apply

- Build reporting as a service endpoint, not a client feature: every report creates a persisted record with reporter ID, reported ID, context snapshot (last N chat messages or match ID), and timestamp.
- Implement a risk-scoring pipeline that aggregates signals (reports per user, language toxicity score, behavior anomalies) into a moderation action queue with configurable thresholds.
- Maintain three enforcement tiers: automated (warn/mute for high-confidence toxic content), human-reviewed (suspension for pattern violations), and escalated (permanent ban with legal referral for CSAM or credible threats).
- Every enforcement action must have a player-facing appeal path with a defined response SLA.
- Measure and publish (internally and in external transparency reports) enforcement coverage: reports actioned per week, false-positive reversal rate, time-to-action.

## Checklist

- [ ] Report endpoint stores a context snapshot, not just a report flag
- [ ] Risk-scoring pipeline is automated and feeds a human moderation queue
- [ ] Three enforcement tiers are documented with clear escalation criteria
- [ ] Player appeal flow exists with a response SLA defined in policy
- [ ] Moderation metrics (volume, time-to-action, reversal rate) are reviewed weekly

## References

- Fair Play Alliance / Thriving in Games Group — https://thrivingingames.org/
- IGDA Code of Ethics — https://igda.org/about-us/core-values-and-code-of-ethics/
- ADL + Fair Play Alliance partnership on hate/harassment in games — https://www.adl.org/resources/press-release/fair-play-alliance-and-adl-announce-partnership-rally-industry-combat-hate
- Magy Seif El-Nasr et al., *Game Analytics* (Springer) — player behavior analysis chapters — https://andersdrachen.com/the-book/
