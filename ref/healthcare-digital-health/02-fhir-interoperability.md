# Rule 02 — FHIR Interoperability

> 임상 데이터는 FHIR R4 리소스로만 교환하라: 독자적 포맷은 생태계를 단절시킨다.
> Exchange clinical data only via FHIR R4 resources: proprietary formats sever the care ecosystem.

## Why

HL7 FHIR R4 is the normative standard mandated by the ONC 21st Century Cures Act Final Rule for certified EHR systems and any API that exposes patient data. CMS and ONC require FHIR R4 SMART-on-FHIR endpoints for patient access, provider directory, and drug formulary APIs. Using a proprietary schema instead of FHIR resources means your system cannot integrate with any certified EHR, payer, or health information exchange — locking patients out of their data and exposing the organization to information-blocking violations with penalties up to $1 million per violation.

## How to apply

- Map all clinical entities to the appropriate FHIR R4 resource type (Patient, Observation, Condition, MedicationRequest, DiagnosticReport, Encounter, etc.) — do not invent parallel data models.
- Implement a FHIR RESTful API following the base specification at hl7.org/fhir/R4; use SMART on FHIR for OAuth 2.0-based authorization scopes (patient/*.read, user/*.write).
- Validate all FHIR resources against published profiles before storing or transmitting; use an open-source validator (HAPI FHIR, HL7 Java validator) as part of the CI pipeline.
- When building an EHR integration, target the FHIR Bulk Data Access specification (NDJSON over FHIR) for population-level queries rather than row-by-row REST calls.
- Version your FHIR profiles using Implementation Guide tooling (FHIR Shorthand + SUSHI); breaking changes to profiles require a new canonical URL.

## Checklist

- [ ] All patient-data APIs return valid FHIR R4 resources, not custom JSON envelopes
- [ ] SMART on FHIR authorization implemented for all external app access
- [ ] FHIR resource validation runs in CI; invalid resources fail the build
- [ ] Bulk Data endpoint available for population queries
- [ ] No proprietary EHR-specific fields stored in a way that blocks standard export

## References

- HL7 FHIR R4 Specification — https://hl7.org/fhir/R4/
- ONC 21st Century Cures Act Final Rule (Federal Register 2020-07419) — https://www.federalregister.gov/documents/2020/05/01/2020-07419/21st-century-cures-act-interoperability-information-blocking-and-the-onc-health-it-certification
- HL7 FHIR Standards Product Brief — https://www.hl7.org/implement/standards/product_brief.cfm?product_id=491
- ONC FHIR Fact Sheets (HealthIT.gov) — https://www.healthit.gov/topic/standards-technology/standards/fhir-fact-sheets
