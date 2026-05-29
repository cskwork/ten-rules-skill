# Rule 04 — Role-Based Authorization per Tenant

> 권한은 테넌트 범위 안에서 역할로 제어해야 한다
> Authorization must be enforced by roles scoped within each tenant's boundary.

## Why

Enterprise buyers operate with defined org structures — admins, managers, viewers, billing contacts — and they expect the SaaS product to mirror their internal hierarchy. A flat "all users can do everything" model is a deal-blocker at mid-market and above. More importantly, over-permissive access is a security risk: a SOC 2 auditor will flag any path where a non-admin user can access or export another user's data. RBAC (role-based access control) is the correct baseline; ABAC (attribute-based) or ReBAC (relationship-based) extensions are added when resources have fine-grained ownership semantics.

## How to apply

- Model authorization as (tenant, role, resource, action) tuples. Never allow a global role that spans tenants; tenant admin in tenant A must have zero authority in tenant B.
- Define a small, stable set of built-in roles (Owner, Admin, Member, Viewer) and allow tenants to compose custom roles from a permission palette in the admin UI.
- Evaluate permissions at the API layer, not in the UI. Frontend role-hiding is UX polish, not security.
- Use a dedicated policy engine (OPA/Rego, Casbin, or a fine-grained authorization service like WorkOS FGA or Permit.io) rather than ad-hoc `if role == "admin"` conditionals scattered through the codebase.
- Surface role assignment and permission changes in the audit log (Rule 03); they are evidence items for SOC 2 access reviews.
- Tie roles to seat-based pricing: the billing system should count seats per role tier, keeping commercial and authorization models consistent.

## Checklist

- [ ] Every API endpoint declares its required (tenant, role, action) and rejects unauthorized callers with 403, not 404.
- [ ] A tenant admin cannot elevate their own role without another Owner approving.
- [ ] Role assignment and permission changes appear in the tenant's audit log.
- [ ] Automated tests cover at least: admin-can-do-X, member-cannot-do-X, cross-tenant rejection.
- [ ] Permission logic lives in one authoritative layer (policy engine or middleware), not scattered across controllers.

## References

- NIST, *Assessment of Access Control Systems* (NIST IR 7316, Hu et al., 2006) — https://csrc.nist.gov/publications/detail/ir/7316/final
- Apache Casbin — authorization library supporting ACL, RBAC, ABAC — https://casbin.apache.org/
- Tod Golding, *Building Multi-Tenant SaaS Architectures* (O'Reilly, 2024) — Chapter on Tenant Identity and Authorization — https://www.oreilly.com/library/view/building-multi-tenant-saas/9781098140632/
- WorkOS RBAC open-source guide — https://workos.com/blog/rbac-open-source
