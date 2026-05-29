# Gaming & Live Services — 10 Rules (index)

Source: Grounded in Raph Koster's *A Theory of Fun for Game Design* (O'Reilly, 2nd ed.), Jesse Schell's *The Art of Game Design: A Book of Lenses* (Routledge, 3rd ed.), Sergei Vasiuk's *Running a Successful Live Service Game* (CRC Press, 2024), Charlie Czerkawski's *Game Economy Design* (CRC Press, 2024), and El-Nasr, Drachen & Canossa's *Game Analytics* (Springer), with regulatory grounding from the Belgian Gaming Commission, the Fair Play Alliance (Thriving in Games Group), and IGDA ethics standards. Building software for gaming and live services means operating a continuously updated product where player trust, session economy, real-money monetization, real-time anti-cheat, and live event cadence are first-class engineering and design concerns — distinct from ordinary consumer web.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-session-loop-integrity.md` | Design every feature around the core session loop | Player flow, onboarding, retention, session start/end |
| 02 | `02-liveops-event-cadence.md` | Ship events on a predictable cadence, not ad-hoc | Seasonal events, limited-time offers, content calendar |
| 03 | `03-telemetry-first-design.md` | Instrument before you launch, not after | Analytics, KPIs, funnel tracking, A/B experiments |
| 04 | `04-fair-monetization.md` | Monetize value, never coerce; disclose all probabilities | IAP, loot boxes, battle passes, virtual currency |
| 05 | `05-loot-box-regulatory-compliance.md` | Treat loot-box probability disclosure as a legal requirement | Random reward systems, gacha, packs, prize drops |
| 06 | `06-anti-cheat-architecture.md` | Build cheat resistance into the server; never trust the client | Multiplayer, leaderboards, ranked play, economy actions |
| 07 | `07-player-trust-and-safety.md` | Enforce community standards at service layer, not only client | Chat, UGC, reporting, bans, appeals |
| 08 | `08-live-service-availability.md` | Treat downtime as a player-experience failure, not just ops | Deploys, patches, maintenance windows, incident response |
| 09 | `09-progression-and-economy-balance.md` | Keep soft-currency and hard-currency economies from collapsing | Sinks, faucets, inflation, reward tuning, economy resets |
| 10 | `10-data-privacy-minors-protection.md` | Apply COPPA/GDPR-K controls whenever a minor may be present | Age gates, parental consent, data collection, ads |

Default for "live event or content update": read rules 02, 03, 04, 05 at minimum.
