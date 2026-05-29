# Rule 06 — Automated Tenant Onboarding

> 온보딩은 운영 작업이 아니라 제품의 일부다
> Onboarding is a product feature, not an operations task.

## Why

Time-to-value (TTV) — how long from sign-up to first meaningful outcome — is the strongest predictor of trial-to-paid conversion in B2B SaaS. Every manual step in tenant creation (a Slack message to DevOps, a database ticket, a config file committed by hand) adds days to TTV, introduces inconsistency, and does not scale. Enterprise deals often close on a "we'll set you up in 48 hours" promise; if fulfillment requires a week of engineering work, renewal risk starts on day one. Onboarding automation also reduces human error that causes data mixing between tenants (Rule 01).

## How to apply

- Treat workspace provisioning as an automated workflow triggered by a paid subscription event or admin approval. The workflow must be idempotent so retries do not create duplicate tenant data.
- Define a tenant-creation contract: what resources are created (DB schema/namespace, storage bucket, default roles, seed data) and in what order. Make this a versioned, tested artifact.
- Separate the activation path by buyer persona: self-serve (credit card, instant provisioning), sales-assisted (contract → provisioning request → automated fulfillment), and enterprise (legal + SSO config before provisioning). Each path can trigger the same underlying workflow with different inputs.
- Build a first-run experience (guided setup wizard, sample data, or an onboarding checklist) that leads the admin to the first value moment. Track completion rate per step.
- Emit an `tenant.created` event that downstream systems (CRM, analytics, support tooling) can consume. Never duplicate the provisioning logic in those systems.
- Test tenant creation end-to-end in CI: create a tenant, configure SSO, assign roles, create a resource, verify isolation against a second tenant.

## Checklist

- [ ] Tenant provisioning workflow is automated, idempotent, and completes without human intervention for the self-serve path.
- [ ] Provisioning time (sign-up to active workspace) is measured and tracked as a product metric.
- [ ] First-run experience guides the admin to complete at least one core action within the first session.
- [ ] A `tenant.created` event is emitted to an internal event bus for downstream system integration.
- [ ] End-to-end onboarding test runs in CI against a real environment (not mocked).

## References

- Tod Golding, *Building Multi-Tenant SaaS Architectures* (O'Reilly, 2024) — Chapter on Tenant Onboarding Automation — https://www.oreilly.com/library/view/building-multi-tenant-saas/9781098140632/
- Marc Benioff and Carlye Adler, *Behind the Cloud* (Jossey-Bass, 2009) — Customer success and time-to-value as a growth lever — https://www.amazon.com/Behind-Cloud-Salesforce-com-Billion-Dollar-Company/dp/0470521163
- OpenView Partners SaaS Metrics and Benchmarks Resource Guide — https://openviewpartners.com/blog/saas-metrics-and-resources/
