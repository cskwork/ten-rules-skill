# Rule 08 — Bound Every Collection

> 컬렉션 응답은 항상 페이지네이션하라. 무한 응답은 장애다.
> Always paginate collection responses; an unbounded response is an outage.

## Why

A list endpoint that returns everything works in development and falls over in production once the table grows; it exhausts memory, blows latency budgets, and can take down the service. The Microsoft and Google API guidelines require pagination on every collection by default. Choosing cursor-based pagination over offset also keeps results stable while data changes underneath, avoiding skipped or duplicated rows.

## How to apply

- Paginate every collection response by default with a sane maximum page size; never return unbounded lists.
- Prefer cursor/token-based pagination for large or fast-changing data; offset paging drifts under writes.
- Return pagination metadata (next cursor or total/links) inside the top-level object, not a bare array.
- Expose explicit filtering and sorting params (`?status=active&sort=createdAt,desc`) rather than client-side filtering.
- Validate and cap page-size and filter inputs; reject unknown sort fields with a clear error.

## Checklist

- [ ] Every list endpoint paginates with an enforced maximum page size
- [ ] Pagination metadata or a next-page cursor is returned
- [ ] Filtering and sorting parameters are explicit and validated
- [ ] Default ordering is deterministic so pages do not overlap or skip

## References

- Microsoft REST API Guidelines — https://github.com/microsoft/api-guidelines
- Google AIP-158 Pagination — https://google.aip.dev/158
