# API Design — 10 Rules (index)

Source: market-researched synthesis grounded in Roy Fielding's REST dissertation, Google AIPs (aip.dev), Microsoft and Zalando REST guidelines, and Stripe API design. The discipline of designing HTTP/REST API contracts that stay clear, evolvable, and safe across many consumers.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-contract-first.md` | The contract is the product; design it first | new endpoints, schemas, OpenAPI, review |
| 02 | `02-resource-modeling.md` | Model nouns and a small set of verbs | URLs, resource hierarchy, CRUD, naming |
| 03 | `03-correct-http-semantics.md` | Use HTTP methods and status codes as defined | verbs, status codes, headers, caching |
| 04 | `04-backward-compatibility.md` | Never break existing consumers | changing fields, deprecation, evolution |
| 05 | `05-versioning-strategy.md` | Version deliberately, change rarely | v1/v2, media types, breaking changes |
| 06 | `06-consistent-errors.md` | One machine-readable error format everywhere | error bodies, validation, failure paths |
| 07 | `07-idempotency-safety.md` | Make unsafe operations safe to retry | POST, payments, retries, exactly-once |
| 08 | `08-pagination-filtering.md` | Bound every collection response | list endpoints, large datasets, sorting |
| 09 | `09-security-rate-limits.md` | Authenticate, authorize, throttle every call | auth, scopes, rate limits, abuse |
| 10 | `10-documentation.md` | Document the contract for humans and machines | reference docs, examples, OpenAPI publish |

Default for "design or review a REST endpoint": read 01, 02, 03, 06 at minimum.
