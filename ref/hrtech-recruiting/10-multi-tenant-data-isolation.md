# Rule 10 — Strictly Isolate Recruiter-Company Data in Shared Infrastructure

> SaaS 채용 플랫폼에서 고객사 간 데이터 격리는 선택이 아닌 필수이며, 설계 초기부터 적용해야 한다.
> In a multi-tenant ATS or HR platform, one customer's candidate records, job postings, and configuration must be completely inaccessible to any other customer at every layer of the stack.

## Why

An ATS SaaS platform holds highly sensitive data for dozens to thousands of employer customers simultaneously. A data leak where Company A's recruiters can see Company B's candidates — even due to a simple query that omits a tenant filter — can destroy customer trust, trigger GDPR breach notifications (72-hour window), and result in mass customer churn. The risk is amplified in recruiting because the candidate data often includes information about individuals who also work at competitor companies. Unlike a consumer app, enterprise ATS customers conduct due diligence on data isolation during procurement, and SOC 2 Type II certification is a baseline expectation for mid-market and enterprise sales.

## How to apply

- Assign every record in the database a non-nullable `tenant_id` (organization ID) column; enforce a row-level security policy at the database layer (PostgreSQL RLS, or equivalent) as a defense-in-depth backstop against application-layer filter bugs.
- In application code, inject tenant context from the authenticated session at the repository layer so no query can be constructed without a tenant scope; make tenant-unscoped queries a compile-time or linter error.
- API keys and OAuth tokens must be scoped to a single tenant; a token from Company A must return a 403 for any resource owned by Company B, not a 404 (which leaks existence information).
- Run an automated test suite that creates two tenant fixtures and asserts that authenticated requests from Tenant A return empty results for all Tenant B resources.
- For SOC 2 compliance, document tenant isolation controls in the security policy and include cross-tenant access attempts in penetration test scope.

## Checklist

- [ ] Every table with tenant-scoped data has a non-nullable tenant_id column with a DB-level constraint
- [ ] Row-level security or equivalent DB policy enforced as defense-in-depth
- [ ] Application repository layer injects tenant context; unscoped queries fail at lint/compile time
- [ ] API tokens scoped to single tenant; cross-tenant access returns 403, not 200 or 404
- [ ] Automated cross-tenant isolation test suite runs on every pull request

## References

- SOC 2 (System and Organization Controls 2) — AICPA — https://www.aicpa-cima.com/resources/landing/system-and-organization-controls-soc-suite-of-services
- GDPR Article 32 (Security of Processing) — https://gdpr-info.eu/art-32-gdpr/
- GDPR Article 33 (Notification of Data Breach) — https://gdpr-info.eu/art-33-gdpr/
- PostgreSQL Row Security Policies — https://www.postgresql.org/docs/current/ddl-rowsecurity.html
