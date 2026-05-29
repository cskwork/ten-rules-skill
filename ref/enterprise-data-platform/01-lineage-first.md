# Rule 01 — Lineage First

> 데이터가 어디서 왔는지 증명할 수 없다면, 그 데이터는 믿을 수 없다.
> If you cannot prove where data came from, it cannot be trusted.

## Why

Enterprise data platforms serve regulated industries — finance, healthcare, defence, government — where every data point used in a decision can be audited, challenged, or legally contested. Without end-to-end lineage, teams cannot perform impact analysis when upstream schemas change, cannot demonstrate GDPR "right to erasure" compliance across derived datasets, and cannot isolate the source of incorrect model outputs. Lineage is not a nice-to-have dashboard feature; it is the foundational contract between the platform and its consumers.

## How to apply

- Record column-level lineage (not just dataset-level) for every transformation, including SQL projections, Python UDFs, and ML feature derivations.
- Store lineage as first-class metadata in a graph model (nodes = datasets/columns, edges = transformations) so it is queryable, not just viewable.
- Propagate lineage automatically at pipeline registration time; do not rely on manual documentation that drifts from reality.
- Tag derived datasets with the lineage graph hash so consumers can detect when upstream logic changes.
- Expose a lineage API that compliance and audit tooling can call without platform-admin access.

## Checklist

- [ ] Column-level lineage is captured for every transformation in the platform
- [ ] Lineage is stored in a queryable graph, not only rendered in a UI
- [ ] A change to an upstream schema triggers lineage-impact notifications to downstream owners
- [ ] GDPR erasure requests can be resolved by querying the lineage graph for all derivative copies
- [ ] Lineage records are immutable and retained for the platform's compliance retention window

## References

- Martin Kleppmann, *Designing Data-Intensive Applications* (O'Reilly, 2017) — https://dataintensive.net/
- W3C, *PROV-Overview: An Overview of the PROV Family of Documents* (W3C Working Group Note, 2013) — https://www.w3.org/TR/prov-overview/
- DAMA International, *DAMA-DMBOK 2nd Edition* — https://dama.org/learning-resources/dama-data-management-body-of-knowledge-dmbok/
