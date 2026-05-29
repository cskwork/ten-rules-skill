# Rule 06 — Anti-Cheat Architecture

> 클라이언트를 절대 신뢰하지 마라 — 모든 권위 있는 판정은 서버에서 이루어져야 한다.
> Never trust the client — every authoritative judgment must happen on the server.

## Why

In competitive and ranked live services, a single credible cheater in a match destroys the experience for the other players and drives legitimate players to churn. Riot Games built Vanguard as a kernel-level client-side driver; BattlEye and Easy Anti-Cheat operate similarly. But client-side anti-cheat is a detection layer, not a prevention layer — a determined attacker can and will defeat any client control. The canonical defense is a server-authoritative game state: the server owns position, damage, kill registration, and economy transactions. Client-side anti-cheat supplements server authority; it does not replace it. Academic research (arxiv:2512.21377) categorizes the defense landscape as server-side detection, client anti-tamper, kernel drivers, and hardware TEEs — a layered strategy using all four is the industry standard for competitive titles.

## How to apply

- Design the server as the sole authority for all game-state mutations: player position, health, kill events, match result, economy changes.
- Validate all client inputs server-side: rate-limit action frequency (shots per second, movement delta per tick), reject physically impossible inputs.
- Implement server-side replay logging for competitive matches; replays are the primary evidence base for ban appeals and false-positive investigation.
- Layer client-side detection (BattlEye, EAC, or a custom driver) as a complementary signal that feeds a ban-review queue, not an automatic ban trigger.
- Define ban appeal SLA (response within N days) and maintain a false-positive review process; wrongful bans in a live service are a trust crisis, not just a support ticket.

## Checklist

- [ ] Server validates all client inputs; no client-trusted authoritative state
- [ ] Physically impossible input vectors are rejected with a logged violation event
- [ ] Competitive match replays are stored server-side for the minimum retention period
- [ ] Anti-cheat ban queue has a human-reviewed appeal path with defined SLA
- [ ] Client-side anti-cheat driver updates are delivered as silent background updates without requiring a full game patch

## References

- BattlEye — The Anti-Cheat Gold Standard — https://www.battleye.com/
- Systematic review of technical defenses against cheating in online multiplayer games (arxiv:2512.21377) — https://arxiv.org/html/2512.21377v1
- ACM MATE Workshop: Battling The Eye — BattlEye technical analysis — https://dl.acm.org/doi/10.1145/3733817.3762701
- Jesse Schell, *The Art of Game Design* (3rd ed.) — competitive fairness lenses — https://www.routledge.com/The-Art-of-Game-Design-A-Book-of-Lenses-Third-Edition/Schell/p/book/9781138632059
