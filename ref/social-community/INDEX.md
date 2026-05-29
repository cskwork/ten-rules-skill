# Social & Community Platforms — 10 Rules (index)

Source: Grounded in Andrew Chen, *The Cold Start Problem* (HarperBusiness, 2021); Robert E. Kraut and Paul Resnick, *Building Successful Online Communities: Evidence-Based Social Design* (MIT Press, 2012); the Santa Clara Principles on Transparency and Accountability in Content Moderation (santaclaraprinciples.org, 2021 edition); and the theoretical network-effects literature (Metcalfe's Law, Reed's Law). Building sites and software for Social & Community Platforms means designing systems where user-generated content, social graphs, and community norms are the primary product — not a feature layered on top.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-cold-start-atomic-network.md` | Seed the smallest viable network first | launch, onboarding, invite flows, new sub-community creation |
| 02 | `02-content-moderation-policy.md` | Publish and enforce clear community rules | content policy, reporting UI, ban/suspend flows, rule editing |
| 03 | `03-trust-safety-tooling.md` | Build trust-and-safety tooling before you need it | abuse reporting, spam filters, shadow-ban, appeals, CSAM pipeline |
| 04 | `04-contribution-incentives.md` | Design for the 1% who create, the 99% who consume | post composer, karma/rep systems, notification triggers, feeds |
| 05 | `05-identity-and-pseudonymity.md` | Support pseudonymity with accountability anchors | account creation, display names, profile pages, verification badges |
| 06 | `06-feed-ranking-and-freshness.md` | Rank by relevance and recency; never bury new voices | feed algorithm, sort options, new-post boosting, search ranking |
| 07 | `07-group-and-space-governance.md` | Give sub-community owners real governance tools | sub-forum/server/group admin UI, moderator permissions, rule posting |
| 08 | `08-network-effects-retention.md` | Optimize for DAU/MAU stickiness, not vanity metrics | notification design, re-engagement emails, follow/subscribe graph |
| 09 | `09-ugc-data-model.md` | Model content, reactions, and threads as first-class entities | schema design, threading, edit history, deletion/tombstoning |
| 10 | `10-transparency-and-appeals.md` | Give every enforcement action a reason and an appeal path | moderation action notices, appeal queue, transparency reports |

Default for "building or changing a community feed or posting flow": read rules 01, 04, 06, 09 at minimum.
