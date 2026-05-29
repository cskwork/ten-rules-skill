# Rule 01 — Audit Every Selection Step for Disparate Impact

> 채용 알고리즘은 보호 집단에 불균형한 영향을 주어서는 안 된다.
> Every automated selection filter must be tested for disparate impact against protected classes before production use.

## Why

Employment law in the U.S. (Title VII, ADA, ADEA) and equivalent laws globally hold employers liable for discriminatory outcomes regardless of intent — a resume parser that silently down-ranks candidates from certain schools, zip codes, or name patterns can trigger EEOC enforcement. The EEOC's Strategic Enforcement Plan 2024-2028 explicitly identifies AI and algorithmic hiring tools as a priority enforcement area. State laws (e.g., Colorado AI Act 2024, NYC Local Law 144) add independent audit mandates. Unlike a human recruiter's bad judgment, a biased algorithm scales the discriminatory effect to every applicant in real time.

## How to apply

- Before deploying any scoring, ranking, or filtering model, run adverse impact analysis using the 4/5ths (80%) rule from the EEOC Uniform Guidelines on Employee Selection Procedures: compare pass rates of each protected group to the highest-passing group.
- Collect self-reported EEO demographic data at the top of the funnel so you have a baseline to audit against; store it separately from selection data and restrict access.
- Build an automated regression test suite that runs on each model deployment and fails the build if adverse impact ratios drop below 0.80 for any protected class.
- Document the business necessity justification for every selection criterion; criteria that cannot be justified against job requirements must be removed.
- When integrating third-party AI assessments (video interviews, cognitive tests), contractually require and verify the vendor's own adverse impact reports before enabling the tool.

## Checklist

- [ ] Adverse impact analysis (4/5ths rule) completed for each automated filter before launch
- [ ] EEO demographic data collected, stored separately, and inaccessible to selection algorithms
- [ ] Third-party assessment vendors have provided current adverse impact study documentation
- [ ] Automated adverse impact regression test runs on every model update
- [ ] Business necessity documented for every scored criterion

## References

- EEOC Strategic Enforcement Plan Fiscal Years 2024-2028 — https://www.eeoc.gov/strategic-enforcement-plan-fiscal-years-2024-2028
- EEOC, "Assessing Adverse Impact in Software, Algorithms, and AI Used in Employment Selection Procedures Under Title VII" (2023) — https://www.eeoc.gov/laws/guidance
- EEOC Uniform Guidelines on Employee Selection Procedures (29 CFR Part 1607) — https://www.ecfr.gov/current/title-29/subtitle-B/chapter-XIV/part-1607
- NYC Local Law 144 on Automated Employment Decision Tools — https://legistar.council.nyc.gov/LegislationDetail.aspx?ID=4344524&GUID=B051915D-A9AC-451E-81F8-6357BBD06D6E
