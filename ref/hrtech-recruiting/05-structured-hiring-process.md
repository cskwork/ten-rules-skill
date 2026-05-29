# Rule 05 — Enforce Structured, Scored, Repeatable Interview Stages

> 채용 단계마다 동일한 질문과 평가 기준을 적용해야 공정하고 예측 가능한 채용이 된다.
> Every candidate for the same role must pass through identical, scored interview stages so hiring decisions are defensible and predictive.

## Why

Unstructured interviews have a predictive validity of roughly 0.20 (barely better than chance) for job performance, while structured interviews reach 0.51, according to decades of industrial-organizational psychology research. Beyond predictive value, unstructured processes expose employers to discrimination claims: if interviewers ask different questions of different candidates, it is impossible to show the selection was job-related. Reid Hoffman, Ben Casnocha, and Chris Yeh's "The Alliance" (Harvard Business Review Press, 2014) argues that the hiring relationship must be built on explicit, mutual commitments — which is only possible when the hiring process itself is consistent and transparent. ATS products that allow interviewers to skip scorecard fields or override pipeline stages silently undermine both validity and legal defensibility.

## How to apply

- Model the hiring pipeline as an ordered sequence of stages, each with a required scorecard template; the system must not allow advancing a candidate until the current stage scorecard is submitted.
- Scorecard fields should map to job-related competencies derived from the job's O*NET occupation profile (see Rule 03), not generic personality traits.
- Provide interview kit templates (question bank + answer guides) that interviewers access inside the ATS before the interview; do not rely on email-forwarded documents.
- Aggregate scores numerically per competency so hiring managers see a structured comparison, not free-text notes alone; free-text notes are a supplement, not a substitute.
- Enforce a "debrief required before offer" gate at the workflow level so that at least one panel discussion is documented before an offer is extended.

## Checklist

- [ ] Each pipeline stage has a mandatory scorecard template; advancement is blocked until submitted
- [ ] Scorecard competencies are derived from job-related requirements, not generic traits
- [ ] Interview kit (questions + answer guides) is accessible to interviewers within the ATS
- [ ] Numeric competency scores are aggregated and displayed for panel comparison
- [ ] Offer stage requires documented debrief record before activation

## References

- "The Alliance: Managing Talent in the Networked Age" — Reid Hoffman, Ben Casnocha, Chris Yeh (Harvard Business Review Press, 2014) — https://www.theallianceframework.com/
- "Recruit Rockstars: The 10 Step Playbook to Find the Winners and Ignite Your Business" — Jeff Hyman (Lioncrest Publishing, 2017) — https://lioncrest.com/books/recruit-rockstars/
- EEOC Uniform Guidelines on Employee Selection Procedures — https://www.ecfr.gov/current/title-29/subtitle-B/chapter-XIV/part-1607
- O*NET Resource Center (competency frameworks) — https://www.onetcenter.org/
