# Rule 02 — Model Resources, Not Actions

> URL은 명사, 동작은 HTTP 메서드로. 리소스를 모델링하라.
> Put nouns in the URL and verbs in the HTTP method; model resources.

## Why

REST organizes an API around addressable resources, not remote procedure calls. Google's AIP-121 resource-oriented design and Fielding's dissertation both center on individually-named resources (nouns) acted on by a small, standard set of methods (verbs). This keeps the surface predictable: a consumer who learns one collection can guess the rest, instead of memorizing hundreds of bespoke action endpoints.

## How to apply

- Name collections as plural nouns: `/orders`, `/orders/{id}`, `/orders/{id}/items`.
- Express actions through HTTP methods, not URL verbs; avoid `/getOrder` or `/createOrder`.
- Model relationships as nested or linked resources, keeping hierarchy shallow (rarely past two levels).
- Reserve custom methods (`:cancel`) only when no standard CRUD method fits the operation.
- Use stable, opaque resource identifiers; do not leak internal database keys or sequencing.

## Checklist

- [ ] Every path is a noun; no verbs appear in URLs
- [ ] Collections are plural and items are addressed by a stable identifier
- [ ] Resource nesting is at most two levels deep
- [ ] Custom methods are used only where standard CRUD cannot express the intent

## References

- Google AIP-121 Resource-oriented design — https://google.aip.dev/121
- Roy Fielding, Architectural Styles (REST) — https://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm
