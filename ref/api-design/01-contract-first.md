# Rule 01 — Design the Contract First

> 구현보다 계약이 먼저다. API의 진짜 제품은 인터페이스다.
> The contract comes before the code; the interface is the real product.

## Why

An API is a published promise; consumers couple to its shape, not your implementation. The OpenAPI Specification exists precisely so the contract can be defined, reviewed, and tooled before any handler is written. Designing contract-first surfaces inconsistency and breaking risk while changes are still cheap, and it lets clients, mocks, and tests be generated from one source of truth.

## How to apply

- Write the OpenAPI definition before implementing handlers; review it like code.
- Make the spec the single source of truth; generate server stubs, client SDKs, and mocks from it.
- Get consumer feedback on the contract before locking it; designing for the caller, not the database.
- Define request and response schemas, status codes, and error shapes explicitly, no implicit fields.
- Keep one consistent style guide (naming, casing, plurals) across every endpoint.

## Checklist

- [ ] An OpenAPI definition exists and was reviewed before merge
- [ ] Request and response schemas are fully specified, including error responses
- [ ] Naming and casing follow one documented convention across all endpoints
- [ ] At least one consumer reviewed the contract before it shipped

## References

- OpenAPI Initiative — https://www.openapis.org/
- Google API Improvement Proposals — https://google.aip.dev/
