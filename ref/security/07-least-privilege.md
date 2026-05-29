# Rule 07 — Apply Least Privilege and Fail-Safe Defaults

> 권한은 최소로 주고 기본값은 거부로 두라.
> Grant the least privilege needed, and let the default be deny.

## Why

Least privilege and fail-safe defaults are two of Saltzer and Schroeder's foundational 1975 design principles and remain the bedrock of secure design. Every user, process, and service should hold only the access its job requires, so a compromise stays contained. Defense in depth assumes any single layer can fail, so minimizing each component's power limits the damage.

## How to apply

- Default every permission, network rule, and feature flag to closed; open only what is justified.
- Scope IAM roles, service accounts, and DB grants to the specific actions actually used.
- Separate duties: no single account holds both deploy and audit, or read and admin, by default.
- Use short-lived, narrowly scoped tokens instead of broad standing credentials.
- Layer controls (defense in depth) so no single check is the only thing standing between attacker and data.
- Review and prune privileges regularly; revoke access when roles change or accounts go idle.

## Checklist

- [ ] No account or service runs with broad or wildcard ("*") permissions without justification.
- [ ] New permissions default to deny; access is added explicitly, not removed from "allow all".
- [ ] Service accounts and DB users are scoped to the minimum actions they perform.
- [ ] Privileges are reviewed periodically and revoked when no longer needed.
- [ ] At least two independent controls protect any high-value asset.

## References

- Saltzer & Schroeder, "The Protection of Information in Computer Systems" — https://web.mit.edu/Saltzer/www/publications/protection/
- OWASP Cheat Sheet Series (Authorization) — https://cheatsheetseries.owasp.org/
