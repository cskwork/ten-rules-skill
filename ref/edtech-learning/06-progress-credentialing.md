# Rule 06 — Progress Tracking and Verifiable Credentials

> 학습 이력과 자격증은 학습자가 소유하며, 언제 어디서나 검증 가능해야 한다.
> Learning records and credentials belong to the learner and must be verifiable anywhere, at any time.

## Why

Completion rates, grades, and certificates drive renewal, referral, and institutional procurement decisions. Learners who cannot export or verify their credentials — or whose certificates are easily forged — lose trust in the platform. Employers and institutions increasingly require verifiable digital credentials (Open Badges, IMS Global Comprehensive Learner Record) rather than PDFs with no cryptographic proof. Simultaneously, the data model for progress must be granular enough to satisfy institutional reporting (FERPA-compliant transcripts, LTI grade passback) and learner dashboards alike.

## How to apply

- Track progress at the most granular meaningful unit: completion and score per activity (video watched, quiz submitted), not only per course; roll up to course and program completion.
- Issue completion certificates as verifiable credentials: embed a unique, server-verifiable claim ID; provide a public verification URL so employers can confirm authenticity without contacting the platform.
- Implement Open Badges 3.0 (IMS Global) for skill-level micro-credentials; badges must include issuer, criteria, evidence URL, and expiry if applicable.
- Expose a learner data export (JSON or PDF transcript) on demand, satisfying FERPA right-of-access; deletion requests must also cascade to completion records per your retention policy.
- Decouple the progress data model from the content version: when a course is updated, preserve historical completion records linked to the version the learner completed.

## Checklist

- [ ] Per-activity completion and score stored; course completion derived from activity roll-up, not set manually
- [ ] Certificate verification URL works without platform login and returns issuer, learner name (hashed or full per policy), date, and course title
- [ ] Open Badges metadata includes issuer DID or URL, criteria link, and issue date
- [ ] Learner transcript export available on demand and tested with a sample FERPA access request workflow
- [ ] Progress records versioned to course snapshot; updating a course does not retroactively change historical completions

## References

- IMS Global — Open Badges 3.0 Specification — https://www.imsglobal.org/spec/ob/v3p0/
- IMS Global — Comprehensive Learner Record — https://www.imsglobal.org/spec/clr/v2p0/
- ADL Initiative — xAPI for learning record tracking — https://adlnet.gov/projects/xapi/
- U.S. Department of Education — FERPA — https://studentprivacy.ed.gov/ferpa
