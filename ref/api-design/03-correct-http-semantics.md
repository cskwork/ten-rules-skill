# Rule 03 — Honor HTTP Semantics

> HTTP 메서드와 상태 코드를 규약대로 써라. 프로토콜은 이미 합의된 언어다.
> Use HTTP methods and status codes as specified; the protocol is a shared language.

## Why

HTTP defines precise semantics for methods, status codes, and headers, and the entire web infrastructure (caches, proxies, clients) relies on them. The Richardson Maturity Model (described by Martin Fowler) treats correct use of verbs and status codes as the path from RPC-over-HTTP toward true REST. Misusing them, returning 200 with an error body or making GET mutate state, silently breaks caching, retries, and client error handling.

## How to apply

- Match methods to intent: GET reads, POST creates, PUT replaces, PATCH partially updates, DELETE removes.
- Keep GET, PUT, and DELETE idempotent and GET safe; never let GET change state.
- Return accurate status codes: 200/201/204 success, 400/401/403/404/409 client errors, 5xx server errors.
- Use standard headers for content negotiation, caching (`ETag`, `Cache-Control`), and location (`Location` on 201).
- Reflect partial success and async work with the right codes (202 Accepted), not a fake 200.

## Checklist

- [ ] Each endpoint's method matches its read/write semantics
- [ ] Status codes are accurate; no errors hidden behind 200
- [ ] GET is side-effect free; PUT and DELETE are idempotent
- [ ] Caching and location headers are set where applicable

## References

- Martin Fowler, Richardson Maturity Model — https://martinfowler.com/articles/richardsonMaturityModel.html
- Microsoft REST API Guidelines — https://github.com/microsoft/api-guidelines
