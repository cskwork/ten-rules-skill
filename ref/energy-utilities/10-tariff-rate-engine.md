# Rule 10 — Encode Tariff Logic as Versioned, Testable Rate Rules

> 요금 체계는 하드코딩하지 말고 버전 관리되는 규칙 엔진으로 구현해야 한다.
> Tariff logic must never be hardcoded; it must live in a versioned, independently testable rate rule engine.

## Why

Electricity and gas tariffs are among the most complex pricing structures in any consumer industry: they combine fixed charges, volumetric tiers, time-of-use (TOU) windows, demand charges (peak kW in a 15-minute interval), seasonal differentials, critical peak pricing events, export feed-in rates for solar, EV charging rates, and low-income discount riders — all varying by jurisdiction, customer class, and effective date. Regulatory commissions (PUCs, FERC, Ofgem) approve tariff changes on varying cycles; a major utility may process dozens of rate changes per year across its customer classes. If tariff logic is embedded in application code — hardcoded thresholds, nested conditionals in billing loops — each rate change requires a code deployment, a regression test cycle against production bill runs, and a risky cutover. Billing errors caused by incorrect tariff implementation generate customer complaints, regulatory investigations, and mandatory refund programs that cost far more than the rate engine investment.

Rate rule engines decouple the regulatory obligation (the approved tariff document) from the application code. They allow rate designers and compliance analysts to configure, review, and test rate changes independently of the engineering release cycle — which is the actual workflow that utilities use during a rate case proceeding.

## How to apply

- Implement rates as data, not code: define a rate rule schema that can express fixed charges, volumetric tiers, TOU schedules (time windows, day types, seasons), demand charge windows, and adjustment riders; store rate rule sets in a database with effective-from and effective-to dates.
- Version every rate rule set with a unique identifier; billing runs must record which rate version was applied to each invoice line so that disputes can be reconstructed exactly, and so that back-billing (applying a newly approved rate retroactively to a prior period) produces a traceable correction.
- Build a rate simulation tool that runs a candidate rate rule set against a set of real or synthetic interval load profiles before deploying the new rate to production; include edge cases: zero-consumption months, net metering customers with export, customers crossing tier boundaries mid-month.
- Separate rate calculation from billing workflow: rate engine takes interval data and a rate rule set and returns a line-item bill breakdown; the billing workflow orchestrates data retrieval, rate selection, and invoice generation but never contains rate math directly.
- Automate regression: maintain a golden dataset of sample intervals with expected bill outputs for each customer class and rate version; run this suite on every rate rule change and on every application deployment that touches the billing path.

## Checklist

- [ ] Rate rules are stored as versioned data records with effective date ranges; no tariff thresholds or schedules are hardcoded in application source.
- [ ] Every invoice line references the rate rule version identifier used in its calculation.
- [ ] Rate simulation tool exists and is run against candidate rates before PUC filing or production deployment.
- [ ] Rate engine is a pure function of (interval data, rate rule set) with no side effects — independently unit testable.
- [ ] Regression suite covers all active rate schedules and all customer class edge cases; suite passes before every release.

## References

- FERC: Electric Rate Filings — 18 CFR Part 35 (Filing of rate schedules and tariffs) — https://www.ecfr.gov/current/title-18/chapter-I/subchapter-B/part-35
- NARUC: Electricity Regulatory Principles and Rate Design (National Association of Regulatory Utility Commissioners) — https://www.naruc.org/rate-design/
- IEC 62056: Electricity Metering Data Exchange — The DLMS/COSEM Suite (tariff schedule encoding) — https://www.iec.ch/homepage
