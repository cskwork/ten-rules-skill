# Rule 05 — Identity and Pseudonymity: Support Pseudonymity with Accountability Anchors

> 가면은 자유를 주지만, 책임 없는 자유는 독이 된다. 익명성과 책임을 함께 설계하라.
> A mask grants freedom, but freedom without accountability is poison. Design pseudonymity and accountability together.

## Why

Social and community platforms occupy a unique identity design space: real-name systems increase civility in some contexts but suppress speech in others (LGBTQ communities, political dissidents, abuse survivors). Pseudonymity is a product feature, not a privacy loophole. However, pseudonymity without any accountability layer enables ban evasion, coordinated harassment, and sockpuppeting at scale. The design challenge specific to this industry is maintaining both: allow users to build reputation under a chosen name while retaining enough identity signal to enforce bans and detect coordinated inauthentic behavior.

## How to apply

- Allow display-name choice at registration; do not require legal names. Collect email or phone at registration as an accountable identifier that is never shown publicly but enables ban enforcement and account recovery.
- Implement device-fingerprint and IP reputation checks to detect ban-evasion re-registrations; block or flag high-confidence matches automatically, with human review for edge cases.
- Offer optional verification tiers (email verified, phone verified, ID-verified for special privileges) that are displayed as badges without revealing the underlying PII.
- Store account-linkage signals (device IDs, email hashes, browser fingerprints) in a separate, access-controlled store subject to retention limits; do not normalize them into the main user table.
- Define a policy for when persistent pseudonymous reputation is stripped (ban) versus transferred (username change); enforce it consistently and communicate it to users in the Guidelines.

## Checklist

- [ ] Display name and real identity are stored separately; real identity is never exposed via public API.
- [ ] Email or phone is required at registration and used as the ban-enforcement anchor.
- [ ] Ban-evasion detection runs on new registrations and flags high-confidence matches for review.
- [ ] Optional verification tiers exist and are shown as profile badges.
- [ ] Retention and access-control policy for identity-linkage signals is documented and implemented.

## References

- Robert E. Kraut and Paul Resnick, *Building Successful Online Communities: Evidence-Based Social Design* (MIT Press, 2012) — https://mitpress.mit.edu/9780262528917/building-successful-online-communities/
- Santa Clara Principles on Transparency and Accountability in Content Moderation (2021 edition) — https://santaclaraprinciples.org/
- Andrew Chen, *The Cold Start Problem* (HarperBusiness, 2021) — https://a16z.com/books/the-cold-start-problem/
