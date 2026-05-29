# Rule 03 — Attribute-Based Access Control

> 역할만으로는 부족하다. 데이터의 민감도와 사용자의 맥락까지 함께 검증하라.
> Roles alone are insufficient. Validate data sensitivity and user context together.

## Why

Enterprise data platforms serve multiple tenants, geographies, and regulatory regimes simultaneously. A single analyst role may be authorized to see revenue data in one country but not another, or to access production data only during incident response, not routine querying. RBAC (role-based access control) cannot express these constraints without combinatorial role explosion. NIST SP 800-162 defines ABAC as the policy model that evaluates subject attributes (department, clearance, location), resource attributes (classification, data-residency region), and environmental conditions (time, incident flag) together — the standard model for production data platforms operating under SOC 2 or government security frameworks.

## How to apply

- Define resource-level classification attributes (e.g., `sensitivity: PII`, `residency: EU`) on every dataset and object type at ingestion.
- Write access policies as rules over attribute combinations, not as role-to-resource mappings.
- Enforce policies at the query layer (row-level and column-level), not only at the UI layer, so programmatic API access is equally constrained.
- Propagate classification attributes to derived datasets automatically; a join of PII and non-PII data produces a PII-classified output.
- Log every access decision — granted or denied — with the full attribute context evaluated, for post-hoc audit.

## Checklist

- [ ] Every dataset has at least `sensitivity` and `data-residency` classification attributes set at ingestion
- [ ] Access policies are expressed as ABAC rules, not hard-coded role lists
- [ ] Row-level and column-level security is enforced at the query engine, not only in the application layer
- [ ] PII classification propagates automatically through transformation lineage
- [ ] Access denials are logged with the policy rule and attributes that caused the denial

## References

- NIST, *SP 800-162: Guide to Attribute Based Access Control (ABAC)* — https://csrc.nist.gov/pubs/sp/800/162/upd2/final
- DAMA International, *DAMA-DMBOK 2nd Edition* — https://dama.org/learning-resources/dama-data-management-body-of-knowledge-dmbok/
- Martin Kleppmann, *Designing Data-Intensive Applications* (O'Reilly, 2017) — https://dataintensive.net/
