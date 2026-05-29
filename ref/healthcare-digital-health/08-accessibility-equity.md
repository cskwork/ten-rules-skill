# Rule 08 — Accessibility and Health Equity

> 접근할 수 없는 의료 소프트웨어는 취약한 환자를 배제한다: WCAG 2.1 AA와 평이한 언어는 선택이 아닌 의무다.
> Inaccessible healthcare software excludes the most vulnerable patients: WCAG 2.1 AA and plain language are obligations, not options.

## Why

HHS Section 504 (Rehabilitation Act) requires covered healthcare entities to meet WCAG 2.1 Level AA for all web content and mobile applications by May 11, 2026 (organizations with 15+ employees). Patient portals, telehealth platforms, scheduling tools, and messaging systems are explicitly in scope. Healthcare users disproportionately include elderly patients, those with visual or motor impairments, low-literacy populations, and non-English speakers — populations who face the greatest barriers when digital interfaces are poorly designed. An inaccessible patient portal is not just legally non-compliant; it creates a care-continuity gap for the patients who most need digital access to their records and care team.

## How to apply

- Audit all patient-facing interfaces against WCAG 2.1 AA success criteria; use both automated scanners (axe, Lighthouse) and manual testing with screen readers (NVDA/JAWS on Windows, VoiceOver on iOS/macOS).
- Apply plain language standards (US government plain language guidelines, Flesch-Kincaid grade 6-8 target) to all patient-facing text: instructions, consent forms, medication descriptions, test result summaries.
- Provide language access: offer key content in the top languages spoken by your patient population; link to interpreter services or in-app translation for telehealth encounters.
- Do not rely solely on color to convey clinical status (e.g., red = abnormal): supplement with icons, text labels, and ARIA roles so that color-blind users receive the same information.
- Include patients with disabilities in usability testing — do not assume WCAG conformance equals real-world accessibility for your specific clinical workflows.
- Covered entities are responsible for vendor-supplied patient interfaces: include WCAG 2.1 AA compliance as a contractual requirement in EHR and telehealth platform procurement.

## Checklist

- [ ] Automated WCAG 2.1 AA scan passing with zero critical violations on all patient-facing pages
- [ ] Manual screen-reader walkthrough completed for core patient workflows (login, record access, messaging, scheduling)
- [ ] All patient-facing body text at Flesch-Kincaid grade 8 or below
- [ ] Clinical status indicators use text/icons in addition to color
- [ ] Vendor contracts include explicit WCAG 2.1 AA compliance requirement

## References

- HHS Section 504 Digital Accessibility Rule (WCAG 2.1 AA, May 2026 deadline) — https://www.hhs.gov/civil-rights/for-individuals/disability/index.html
- W3C WCAG 2.1 Specification — https://www.w3.org/TR/WCAG21/
- HHS Office for Civil Rights: Section 504 Accessibility Final Rule (89 FR 26368, 2024) — https://www.federalregister.gov/documents/2024/04/09/2024-06977/nondiscrimination-on-the-basis-of-disability-accessibility-of-web-information-and-services-of
- Plain Language Guidelines (plainlanguage.gov) — https://www.plainlanguage.gov/guidelines/
