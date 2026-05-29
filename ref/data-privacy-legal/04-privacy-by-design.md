# Rule 04 — Build Privacy In by Default

> 사생활 보호를 기본값으로 설계에 넣어라. 출시 후가 아니라 설계할 때.
> Make privacy the default, designed in from the start, not bolted on after launch.

## Why

Privacy by Design, Ann Cavoukian's seven foundational principles, is now embedded in GDPR Article 25 as "data protection by design and by default." It is proactive not reactive: the most private setting is the default, privacy is built into the system, and it is achieved without forcing users to trade away functionality. Retrofitting privacy after launch is far costlier and rarely complete.

## How to apply

- Set the most privacy-protective option as the default; require opt-in for anything more.
- Run a privacy review during design, alongside the security and architecture review.
- Embed access controls, pseudonymization, and retention limits into the data model itself.
- Make privacy a positive-sum goal: design so users get both function and protection.
- Keep the data lifecycle visible end to end, from collection through deletion.

## Checklist

- [ ] Default settings expose and share the least data possible.
- [ ] A privacy review happened before the feature was built, not after.
- [ ] Retention, access control, and minimization are designed into the schema.
- [ ] Users are not forced to weaken privacy to use core functionality.
- [ ] The full data lifecycle for the feature is documented.

## References

- Privacy by Design, 7 Foundational Principles (Ann Cavoukian) — https://gpsbydesigncentre.com/the-seven-foundational-principles/
- GDPR Article 25 data protection by design — https://gdpr-info.eu/art-25-gdpr/
