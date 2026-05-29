# Healthcare & Digital Health — 10 Rules (index)

Source: Grounded in HIPAA Privacy and Security Rules (45 CFR Parts 160/164), HL7 FHIR R4 (hl7.org/fhir/R4), FDA Software as a Medical Device (SaMD) guidance, ONC 21st Century Cures Act Final Rule, NHS England clinical safety standards DCB0129/DCB0160, and WCAG 2.1 AA under HHS Section 504. Building software for healthcare means handling protected health information (PHI), integrating with regulated clinical data systems, and accepting clinical liability — regulatory non-compliance is not a launch blocker, it is a patient-safety and legal exposure issue.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-phi-data-protection.md` | Protect PHI at rest, in transit, and in access logs | Any storage, transmission, or logging of patient data |
| 02 | `02-fhir-interoperability.md` | Exchange clinical data only via FHIR R4 resources | EHR integration, patient data APIs, external data feeds |
| 03 | `03-samd-regulatory-classification.md` | Classify software intent before building features | Any feature that diagnoses, recommends, or analyzes patient data |
| 04 | `04-clinical-terminology.md` | Use canonical code systems: SNOMED, LOINC, ICD-10, RxNorm | Entering, storing, or displaying diagnoses, labs, meds, procedures |
| 05 | `05-patient-consent-lifecycle.md` | Capture, version, and honor consent before data use | Registration flows, data sharing, telehealth onboarding |
| 06 | `06-information-blocking-openness.md` | Never restrict patient access to their own health data | Patient portals, data export, API access, record requests |
| 07 | `07-clinical-safety-risk-management.md` | Apply clinical risk management throughout the dev lifecycle | Any NHS/UK deployment; any feature affecting clinical decisions |
| 08 | `08-accessibility-equity.md` | Meet WCAG 2.1 AA and plain-language standards for all patients | Patient-facing UI: portals, telehealth, scheduling, messaging |
| 09 | `09-audit-trail-nonrepudiation.md` | Log every read, write, and disclosure of clinical records | Any action on a medical record, prescription, or test result |
| 10 | `10-availability-degradation.md` | Design for graceful degradation; downtime is a clinical event | Infrastructure, deployments, integrations with external EHR/lab systems |

Default for "patient portal or telehealth feature": read 01, 05, 06, 08 at minimum.
