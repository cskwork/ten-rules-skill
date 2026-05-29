# Rule 03 — Trust and Safety Tooling: Build the Infrastructure Before Abuse Arrives

> 불이 난 뒤에 소화기를 주문하지 말라. 안전 도구는 출시 전에 갖춰야 한다.
> Do not order the fire extinguisher after the fire. Safety tooling must be ready before launch.

## Why

Abuse, spam, and illegal content do not appear gradually after a platform reaches scale — they appear the moment a platform is publicly accessible. Trust-and-safety (T&S) infrastructure built reactively always lags the harm it is meant to stop, and the reputational damage from a single high-profile incident can be irreversible. Legal obligations — NCMEC reporting for CSAM in the US, NetzDG in Germany, the EU Digital Services Act — also impose tooling requirements that cannot be bolted on after launch. T&S tooling is not a moderation feature; it is foundational platform infrastructure.

## How to apply

- Implement automated content classifiers (spam, hate speech, NSFW imagery) before opening public registration; use off-the-shelf ML APIs to start, then fine-tune on platform-specific data.
- Build a reporting flow (flag button, category selector, user block) into every content surface at the same time as the content surface itself, not as a follow-up sprint.
- Implement shadow-banning (content hidden from others but visible to the author) and rate-limiting as first-line tools to reduce ban evasion and prevent user notification of enforcement.
- Establish a CSAM detection pipeline using PhotoDNA or equivalent hash-matching before any image or video upload capability ships; this is legally non-negotiable in most jurisdictions.
- Define a staffed on-call rotation for T&S escalations — automated tools generate false positives and true positives that require human review within defined SLAs.

## Checklist

- [ ] Automated spam and abuse classifiers are running in production at launch, not post-launch.
- [ ] Every content surface has a user-facing report button wired to a review queue.
- [ ] Shadow-ban and temporary rate-limit mechanisms exist and are documented for moderators.
- [ ] CSAM hash-matching is integrated into every file-upload pipeline before image/video upload ships.
- [ ] T&S escalation SLAs are defined and a human review rotation is staffed.

## References

- Santa Clara Principles on Transparency and Accountability in Content Moderation (2021 edition) — https://santaclaraprinciples.org/
- Discord Safety Transparency in Moderation — https://discord.com/safety/transparency-in-moderation
- Stream, "Trust and Safety: Reduce Risk on Your Platform" — https://getstream.io/blog/trust-safety/
- EU Digital Services Act (Regulation EU 2022/2065) — https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32022R2065
