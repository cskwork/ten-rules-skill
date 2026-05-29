# Rule 06 — Every Touchpoint Must Be Fast, Clear, and Mobile-First

> 지원자가 모바일에서 5분 안에 지원을 완료하지 못하면, 최고의 인재를 잃는 것이다.
> If a candidate cannot complete an application on mobile in under five minutes, the platform is losing top talent to competitors who make it easier.

## Why

Candidates simultaneously evaluate an employer's culture through the experience of applying. A slow, form-heavy, or desktop-only application process is a direct employer-brand signal. Industry data consistently shows that more than 60% of job searches occur on mobile devices, yet most ATS-hosted career sites were originally designed for desktop. Drop-off at the apply step is the single largest funnel loss in recruiting. High-quality candidates who are not actively searching — the passive talent that "The Alliance" framework identifies as most valuable — will abandon a friction-heavy application within seconds. Status notifications (application received, under review, rejected) are also a compliance expectation in several jurisdictions and a strong predictor of offer acceptance rate.

## How to apply

- Cap the initial application form at five fields maximum for the first screen: name, contact, resume upload (or LinkedIn import), and optional cover letter; defer screening questions to a second step gated on initial qualification.
- Test every application flow on real mobile devices at each release; use Lighthouse mobile scores as a CI gate with a minimum score of 85 for performance and accessibility.
- Send automated status notifications at every stage transition within 24 hours; include a human-readable next-step description, not just a status code.
- Never require account creation before allowing a candidate to submit an application; offer account creation after submission as an opt-in.
- Ensure the career site and application form meet WCAG 2.1 AA accessibility standards so candidates with disabilities are not disproportionately excluded (overlaps with Rule 01).

## Checklist

- [ ] Initial application form is five fields or fewer on first screen
- [ ] Lighthouse mobile performance score >= 85 in CI
- [ ] Automated stage-transition notification sent within 24 hours of every status change
- [ ] Application does not require account creation as a prerequisite
- [ ] Career site and application form pass WCAG 2.1 AA audit

## References

- "Recruit Rockstars" — Jeff Hyman (Lioncrest Publishing, 2017) — https://lioncrest.com/books/recruit-rockstars/
- "The Alliance: Managing Talent in the Networked Age" — Reid Hoffman, Ben Casnocha, Chris Yeh (Harvard Business Review Press, 2014) — https://www.theallianceframework.com/
- WCAG 2.1 (Web Content Accessibility Guidelines) — https://www.w3.org/TR/WCAG21/
- Google Lighthouse Documentation — https://developer.chrome.com/docs/lighthouse/
