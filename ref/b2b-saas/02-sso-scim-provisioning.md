# Rule 02 — SSO and SCIM Provisioning

> SSO와 SCIM 없이는 엔터프라이즈 계약을 체결할 수 없다
> Without SSO and SCIM, an enterprise deal will not close.

## Why

Enterprise buyers run identity through a corporate IdP (Okta, Microsoft Entra ID, Google Workspace). They require that employees log in via SAML 2.0 or OIDC — never with a product-local password — and that when an employee leaves the company, access is revoked across all tools within minutes via SCIM deprovisioning. The absence of these two capabilities is routinely cited as a hard blocker in enterprise procurement. Implementing them post-contract is costly because schema, session model, and user lifecycle assumptions are already baked into the product.

## How to apply

- Implement SAML 2.0 and OIDC (OpenID Connect) for authentication. SAML is required for legacy enterprise IdPs; OIDC for modern stacks. Supporting both is the safe default.
- Implement SCIM 2.0 (RFC 7643/7644) for automated user provisioning and deprovisioning. Map SCIM `User` and `Group` resources to your internal tenant-user and role models.
- Make SSO a per-tenant configuration, not a global switch. Each enterprise tenant supplies its own IdP metadata (SAML entity ID, ACS URL, or OIDC discovery endpoint).
- Enforce JIT (just-in-time) provisioning on first SSO login so users are auto-created without IT needing to pre-provision; supplement with SCIM for bulk operations and group-based role assignment.
- Log every provisioning and deprovisioning event with timestamp, actor (IdP push vs. admin action), and outcome. This is required for SOC 2 access-review evidence.
- Test against at least Okta, Microsoft Entra ID, and Google Workspace in CI; each has IdP-specific quirks in attribute mapping and session handling.

## Checklist

- [ ] SAML 2.0 and OIDC endpoints are implemented and per-tenant configurable.
- [ ] SCIM 2.0 `/Users` and `/Groups` endpoints handle CREATE, UPDATE, and DELETE (deprovision) operations.
- [ ] Deprovisioning immediately revokes active sessions, not just future logins.
- [ ] Provisioning and deprovisioning events are durably logged.
- [ ] Integration tested against Okta and Microsoft Entra ID in the CI pipeline.

## References

- IETF SCIM 2.0 — RFC 7643 (Schema) and RFC 7644 (Protocol) — https://datatracker.ietf.org/doc/html/rfc7644
- SCIM community specification and tooling — https://scim.cloud/
- Tod Golding, *Building Multi-Tenant SaaS Architectures* (O'Reilly, 2024) — Chapter on Identity and Multi-Tenant Identity Planes — https://www.oreilly.com/library/view/building-multi-tenant-saas/9781098140632/
- Microsoft Entra ID SCIM provisioning tutorial — https://learn.microsoft.com/en-us/entra/identity/app-provisioning/use-scim-to-provision-users-and-groups
