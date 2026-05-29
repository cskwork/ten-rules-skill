# Rule 02 — Accessibility as Legal Baseline

> 접근성은 선택 사항이 아니라 법적 의무다. 장애 유무에 관계없이 모든 시민이 서비스를 이용할 수 있어야 한다.
> Accessibility is a legal obligation, not a design enhancement; every citizen must be able to use the service.

## Why

In the United States, Section 508 of the Rehabilitation Act mandates that all federal electronic and information technology be accessible to people with disabilities — and this obligation extends to any vendor or contractor supplying digital services to federal agencies. In the UK, the Public Sector Bodies Accessibility Regulations 2018 require WCAG 2.1 AA conformance with a published accessibility statement. Internationally, WCAG 2.2 AA is now the practical target. Government services serve populations with above-average rates of disability, low vision, and cognitive impairment; inaccessible services effectively deny people their statutory rights and can expose the agency to legal challenge.

## How to apply

- Build against WCAG 2.2 Level AA as the minimum target; test with automated tools (axe, Lighthouse) plus manual keyboard navigation and screen reader testing (NVDA, VoiceOver, JAWS).
- Publish an accessibility statement on every public-facing service listing known issues, the standard targeted, and a contact route for users to report problems.
- Include users with disabilities in user research and usability testing, not only in a final audit sweep.
- Ensure all PDFs, documents, and downloadable files meet accessibility standards; scanned images of text are not acceptable.
- Apply accessible colour contrast ratios (4.5:1 for normal text, 3:1 for large text) to all design tokens; do not rely on colour alone to convey state.
- Validate accessible names on all interactive components; every form input must have a programmatically associated label.

## Checklist

- [ ] Automated accessibility scan passes with zero critical violations (axe or equivalent)
- [ ] Manual keyboard-only navigation test completed for all transactional flows
- [ ] Screen reader test completed (NVDA + Firefox or VoiceOver + Safari) for primary user journeys
- [ ] Accessibility statement published and up to date
- [ ] All PDFs and downloadable documents tested for accessibility

## References

- Section 508 of the Rehabilitation Act — US Access Board Revised 508 Standards — https://www.access-board.gov/ict/
- Web Content Accessibility Guidelines (WCAG) 2.2 — W3C Recommendation — https://www.w3.org/TR/WCAG22/
- Section508.gov — Applicability and Conformance Requirements — https://www.section508.gov/develop/applicability-conformance/
- GOV.UK Service Standard — Point 5: Make sure everyone can use the service — https://www.gov.uk/service-manual/service-standard/point-5-make-sure-everyone-can-use-the-service
