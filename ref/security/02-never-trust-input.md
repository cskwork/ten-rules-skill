# Rule 02 — Never Trust Input

> 외부에서 들어온 모든 입력은 신뢰하지 말고 경계에서 검증하라.
> Trust no external input; validate it at the boundary before use.

## Why

Every injection, XSS, and deserialization flaw traces back to untrusted data treated as trusted. "Never trust client input" is the foundational axiom of application security and underpins multiple OWASP Top 10 categories. Validation at the boundary is cheaper and safer than scattered fixes downstream.

## How to apply

- Validate all external input at system boundaries: body, query, headers, cookies, files.
- Prefer allowlists (accept known-good) over denylists (block known-bad).
- Validate type, length, format, and range with a schema; fail fast with clear errors.
- Treat data from other services and the database as untrusted too.
- Encode output for its context (HTML, attribute, JS, URL, SQL) to stop XSS.
- Re-validate on the server even when the client already validated.

## Checklist

- [ ] Each input field has explicit type, length, format, and range rules.
- [ ] Validation runs server-side and rejects, not silently truncates, bad input.
- [ ] Output is context-encoded to prevent XSS (e.g., HTML entity encoding).
- [ ] File uploads check type, size, and are stored outside the web root.
- [ ] Untrusted deserialization is avoided or strictly type-constrained.

## References

- OWASP Top 10 (2021) — https://owasp.org/Top10/2021/
- OWASP Cheat Sheet Series (Input Validation) — https://cheatsheetseries.owasp.org/
