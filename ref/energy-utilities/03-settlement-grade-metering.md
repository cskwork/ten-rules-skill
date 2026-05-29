# Rule 03 — Settlement-Grade Metering and Billing Integrity

> 미터 데이터는 정산 기준을 충족해야 하며 모든 변경은 감사 추적을 남겨야 한다.
> Meter data must meet settlement-grade accuracy requirements, and every mutation must leave an immutable audit trail.

## Why

In wholesale and retail electricity markets, metering data is the basis for financial settlement between generators, grid operators, retailers, and customers. Errors in interval data propagate directly into invoices, market settlement statements, and regulatory filings — disputes can take months to resolve and carry contractual penalties. Meter Data Management Systems (MDMS) must validate incoming interval reads against expected profiles, flag anomalies (missing intervals, implausible spikes, meter tampering indicators), and estimate or back-fill gaps using approved algorithms before data is ever used for billing. Regulators such as FERC, Ofgem, and state PUCs prescribe the acceptable error bands, validation rules, and retention periods — treating raw meter data as immutable and tracking every edit is not optional.

## How to apply

- Ingest raw meter reads into an append-only store; never overwrite a raw record — all corrections are new records with a lineage pointer to the original read and the reason for correction.
- Apply a VEE (Validation, Estimation, and Editing) pipeline before any downstream use: validate against meter configuration and physical plausibility limits, estimate missing intervals using approved algorithms (e.g., load profile substitution per ISO/tariff rules), and log every edit with the operator identity, timestamp, and algorithm version.
- Expose a read-only audit API that shows the full lineage of every interval datum: original read, VEE operations applied, final settled value, and any manual override with its authorization chain.
- Store interval data at the native resolution of the meter (typically 15-minute or hourly) and never downsample destructively; aggregations for billing are derived views, not the record of truth.
- Implement automated reconciliation: compare meter aggregate against substation-level totals at regular intervals and alert on unaccounted-for energy (UFE) that exceeds the jurisdiction-defined threshold.

## Checklist

- [ ] Raw meter reads are stored in an append-only structure; no update or delete path exists for raw records.
- [ ] VEE pipeline is implemented and its algorithm versions are versioned and auditable.
- [ ] Every interval datum used for billing has a complete lineage chain traceable to the original meter read.
- [ ] Metering data is stored at native resolution; billing aggregations are computed views.
- [ ] Automated UFE reconciliation runs at least daily and alerts when discrepancy exceeds threshold.

## References

- ANSI C12.20: American National Standard for Electricity Meters — Accuracy Classes 0.1, 0.2, and 0.5 — American National Standards Institute — https://webstore.ansi.org/standards/ieee/ansic122020
- FERC Order 2222: Facilitating Participation in Electricity Markets by Distributed Energy Resources — https://www.ferc.gov/ferc-order-no-2222-explainer-facilitating-participation-electricity-markets-distributed-energy
- IEC 61968-9: Application Integration at Electric Utilities — System Interfaces for Distribution Management — Meter Reading and Control — https://www.iec.ch/homepage
