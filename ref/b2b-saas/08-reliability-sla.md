# Rule 08 — Reliability and SLA Commitments

> 가용성 99.9%는 마케팅 문구가 아니라 계약 의무다
> 99.9% uptime is a contractual obligation, not a marketing claim.

## Why

Enterprise SaaS agreements include SLA clauses with financial remedies (service credits) and termination rights tied to availability metrics. A 99.9% SLA allows roughly 8.7 hours of downtime per year; many enterprise contracts demand 99.95% or higher. Unlike consumer apps where degradation is annoying, enterprise downtime stops business operations — a CRM outage freezes a sales team's entire quarter-end close. Engineering decisions about deployment, rollback, and incident response must be made with the SLA number as a hard constraint, not an aspiration.

## How to apply

- Define availability precisely in the contract: is it per-tenant availability, global platform availability, or availability of specific critical paths? Vague SLAs create disputes.
- Implement a public status page (Statuspage.io or equivalent) and keep it updated in real time during incidents. Enterprise buyers check the status page before contacting support.
- Use blue/green or canary deployments so each release can be rolled back in under 5 minutes without a full re-deploy. Downtime from releases counts against SLA.
- Conduct chaos engineering exercises (e.g., kill a random node, simulate a slow dependency) in staging on a scheduled cadence. Document outcomes and remediation.
- Define and practice an incident runbook: detection → declared → communication to affected tenants → mitigation → post-mortem within 5 business days.
- Measure error budget per month (total allowed downtime minutes from the SLA target) and block non-essential deploys when the budget is 50% consumed.

## Checklist

- [ ] SLA definition is precise: includes which paths are in scope, how downtime is measured, and what remedies apply.
- [ ] Public status page reflects real-time incident status and has a subscriber notification mechanism.
- [ ] Deployments use zero-downtime strategy (blue/green or canary) with a tested rollback path.
- [ ] Error budget is tracked monthly and visible to the engineering team.
- [ ] Post-mortems for P0/P1 incidents are written and distributed to affected enterprise tenants within 5 business days.

## References

- Tod Golding, *Building Multi-Tenant SaaS Architectures* (O'Reilly, 2024) — Chapter on SaaS Operations, Availability, and Tenant SLAs — https://www.oreilly.com/library/view/building-multi-tenant-saas/9781098140632/
- AICPA SOC 2 Trust Services Criteria — Availability category — https://www.aicpa-cima.com/resources/download/2017-trust-services-criteria
- Google SRE Book, *Site Reliability Engineering* (O'Reilly, free online) — Error budget and SLO methodology — https://sre.google/sre-book/table-of-contents/
