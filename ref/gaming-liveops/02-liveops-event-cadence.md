# Rule 02 — LiveOps Event Cadence

> 라이브 서비스는 콘텐츠 캘린더로 숨쉰다 — 예측 가능한 이벤트가 플레이어를 돌아오게 한다.
> A live service breathes through its content calendar — predictable events bring players back.

## Why

Retention in live services is driven by anticipated future value, not past content consumed. Vasiuk's "3 LAPs" framework (Live events, Automated personalization, Progression updates) shows that studios that ship events on a known cadence (weekly limited content, monthly seasonal arc, quarterly major update) generate measurably higher 30-day retention than those shipping ad-hoc. Players form habits around a game the same way they form habits around a TV series: if the next episode is unpredictable, they stop scheduling time for it. The event pipeline is therefore as critical as any backend service — it must be scheduled, versioned, rollback-capable, and observable.

## How to apply

- Define a three-tier calendar: weekly (small rotations, daily quests), monthly (limited-time event with unique reward), quarterly (major content drop or ranked season).
- Treat each event as a deployable artifact: event config, reward tables, and UI strings versioned together and deployable without a client patch.
- Build a feature-flag / remote config layer so events can be activated, paused, or extended server-side within minutes, without a full deploy.
- Measure event participation rate and revenue lift per event; feed results back to the calendar planning cycle each quarter.
- Ensure event start/end times are announced in-product at least 48 hours in advance and displayed in the player's local timezone.

## Checklist

- [ ] Content calendar exists for at least the next 8 weeks
- [ ] Events are deployable via remote config without a client-side patch
- [ ] Event rollback procedure is documented and tested
- [ ] Participation rate and revenue-per-event metrics are tracked per event
- [ ] Event end-time countdown is visible in-product in local time

## References

- Sergei Vasiuk, *Running a Successful Live Service Game* (CRC Press, 2024) — https://www.amazon.com/Running-Successful-Live-Service-Game/dp/103271820X
- Charlie Czerkawski, *Game Economy Design: Metagame, Monetization and Live Operations* (CRC Press, 2024) — https://www.routledge.com/Game-Economy-Design-Metagame-Monetization-and-Live-Operations/Czerkawski/p/book/9781032479903
- GDC Vault (Game Developers Conference talks on LiveOps) — https://gdcvault.com/
