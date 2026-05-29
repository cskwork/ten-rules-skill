# Rule 09 — Authenticate, Authorize, and Throttle Every Call

> 모든 호출은 인증·인가·제한을 거친다. 공개 API는 공격 표면이다.
> Every call passes auth, authorization, and rate limits; a public API is an attack surface.

## Why

An API endpoint is reachable by anyone who finds it, so security cannot be optional or bolted on later. The OWASP API Security Top 10 ranks broken authorization and authentication as the leading API risks, and unthrottled endpoints invite abuse and denial of service. Authenticate the caller, authorize the specific resource, and rate-limit every endpoint so one client cannot starve the rest.

## How to apply

- Require authentication on every non-public endpoint; use proven schemes (OAuth 2.0 bearer tokens, API keys over TLS).
- Authorize per object, not just per route, to prevent broken-object-level-authorization (IDOR) access.
- Always serve over HTTPS; never accept credentials or tokens over plaintext.
- Rate-limit and quota every endpoint; return 429 with `Retry-After` when limits are hit.
- Validate all input at the boundary and never reflect secrets, tokens, or stack traces in responses.

## Checklist

- [ ] Every non-public endpoint enforces authentication and per-object authorization
- [ ] All traffic is TLS-only; no credentials cross plaintext
- [ ] Rate limits and quotas exist on every endpoint, returning 429 with `Retry-After`
- [ ] All external input is validated; no sensitive data leaks in responses

## References

- OWASP API Security Top 10 (2023) — https://owasp.org/www-project-api-security/
- Microsoft REST API Guidelines — https://github.com/microsoft/api-guidelines
