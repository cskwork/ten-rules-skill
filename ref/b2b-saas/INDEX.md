# B2B SaaS — 10 Rules (index)

Source: Grounded in Tod Golding's *Building Multi-Tenant SaaS Architectures* (O'Reilly, 2024), IETF SCIM 2.0 (RFC 7643/7644), AICPA SOC 2 Trust Services Criteria, NIST RBAC standard (NIST IR 7316), SaaStr benchmark corpus (Jason Lemkin), and OpenView Partners SaaS metrics guides. Building software for B2B SaaS means constructing a shared, subscription-based platform—like Salesforce, Slack, or Workday—that must serve many enterprise tenants simultaneously while upholding their data isolation, compliance, identity, and commercial expectations.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-tenant-isolation.md` | Every tenant's data must be fully isolated | data model design, new feature adding storage, schema migrations, shared infrastructure |
| 02 | `02-sso-scim-provisioning.md` | Ship SSO and SCIM before enterprise closes | enterprise sales blockers, auth system, user lifecycle, Okta/Entra integration |
| 03 | `03-soc2-enterprise-readiness.md` | SOC 2 Type II is the enterprise entry ticket | compliance, audit prep, logging, access controls, vendor security questionnaires |
| 04 | `04-rbac-authorization.md` | Authorization must be role-scoped per tenant | permissions model, admin UX, API endpoints, seat-based pricing, data access |
| 05 | `05-usage-metering-billing.md` | Meter usage at the event level, bill accurately | billing engine, pricing changes, usage dashboards, upgrade/downgrade flows |
| 06 | `06-tenant-onboarding.md` | Automated onboarding is a product, not ops | sign-up flow, workspace creation, trial activation, first-run experience |
| 07 | `07-nrr-expansion-revenue.md` | Design every feature for net revenue retention | upsell paths, seat growth, usage limits, product-led growth motions |
| 08 | `08-reliability-sla.md` | 99.9 %+ uptime is a contractual obligation | infrastructure, incident response, status pages, SLA definitions, deploys |
| 09 | `09-noisy-neighbor-control.md` | One tenant's load must not degrade others | rate limiting, quotas, queue architecture, resource scheduling, scaling |
| 10 | `10-data-portability-offboarding.md` | Customers must own and export their data | offboarding flows, GDPR/CCPA requests, API export, contract termination |

Default for "adding a new feature to the platform": read 01, 04, 05, 08 at minimum.
