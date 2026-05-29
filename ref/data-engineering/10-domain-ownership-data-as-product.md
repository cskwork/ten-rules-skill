# Rule 10 — Treat Data as a Product with Clear Ownership

> 데이터를 주인 있는 제품으로 다뤄라. 발견 가능하고, 신뢰할 수 있고, 책임자가 있게.
> Treat data as an owned product: discoverable, trustworthy, and accountable.

## Why

As platforms scale, the bottleneck shifts from compute to ownership: orphaned tables no one maintains and no one trusts. Data Mesh, defined by Zhamak Dehghani, names "data as a product" and "domain-oriented ownership" as core principles. Treating each dataset as a product with an owner, documentation, and SLAs is what keeps a large data estate usable rather than a swamp.

## How to apply

- Assign every important dataset a domain owner responsible for its quality and evolution.
- Ship each dataset as a product: documented, discoverable in a catalog, with a defined SLA and contract (Rule 04).
- Make datasets self-describing: column descriptions, semantics, and example queries live with the data.
- Provide self-serve access through a catalog so consumers find and understand data without tribal knowledge.
- Apply federated governance: central standards (naming, PII handling, quality), local domain implementation.
- Deprecate and retire datasets deliberately; do not let orphaned tables accumulate.

## Checklist

- [ ] Every important dataset has a named owner
- [ ] Datasets are documented and discoverable in a catalog
- [ ] Each product dataset has a published SLA and contract
- [ ] Governance standards (PII, naming, quality) are enforced org-wide
- [ ] Unused datasets are deprecated, not left to rot

## References

- Data Mesh principles (Martin Fowler) — https://martinfowler.com/articles/data-mesh-principles.html
- Data Mesh Architecture — https://www.datamesh-architecture.com/
