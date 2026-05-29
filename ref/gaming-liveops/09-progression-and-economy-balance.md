# Rule 09 — Progression and Economy Balance

> 가상 경제의 인플레이션은 게임 내 모든 보상의 가치를 파괴한다 — 수도꼭지와 싱크를 함께 설계하라.
> Inflation in a virtual economy destroys the value of every reward — design faucets and sinks together.

## Why

Czerkawski's *Game Economy Design* treats virtual currency and item economies as real economic systems subject to inflation, deflation, and collapse. Games like Diablo III's auction house failure and multiple mobile titles demonstrate what happens when currency faucets (quest rewards, daily bonuses, event payouts) outpace sinks (crafting costs, upgrades, cosmetic purchases): the value of hard-earned rewards collapses, progression feels meaningless, and monetization revenue declines because players feel wealthy enough without spending. Conversely, over-aggressive sinks create pay-to-progress pressure that drives churn. Balance is a continuous, data-driven tuning exercise, not a launch-time configuration.

## How to apply

- Model the economy before launch with spreadsheet simulation: for the median player progression path, calculate soft-currency inflow per day, outflow per day, and the resulting net balance at D7, D30, D90.
- Instrument every currency faucet and sink event; build a daily economy health dashboard showing net M1/M2 supply (total currency in circulation across all accounts).
- Set alert thresholds: if aggregate soft-currency per active user rises more than 20% week-over-week, trigger a balance review.
- Treat event reward tables as the most powerful economy lever; validate that a major event does not print enough currency to destabilize the baseline economy for non-event players.
- Never perform a retroactive economy reset (wiping player balances) without a compensation package and advance notice; it is perceived as a betrayal and drives mass churn.

## Checklist

- [ ] Economy simulation model exists and was validated before launch
- [ ] Every faucet and sink is instrumented with telemetry
- [ ] Economy health dashboard shows net currency supply per active user, reviewed weekly
- [ ] Event reward tables are reviewed against the economy model before each event ships
- [ ] Retroactive economy changes have a compensation and communication plan

## References

- Charlie Czerkawski, *Game Economy Design: Metagame, Monetization and Live Operations* (CRC Press, 2024) — https://www.routledge.com/Game-Economy-Design-Metagame-Monetization-and-Live-Operations/Czerkawski/p/book/9781032479903
- Sergei Vasiuk, *Running a Successful Live Service Game* (CRC Press, 2024) — https://www.amazon.com/Running-Successful-Live-Service-Game/dp/103271820X
- Jesse Schell, *The Art of Game Design* (3rd ed.) — economy and progression lenses — https://www.routledge.com/The-Art-of-Game-Design-A-Book-of-Lenses-Third-Edition/Schell/p/book/9781138632059
