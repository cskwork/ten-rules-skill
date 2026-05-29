# Rule 05 — Evolve Schemas Without Breaking Readers

> 스키마는 읽는 쪽을 깨지 않으면서 진화시켜라.
> Evolve schemas in ways that never break existing readers.

## Why

Data outlives any single version of its schema. Kleppmann frames this in Designing Data-Intensive Applications as forward and backward compatibility: new code must read old data, and old code must read new data. Ignore this and a routine column change cascades into broken dashboards and failed jobs across teams that never agreed to the change.

## How to apply

- Prefer additive changes: add nullable columns; never silently repurpose or retype an existing one.
- Use a serialization format with schema evolution support (Avro, Protobuf, Parquet) and a schema registry where applicable.
- Treat renames, type narrowing, and drops as breaking; version the dataset and migrate consumers deliberately.
- Default new fields so old readers keep working (backward compatibility) and old writers stay valid (forward compatibility).
- Track effective dates of schema changes so historical partitions remain interpretable.

## Checklist

- [ ] New fields are additive and nullable or defaulted
- [ ] No existing column is retyped or repurposed in place
- [ ] Breaking changes bump a dataset version with a migration path
- [ ] Old code can still read newly written data, and vice versa
- [ ] Schema-change dates are recorded for historical reads

## References

- Designing Data-Intensive Applications — https://dataintensive.net/
- Apache Avro schema resolution — https://avro.apache.org/docs/
