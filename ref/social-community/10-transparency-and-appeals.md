# Rule 10 — Transparency and Appeals: Give Every Enforcement Action a Reason and an Appeal Path

> 설명 없는 제재는 불신을 낳고, 불복 수단 없는 제재는 분노를 낳는다.
> Enforcement without explanation breeds distrust; enforcement without appeal breeds outrage.

## Why

The Santa Clara Principles — the recognized industry standard for content moderation accountability — require platforms to: (1) publish quantitative data on moderation actions, (2) notify users of each removal with a reason, and (3) provide a meaningful appeals mechanism. These requirements exist because enforcement errors are inevitable at scale: a platform removing 10 million posts per month at 99% accuracy still produces 100,000 wrongful removals monthly. Without appeals, the platform has no error-correction mechanism and users who are wrongly penalized become public adversaries. Transparency reports are now also required by the EU Digital Services Act for platforms above threshold size.

## How to apply

- Send a moderation notice to every user whose content is removed or whose account is restricted; the notice must state the specific rule violated, the specific content affected, and the date of the action — never a generic "violation of community guidelines."
- Provide an in-product appeals flow: a button or link in the notice that opens a structured form; do not require users to find a support email or external URL to appeal.
- Set and publish SLAs for appeal resolution; staff the appeals queue to meet them; unpursued appeals are indistinguishable from no appeals from a user-trust perspective.
- Publish a transparency report at least annually (quarterly for platforms above 1M MAU) covering: total removals by category, total appeals, appeal outcomes (upheld / reversed), and account actions by type.
- Implement an audit log for all moderation actions that records the actor (human moderator ID or automated system name), the action, the reason code, and the timestamp; this log must be available to platform leadership and external auditors.

## Checklist

- [ ] Every content removal and account restriction triggers an automatic notification to the affected user with rule citation and content reference.
- [ ] An in-product appeals button is present in every moderation notice.
- [ ] Appeals SLA is defined, published in the Help Center, and tracked as an operational metric.
- [ ] Moderation action audit log captures actor, action, reason code, and timestamp for every enforcement event.
- [ ] Annual (or quarterly) transparency report template exists and the data pipeline to populate it is operational.

## References

- Santa Clara Principles on Transparency and Accountability in Content Moderation (2021 edition) — https://santaclaraprinciples.org/
- New America OTI, "The Santa Clara Principles 2.0" — https://www.newamerica.org/insights/the-santa-clara-principles-20/
- EU Digital Services Act (Regulation EU 2022/2065) — https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32022R2065
- Robert E. Kraut and Paul Resnick, *Building Successful Online Communities: Evidence-Based Social Design* (MIT Press, 2012) — https://mitpress.mit.edu/9780262528917/building-successful-online-communities/
