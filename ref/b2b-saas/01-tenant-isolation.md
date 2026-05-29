# Rule 01 — Tenant Isolation

> 모든 테넌트의 데이터는 완전히 격리되어야 한다
> Every tenant's data must be completely isolated from every other tenant's data.

## Why

Multi-tenancy is the defining architectural constraint of B2B SaaS: many customers share one deployment. A single query bug, a misconfigured join, or a missing tenant-ID filter can expose one enterprise customer's data to another — an incident that ends contracts, triggers regulatory penalties, and destroys trust permanently. Unlike consumer apps, enterprise buyers conduct security audits before signing and demand contractual data isolation guarantees. Isolation is therefore not a feature; it is a structural invariant that every layer of the stack must enforce.

## How to apply

- Choose an isolation model early and make it explicit: silo (separate DB per tenant), pool (shared DB, tenant column), or bridge (shared DB, separate schema). Most SaaS products start pooled for cost and migrate silos only for regulated enterprise tiers.
- Encode `tenant_id` as a mandatory, indexed foreign key on every tenant-scoped table. Never allow a query path that does not filter by tenant.
- Use row-level security (e.g., Postgres RLS) or a query middleware layer to enforce isolation at the database layer, not only in application logic.
- Audit all background jobs and async workers: they are the most common place tenant context is dropped.
- Encrypt tenant data at rest with per-tenant key hierarchies (AWS KMS CMK per tenant, or Vault namespaces) for regulated customers who require key ownership.
- In API response envelopes, never expose internal IDs that could be iterated to harvest cross-tenant data; use opaque UUIDs scoped to each tenant.

## Checklist

- [ ] Every tenant-scoped table has a `tenant_id` column with a non-null constraint and index.
- [ ] Integration tests include a cross-tenant data-leakage probe (tenant A cannot read tenant B's records).
- [ ] Row-level security or equivalent middleware is active and tested in staging.
- [ ] Background jobs carry and validate tenant context before any DB write.
- [ ] Encryption-at-rest key model is documented and per-tenant key rotation is automated.

## References

- Tod Golding, *Building Multi-Tenant SaaS Architectures: Principles, Practices, and Patterns Using AWS* (O'Reilly, 2024) — https://www.oreilly.com/library/view/building-multi-tenant-saas/9781098140632/
- AWS SaaS Factory — Tenant Isolation Patterns — https://aws.amazon.com/partners/programs/saas-factory/
- AICPA SOC 2 Trust Services Criteria (Security / Confidentiality) — https://www.aicpa-cima.com/resources/download/2017-trust-services-criteria
