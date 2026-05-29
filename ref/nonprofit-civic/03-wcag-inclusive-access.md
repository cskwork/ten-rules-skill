# Rule 03 — WCAG Accessibility as Baseline

> 접근성은 선택이 아니라 미션의 일부다 — WCAG 2.1 AA를 기준선으로 삼아라
> Accessibility is not optional; WCAG 2.1 AA is the floor, not the ceiling.

## Why

Nonprofit and civic missions frequently serve populations that include people with disabilities, elderly supporters, and low-literacy users — the same groups most harmed by inaccessible design. The DOJ's April 2024 final rule mandates WCAG 2.1 AA for state and local government entities, with compliance deadlines extending into 2027-2028; civic platforms built for or in partnership with government must comply. Accessibility lawsuits targeting organizations under $25 million in revenue increased 37% year-over-year in 2025, and nonprofits are not exempt from ADA Title III claims. Beyond legal risk, an inaccessible donation form is a lost gift from every user it excludes.

## How to apply

- Audit every new component against WCAG 2.1 AA success criteria before merging; use axe-core or similar automated tool in CI, but supplement with manual keyboard and screen reader testing (NVDA/VoiceOver).
- Ensure all donation forms, volunteer sign-ups, and petition flows are fully operable by keyboard alone — no mouse required for any critical path action.
- Provide text alternatives for all non-text content: impact images, infographics of financial ratios, and embedded video must have alt text, captions, or transcripts.
- Maintain color contrast ratio of at least 4.5:1 for normal text and 3:1 for large text and UI components; do not rely on color alone to convey donation tier status or error states.
- Test on actual assistive technology at least once per release cycle, not just automated scanners, which catch roughly 30-40% of failures.

## Checklist

- [ ] axe-core or equivalent integrated in CI pipeline; zero critical violations on merge
- [ ] Full keyboard navigation verified on the donation form and primary navigation
- [ ] All images have meaningful alt text; decorative images use empty alt=""
- [ ] Color contrast meets 4.5:1 (normal text) and 3:1 (large text/UI) ratios
- [ ] Video content includes closed captions; audio-only content has a transcript

## References

- W3C — Web Content Accessibility Guidelines (WCAG) 2.1 — https://www.w3.org/TR/WCAG21/
- U.S. Department of Justice — ADA Title II Web Accessibility Final Rule (April 2024) — https://www.ada.gov/resources/2024-03-08-web-rule/
- Foundation Group — "How to Make Your Nonprofit Website WCAG 2.2 Compliant" — https://www.501c3.org/wcag-compliant-nonprofit-website/
- Deque Systems — axe-core accessibility testing engine — https://github.com/dequelabs/axe-core
