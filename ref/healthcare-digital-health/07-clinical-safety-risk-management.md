# Rule 07 — Clinical Safety Risk Management

> 소프트웨어 버그는 환자 피해로 이어진다: 임상 위험 관리를 개발 생명주기 전반에 내재화하라.
> A software bug can harm a patient: embed clinical risk management across the entire development lifecycle.

## Why

NHS England mandates compliance with DCB0129 (clinical risk management for manufacturers) and DCB0160 (clinical risk management for deployers) under the Health and Social Care Act 2012. No NHS organization may procure a digital health technology without DCB0129 assurance from the manufacturer, and none may deploy without DCB0160 assurance for that specific deployment. Beyond the UK, IEC 62304 and ISO 14971 (application of risk management to medical devices) apply globally for SaMD. A miscalculated drug dose recommendation, a missed alert threshold, or an incorrect unit conversion in a clinical application can directly injure or kill patients. Clinical risk management is not a documentation exercise — it is the mechanism for identifying and mitigating these failure modes before they reach patients.

## How to apply

- Produce a Clinical Safety Case Report for every product or major release: document the clinical hazards identified, the risk assessment (severity x likelihood), the mitigations applied, and the residual risk accepted by the clinical safety officer.
- Appoint a named Clinical Safety Officer (CSO) with clinical and informatics competence; the CSO must sign off on the safety case before each deployment.
- Maintain a Clinical Risk Management File throughout the product lifecycle: hazard log, risk assessments, mitigations, test evidence, and incident reports — not a point-in-time deliverable, but a living document.
- Apply FMEA (Failure Mode and Effects Analysis) or HAZOP to each user workflow that could result in clinical harm; prioritize workflows involving medication, diagnosis, critical alerts, and patient identification.
- Classify all software defects by clinical risk (Class A: death or serious injury possible; Class B: minor injury possible; Class C: no injury pathway) and mandate timely resolution schedules based on class.

## Checklist

- [ ] Clinical Safety Officer appointed and named in project records
- [ ] Hazard log initialized; all clinical workflows assessed for harm pathways
- [ ] Clinical Safety Case Report completed and signed before each production release
- [ ] DCB0129 assurance documentation available (UK deployments)
- [ ] Software defect classification system (A/B/C) active and tracked in issue management

## References

- NHS England DCB0129: Clinical Risk Management for Manufacturers — https://digital.nhs.uk/data-and-information/information-standards/information-standards-and-data-collections-including-extractions/publications-and-notifications/standards-and-collections/dcb0129-clinical-risk-management-its-application-in-the-manufacture-of-health-it-systems
- NHS England DCB0160: Clinical Risk Management for Deployers — https://digital.nhs.uk/data-and-information/information-standards/information-standards-and-data-collections-including-extractions/publications-and-notifications/standards-and-collections/dcb0160-clinical-risk-management-its-application-in-the-deployment-and-use-of-health-it-systems
- ISO 14971: Application of Risk Management to Medical Devices — https://www.iso.org/standard/72704.html
