# Rule 10 — Availability and Graceful Degradation

> 의료 소프트웨어의 중단은 환자 안전 사건이다: 다운타임을 임상 이벤트로 설계하고 관리하라.
> Downtime in healthcare software is a patient safety event: design and manage unavailability as a clinical event.

## Why

Healthcare software is not a convenience application — clinicians depend on EHR access to prescribe medications, review allergies, order labs, and make treatment decisions. A patient portal outage blocks patients from accessing their records for urgent care visits. A telehealth platform failure during a session leaves a patient mid-consultation. HIPAA's contingency plan requirements (45 CFR 164.308(a)(7)) mandate a data backup plan, disaster recovery plan, and emergency mode operation plan. Unlike consumer apps, healthcare systems cannot simply display a maintenance page and resume later; the downtime window must be managed with documented clinical workarounds, staff notifications, and recovery time objectives scoped to patient risk.

## How to apply

- Define Recovery Time Objective (RTO) and Recovery Point Objective (RPO) based on clinical risk: a system used in active emergency care may require RTO under 15 minutes; an administrative billing portal might tolerate hours.
- Build a documented downtime procedure for every clinical workflow: paper-based fallback forms, temporary workaround instructions, and escalation contacts — clinicians must be trained on these before a real outage occurs.
- Implement health endpoints that expose dependency status (database, external EHR, lab interface, identity provider) and integrate them with on-call alerting; treat an EHR integration failure as an incident, not just a background error.
- Apply circuit breaker patterns on all external integrations (HL7 interfaces, FHIR endpoints, lab systems, pharmacy networks) so that a downstream failure degrades gracefully rather than cascading to the entire application.
- Test disaster recovery at least annually: execute the downtime procedure, restore from backup, and measure actual RTO against the defined target; document results in the risk management file.
- Communicate planned maintenance to clinical staff at least 72 hours in advance; for unplanned outages, notify affected clinical sites within 30 minutes of incident declaration.

## Checklist

- [ ] RTO and RPO defined and documented for each system component based on clinical risk
- [ ] Downtime procedures written and accessible offline; clinical staff trained
- [ ] Health endpoint exposes status of all critical dependencies; on-call alert configured
- [ ] Circuit breakers implemented on all external clinical system integrations
- [ ] Disaster recovery test executed within the past 12 months; results documented

## References

- HIPAA Security Rule: Contingency Plan (45 CFR 164.308(a)(7)) — https://www.hhs.gov/hipaa/for-professionals/security/index.html
- HHS: HIPAA Security Rule NPRM — https://www.hhs.gov/hipaa/for-professionals/security/hipaa-security-rule-nprm/index.html
- NHS England: Clinical Safety Assurance (downtime as clinical risk context) — https://www.england.nhs.uk/long-read/digital-clinical-safety-assurance/
