# Rule 07 — Semantic Consistency

> 같은 단어가 팀마다 다른 뜻을 가진다면, 숫자는 절대 일치하지 않는다.
> When the same word means different things to different teams, the numbers will never agree.

## Why

"Revenue," "active user," "churn rate" — every enterprise has these contested terms. When different teams compute the same metric with different definitions from different datasets, executives receive conflicting numbers and lose trust in the platform. The DAMA-DMBOK identifies business glossary and data standardisation as core governance functions precisely because semantic drift is the primary reason enterprise analytics fails to drive decisions. A platform that enforces one canonical definition per business term — stored in a governed business glossary, linked to the datasets and fields that implement it — eliminates the reconciliation meetings and spreadsheet arbitration that cost knowledge-worker hours at scale.

## How to apply

- Maintain a versioned business glossary in the platform's metadata catalog; every entry defines the term, its owner, its approved calculation, and the canonical dataset that implements it.
- Link field definitions in data contracts to glossary entries; a field named `revenue` must reference the glossary's `Revenue` definition or the contract fails validation.
- Reject duplicate metric definitions at the platform level; when a second team wants to compute "revenue" differently, that conversation happens at the glossary governance level, not silently in a pipeline.
- Surface glossary definitions in all user-facing query and reporting tools so analysts see the canonical definition before writing a query.
- Treat glossary changes as breaking changes with a change-request process; term redefinitions invalidate historical comparisons and must be versioned.

## Checklist

- [ ] A versioned, governed business glossary exists and is accessible to all platform users
- [ ] Data contract fields are linked to glossary entries; unlinked fields for known business terms fail validation
- [ ] Duplicate metric definitions trigger a governance review, not silent coexistence
- [ ] Glossary definitions are surfaced in query tools and BI authoring interfaces
- [ ] Glossary changes follow a versioned change-request process

## References

- DAMA International, *DAMA-DMBOK 2nd Edition* — https://dama.org/learning-resources/dama-data-management-body-of-knowledge-dmbok/
- Palantir, *Foundry Ontology — Why create an Ontology?* — https://www.palantir.com/docs/foundry/ontology/why-ontology
- Zhamak Dehghani, *Data Mesh: Delivering Data-Driven Value at Scale* (O'Reilly, 2022) — https://www.oreilly.com/library/view/data-mesh/9781492092384/
