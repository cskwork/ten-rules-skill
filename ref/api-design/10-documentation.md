# Rule 10 — Document the Contract for Humans and Machines

> 문서 없는 API는 없는 API다. 사람과 기계 모두를 위해 문서화하라.
> An undocumented API does not exist; document it for both humans and machines.

## Why

Consumers integrate against your documentation, not your source code, so gaps and drift in the docs become integration bugs and support load. The OpenAPI Specification provides a machine-readable contract that powers reference docs, SDKs, mocks, and validation from one file, and it stays in sync with the API when generated from the same source. Good docs with runnable examples are what turn a correct API into an adopted one.

## How to apply

- Publish a machine-readable OpenAPI definition as the canonical reference, kept in sync with the live API.
- Provide a copy-pasteable example request and response for every endpoint, including error cases.
- Document authentication, rate limits, pagination, versioning, and deprecation in one discoverable place.
- Generate human docs and client SDKs from the spec so they never drift from the contract.
- Include a changelog and migration notes so consumers can track and adapt to changes (Rules 04 and 05).

## Checklist

- [ ] An up-to-date OpenAPI definition is published and matches runtime behavior
- [ ] Every endpoint has example requests and responses, including errors
- [ ] Auth, rate limits, pagination, and versioning are documented in one place
- [ ] A changelog records each contract change with migration guidance

## References

- OpenAPI Specification (current: 3.1.0) — https://spec.openapis.org/oas/latest.html
- Google API Improvement Proposals — https://google.aip.dev/
