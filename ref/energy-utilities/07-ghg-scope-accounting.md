# Rule 07 — Separate and Trace Scope 1, 2, and 3 Emissions at Source

> 온실가스 배출량은 Scope 1·2·3로 분리하여 원천 데이터부터 추적 가능해야 한다.
> Greenhouse gas emissions must be separated into Scope 1, 2, and 3 and traceable from source activity data to the reported figure.

## Why

The GHG Protocol Corporate Accounting and Reporting Standard is the world's most widely adopted framework for corporate emissions accounting, embedded in CDP, GRI, SASB, IFRS S2, and the Science Based Targets initiative. It defines three scopes: Scope 1 — direct emissions from owned or controlled sources; Scope 2 — indirect emissions from purchased energy; Scope 3 — all other value-chain emissions (fifteen categories). For energy and utility companies, the distinctions are especially consequential: a gas utility's Scope 1 methane leakage, an electric utility's Scope 2 purchased power, and a retailer's Scope 3 customer energy use are each subject to different verification standards, regulatory disclosure requirements, and abatement pathways. Conflating scopes — or computing them as a single unauditable figure — breaks comparability, fails external assurance, and exposes the reporting entity to greenwashing accusations and regulatory enforcement under emerging mandatory disclosure regimes (SEC climate rule, CSRD in the EU).

## How to apply

- Model the data schema with Scope as a first-class field on every emission record; never aggregate across scopes before storage — the scope boundary is often the most queried dimension in audit and regulatory workflows.
- For each emission source, store the activity data (kWh consumed, litres of fuel, tonnes of product) separately from the emission factor and calculation methodology; when emission factors are updated, recalculate historical figures using the stored activity data, not the previously stored CO2e result.
- For Scope 2, implement both location-based and market-based calculation methods per GHG Protocol guidance; many jurisdictions and frameworks require both; store the electricity certificate or PPA contract reference that justifies the market-based figure.
- For Scope 3 Category 11 (use of sold products) — critical for electric and gas utilities selling energy directly — use metered consumption data as the activity basis where available; document the substitution methodology clearly when metered data is unavailable.
- Build an assurance-ready export: auditors require activity data, emission factors with vintages, calculation formulas, and scope classification in a single traceable dataset; design this as a first-class feature, not a retrofit.

## Checklist

- [ ] Every emission record stores scope classification, activity data, emission factor, factor source, and factor vintage as distinct fields.
- [ ] Scope 2 figures are calculated using both location-based and market-based methods and stored separately.
- [ ] Recalculation of historical data is possible by reapplying updated emission factors to stored activity data.
- [ ] Assurance export includes full calculation lineage and is tested against at least one external assurance scenario.
- [ ] Scope 3 materiality assessment is documented; material categories are identified and their data sources are named.

## References

- GHG Protocol Corporate Accounting and Reporting Standard — World Resources Institute / WBCSD — https://ghgprotocol.org/corporate-standard
- GHG Protocol Corporate Value Chain (Scope 3) Standard — https://ghgprotocol.org/sites/default/files/standards/Corporate-Value-Chain-Accounting-Reporing-Standard_041613_2.pdf
- IFRS S2 Climate-related Disclosures (references GHG Protocol) — https://www.ifrs.org/issued-standards/ifrs-sustainability-disclosure-standards/ifrs-s2-climate-related-disclosures/
