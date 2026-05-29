# Rule 06 — Return Consistent, Machine-Readable Errors

> 오류는 하나의 기계가 읽을 수 있는 형식으로 통일하라.
> Return errors in one consistent, machine-readable format.

## Why

Clients spend as much code on failure paths as on success, and inconsistent error shapes force every consumer to write custom parsing per endpoint. RFC 9457 Problem Details for HTTP APIs (which obsoletes RFC 7807) defines a standard JSON error body so you never invent a new format per service. A stable error contract, with a type, title, status, and field-level detail, makes failures debuggable and programmatically handleable.

## How to apply

- Adopt RFC 9457 problem details: `type`, `title`, `status`, `detail`, `instance` plus your extensions.
- Use one error envelope across every endpoint; never mix ad-hoc formats.
- Pair each error with the correct HTTP status code (Rule 03); the body explains, the status classifies.
- Return field-level validation errors as structured data, not a single concatenated string.
- Include a stable, machine-readable error code or `type` URI; keep human messages free of sensitive data.

## Checklist

- [ ] All endpoints return one consistent, documented error schema
- [ ] Error bodies follow RFC 9457 problem details (or a documented superset)
- [ ] Validation failures list offending fields in a structured form
- [ ] Error responses leak no secrets, stack traces, or internal identifiers

## References

- RFC 9457 Problem Details for HTTP APIs — https://www.rfc-editor.org/rfc/rfc9457.html
- Zalando RESTful API Guidelines — https://opensource.zalando.com/restful-api-guidelines/
