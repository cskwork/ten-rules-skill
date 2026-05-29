# Rule 01 — Enforce Access Control on Every Request

> 모든 요청의 권한은 서버에서 매번 검사하라. 클라이언트의 주장은 권한이 아니다.
> Check authorization on every request, server-side; a client's claim is not a permission.

## Why

Broken Access Control is ranked #1 in the OWASP Top 10 (2021) with more contributing weaknesses than any other category. SSRF (Server-Side Request Forgery) is a closely related flaw that enables access-control bypass by having the server make unauthorized requests on behalf of an attacker. When a user can act outside their intended permissions, every other control becomes bypassable. This is the single highest-impact, most common real-world web vulnerability.

## How to apply

- Deny by default; grant access only through explicit, server-side checks.
- Verify ownership on every object access (prevent IDOR): does this user own this record?
- Enforce roles and permissions on the server, never via hidden UI or client flags.
- Apply the same checks to APIs, not just rendered pages.
- Use non-guessable references or per-request authorization, not sequential IDs alone.
- Log access-control failures and rate-limit repeated denials.

## Checklist

- [ ] Every endpoint checks authorization, not just authentication.
- [ ] Object-level checks confirm the caller owns or may access each resource.
- [ ] Default response to an undefined permission is deny, not allow.
- [ ] Force-browsing to admin or other-user URLs returns 403, not data.
- [ ] CORS policy restricts origins; it is not a substitute for authorization.

## References

- OWASP Top 10, A01 Broken Access Control — https://owasp.org/www-project-top-ten/
- OWASP ASVS — https://owasp.org/www-project-application-security-verification-standard/
