# Rule 04 — Never Break Existing Consumers

> 호환성을 깨지 마라. 한 번 게시한 필드는 계약이다.
> Do not break compatibility; a published field is a contract.

## Why

Once an API has consumers you cannot see their release schedules, so any breaking change becomes a production outage you cannot test for. The Zalando RESTful API Guidelines codify the discipline: add optional fields but never required ones, never remove or repurpose existing fields, and never change a field's meaning. Compatible evolution lets you grow the contract indefinitely without a forced migration.

## How to apply

- Add only optional fields and new endpoints; never add a required request field to an existing call.
- Never remove, rename, or change the type or semantics of an existing field.
- Tolerate unknown fields on input (be liberal in what you accept) to allow forward compatibility.
- Always return a JSON object (not a bare array) at the top level so it can be extended later.
- Treat any incompatible change as requiring a new version, not an in-place edit (see Rule 05).

## Checklist

- [ ] No existing field was removed, renamed, retyped, or given new meaning
- [ ] New request fields are optional with safe defaults
- [ ] Top-level responses are JSON objects, extensible without breakage
- [ ] A compatibility check runs in CI against the previous contract

## References

- Zalando RESTful API Guidelines (Compatibility) — https://opensource.zalando.com/restful-api-guidelines/
- Microsoft REST API Guidelines — https://github.com/microsoft/api-guidelines
