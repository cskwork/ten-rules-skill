# Rule 06 — Information Blocking and Openness

> 환자는 자신의 데이터에 즉시 접근할 권리가 있다: 기술적 마찰로 이 권리를 막으면 법 위반이다.
> Patients have a right to immediate access to their data: creating technical friction to obstruct that right is a legal violation.

## Why

The ONC 21st Century Cures Act Final Rule (effective April 2021) prohibits information blocking by health IT developers, health information networks, and health information exchanges. Penalties reach $1 million per violation for developers. Information blocking includes: slow or incomplete data exports, APIs that require excessive manual steps, patient portal designs that bury data retrieval, and contracts with EHR vendors that restrict data flow. The rule mandates that certified EHRs provide FHIR R4 APIs so that patients and authorized apps can access their full electronic health information without special effort. Designing friction into data access is not just poor UX — it is a regulated offense.

## How to apply

- Implement a patient-facing FHIR R4 API endpoint that returns the full USCDI (United States Core Data for Interoperability) data set for any authenticated patient upon request — no manual review step, no delay beyond technical processing time.
- Design the patient portal data export as a first-class feature, not an afterthought: offer structured FHIR bundle download, human-readable PDF summary, and direct third-party app authorization via SMART on FHIR.
- Review every proposed restriction on data access against the eight ONC information-blocking exceptions (Privacy, Security, Preventing Harm, Licensing, Costs, Content and Manner, Infeasibility, Health IT Performance) — document which exception applies before implementing any restriction.
- Prohibit contract clauses with EHR or data vendors that limit interoperability or restrict data portability; flag any vendor agreement that includes such language for legal review.
- Test the patient data access path as a regression: any release that slows, breaks, or adds steps to data export should block deployment.

## Checklist

- [ ] FHIR R4 USCDI patient access API available and responding without manual intervention
- [ ] Patient portal offers structured data export (FHIR bundle) on demand
- [ ] Third-party app authorization via SMART on FHIR available to patients
- [ ] All data-access restrictions documented against a specific ONC exception
- [ ] No vendor contracts contain information-blocking clauses; legal review completed

## References

- ONC 21st Century Cures Act Final Rule — https://www.federalregister.gov/documents/2020/05/01/2020-07419/21st-century-cures-act-interoperability-information-blocking-and-the-onc-health-it-certification
- ONC Information Blocking Rule Overview (HealthIT.gov) — https://www.healthit.gov/topic/information-blocking
- HIMSS: 21st Century Cures Act — Information Blocking and Interoperability — https://www.himss.org/resources/21st-century-cures-act-part-two-information-blocking-and-interoperability/
