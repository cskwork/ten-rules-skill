# Rule 05 — Loot-Box Regulatory Compliance

> 확률 미공개 랜덤 보상은 일부 국가에서 불법 도박이다 — 법적 요건을 설계에 반영하라.
> Undisclosed-probability random rewards are illegal gambling in some jurisdictions — bake legal requirements into the design.

## Why

Belgium's Gaming Commission declared paid loot boxes illegal gambling in 2018; the Netherlands Gaming Authority levied a EUR 5 million fine against EA over FIFA packs. The EU's upcoming Digital Fairness Act is expected to extend probability-disclosure obligations across the bloc. Platform holders (Apple App Store, Google Play) independently require odds disclosure for randomized reward mechanics. Failing to comply is not a content moderation problem — it is a legal liability that can result in a game being delisted from entire markets, which in a live service means revenue going to zero overnight. Compliance architecture must be designed in, not retrofitted.

## How to apply

- Maintain a per-jurisdiction feature flag for every random reward mechanic; be able to disable or substitute the mechanic in a specific market within one deploy cycle.
- Display exact item drop rates (as percentages, not tiers) within the in-game UI at the point of purchase; this is required by Apple, Google, and Belgian/Chinese regulation.
- Store the odds table as a versioned, auditable artifact — changes require a review step and must be reflected in the UI before the change goes live.
- For markets where pity systems are required (China's "soft pity" rule), implement the pity counter server-side, never client-side.
- Log every loot-box open event with: user ID, item pool version, result, pity counter state — retain for the minimum period required by each applicable jurisdiction.

## Checklist

- [ ] Drop rates displayed in-product at the point of purchase, per platform store policy
- [ ] Per-market feature flag exists for every random reward mechanic
- [ ] Odds table is versioned and changes go through a review gate before going live
- [ ] Pity counter is server-authoritative, not client-authoritative
- [ ] Loot-box open events are logged with item pool version and retained per jurisdiction requirements

## References

- Belgian Gaming Commission ruling on loot boxes — https://www.gamedeveloper.com/business/belgian-gaming-commission-declares-loot-boxes-illegal
- European Commission — Consumer protection in digital environments (loot box policy context) — https://commission.europa.eu/live-work-travel-eu/consumer-rights-and-complaints/consumer-rights-digital-world_en
- Charlie Czerkawski, *Game Economy Design* (CRC Press, 2024) — https://www.routledge.com/Game-Economy-Design-Metagame-Monetization-and-Live-Operations/Czerkawski/p/book/9781032479903
- Apple App Store Review Guidelines (section 3.1.1 on in-app purchases) — https://developer.apple.com/app-store/review/guidelines/
