# Rule 05 — Patient Consent Lifecycle

> 동의는 일회성 서명이 아니다: 획득, 버전 관리, 철회, 적용을 데이터 흐름과 함께 추적하라.
> Consent is not a one-time signature: track acquisition, versioning, withdrawal, and enforcement alongside every data flow.

## Why

HIPAA requires covered entities to obtain patient authorization before using or disclosing PHI for purposes beyond treatment, payment, and healthcare operations. Telehealth adds a second layer: 34+ US states mandate explicit written or digital consent before a virtual encounter, disclosing technology limitations, privacy risks, and the patient's right to withdraw. Consent given at registration does not automatically cover a new data-sharing integration added six months later. If a patient withdraws consent and the system continues sharing data downstream, that is both a HIPAA violation and, in some states, a statutory tort. Consent logic that lives only in a checkbox at sign-up is not a consent management system.

## How to apply

- Model consent as a first-class data entity: store consent type, version number, timestamp, medium (electronic/verbal/written), and the specific data elements or use cases covered; never reduce consent to a boolean field on the user record.
- For telehealth encounters, present consent disclosure before the session begins — include: technology in use, privacy/security limitations, the right to refuse or withdraw, and emergency care protocols; record verbal consent with a timestamp in the encounter note.
- Implement consent versioning: when your privacy policy, data-sharing agreements, or telehealth platform changes materially, invalidate existing consent and trigger a re-consent flow before the next data use.
- Propagate consent withdrawal immediately to all downstream systems — analytics pipelines, third-party integrations, research data exports — and log the propagation for audit.
- For research or secondary use of de-identified data, confirm de-identification meets HIPAA Safe Harbor or Expert Determination standards before removing the consent gate.

## Checklist

- [ ] Consent stored as a versioned record with type, scope, timestamp, and medium — not as a boolean
- [ ] Telehealth onboarding flow presents state-required disclosures before session start
- [ ] Consent withdrawal triggers downstream revocation within 24 hours; propagation logged
- [ ] Material changes to data use trigger a re-consent flow before the next data access
- [ ] De-identification method documented and validated before any consent-free secondary use

## References

- HHS: HIPAA Authorization Requirements — https://www.hhs.gov/hipaa/for-professionals/privacy/guidance/authorizations/index.html
- HHS Telehealth.gov: Informed Consent for Telebehavioral Health — https://telehealth.hhs.gov/providers/best-practice-guides/telehealth-for-behavioral-health/preparing-patients-for-telebehavioral-health/informed-consent-for-telebehavioral-health
- Center for Connected Health Policy: State Telehealth Consent Requirements — https://www.cchpca.org/topic/consent-requirements-medicaid-medicare/
