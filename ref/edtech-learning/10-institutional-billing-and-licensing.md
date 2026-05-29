# Rule 10 — Institutional Billing and Licensing

> 개인 구독과 기관 계약은 데이터 모델부터 다르다. 시트, 코호트, SSO를 처음부터 설계하라.
> Individual subscriptions and institutional contracts differ from the data model up; design seats, cohorts, and SSO from the start.

## Why

EdTech revenue in K-12, higher education, and enterprise training is dominated by institutional (B2B) deals — district licenses, university site licenses, and corporate learning subscriptions — not individual consumer sales. These buyers require: seat-count billing, automatic roster sync (OneRoster, LDAP/SAML), SSO integration with their identity provider, usage reporting for procurement renewal, and invoice-based payment (not credit card). Building a consumer-only billing model and retrofitting institutional requirements is expensive and blocks enterprise sales; the data model must account for the organization > cohort > learner hierarchy from day one.

## How to apply

- Model the hierarchy explicitly in the database: Organization > License (seat count, expiry, tier) > Cohort / Class > Enrollment > Learner; never flatten this to a single user-to-course join table.
- Implement SAML 2.0 or OIDC SSO from the first institutional pilot; do not ask institutional learners to create local passwords — their identity provider is authoritative.
- Support seat-count enforcement: when an organization's active enrolled learner count reaches the license ceiling, surface a clear upgrade prompt to the admin (not an opaque error to the learner).
- Produce an admin usage report (CSV or dashboard) showing active learner count, completion rates, and seat utilization per billing period — this report is the primary input to the renewal conversation.
- For K-12 and higher-ed accounts, support OneRoster 1.1 or LDAP-based roster sync so the institution's SIS (e.g., Infinite Campus, Banner, PowerSchool) can provision and deprovision enrollments automatically.

## Checklist

- [ ] Organization > License > Cohort > Enrollment > Learner hierarchy modeled in schema
- [ ] SAML 2.0 or OIDC SSO tested with at least one institutional IdP (Okta, Azure AD, Google Workspace)
- [ ] Seat-count cap enforced; admin notified at 80% and 100% of capacity
- [ ] Admin usage report covers active learners, completions, and seat utilization for a selectable date range
- [ ] Roster sync (OneRoster or LDAP) tested end-to-end with add, update, and deprovision operations

## References

- IMS Global — OneRoster 1.1 Specification — https://www.imsglobal.org/spec/oneroster/v1p1/
- IMS Global — LTI Advantage (SSO and deep linking for LMS) — https://www.imsglobal.org/spec/lti/v1p3/
- Ed-Fi Alliance — Student data interoperability standard — https://www.ed-fi.org/
- ADL Initiative — xAPI for institutional learning analytics — https://adlnet.gov/projects/xapi/
