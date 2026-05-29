# Rule 02 — Fair Housing Compliance by Design

> 필터 하나, 알고리즘 하나도 차별의 도구가 될 수 있다 — 설계 단계부터 공정성을 내재화하라.
> Every filter and algorithm can become a discrimination vector — bake fairness in at design time, not as an afterthought.

## Why

The Fair Housing Act (42 U.S.C. § 3604) prohibits discrimination in the sale, rental, or financing of housing based on race, color, national origin, religion, sex, familial status, or disability. HUD has explicitly warned that algorithmic screening tools can produce disparate impact even without explicit discriminatory intent. In 2023, the DOJ settled cases against Facebook and rental platforms over ad-targeting systems that excluded protected classes from seeing listings. Real estate software that embeds protected-class proxies (ZIP code filtering, income-to-debt ratios applied inconsistently, "school quality" scores correlated with race) exposes operators to federal liability regardless of intent.

## How to apply

- Audit every search filter, recommendation algorithm, and ad-targeting parameter for correlation with protected classes; document the audit and retain it.
- Tenant-screening criteria must be written, objective, and applied identically to every applicant; the screening platform configuration must match the written policy exactly.
- When displaying algorithmic outputs (AVM scores, tenant scores, neighborhood ratings), provide the underlying raw data and specific criteria, not just a grade or color; require a trained human to make the final determination for tenant acceptance or loan pre-qualification.
- Do not expose filters for "school district quality" or neighborhood demographic overlays that serve as proxies for race or national origin; if school data is shown, display factual enrollment and rating data only, not comparative rankings tied to listing search.
- Log every applicant interaction, screening decision, and the criteria version applied; retain logs for at least three years to support audit response.

## Checklist

- [ ] All search filters and recommendation inputs have been audited for protected-class proxy correlation.
- [ ] Tenant-screening configuration matches the published written policy exactly.
- [ ] Algorithmic outputs include raw supporting data, not only a score or color.
- [ ] Ad-targeting systems exclude protected-class demographic segments as audience inputs.
- [ ] Applicant screening decision logs are retained with criteria version for three or more years.

## References

- HUD Fair Housing Act guidance — U.S. Department of Housing and Urban Development — https://www.hud.gov/program_offices/fair_housing_equal_opp/fair_housing_act_overview
- HUD Guidance on Application of Fair Housing Act Standards to Use of Criminal Records (2016) — https://www.hud.gov/sites/documents/HUD_OGCGUIDAPPFHASTANDCR.PDF
- DOJ / Meta consent decree on ad-targeting (2023) — https://www.justice.gov/opa/pr/justice-department-secures-groundbreaking-settlement-agreement-meta-platforms-formerly-known
- NAR Fair Housing Resources — National Association of Realtors — https://www.nar.realtor/fair-housing
