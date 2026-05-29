# Rule 10 — Regulatory Reporting and Data Residency

> 규제 보고는 정해진 형식과 기한을 지켜야 하며, 고객 금융 데이터는 허용된 관할권 안에 보관해야 한다.
> Regulatory reports must meet prescribed formats and deadlines; customer financial data must remain within permitted jurisdictions.

## Why

Financial regulators impose mandatory reporting obligations — transaction reports, suspicious activity filings, capital adequacy returns, tax information exchange (FATCA, CRS) — with strict formats (XML, ISO 20022, CSV schemas) and filing deadlines. Missing a deadline or filing incorrect data results in fines and heightened supervisory scrutiny. Separately, data residency laws (GDPR Art. 44-49 for transfers out of the EEA; India's DPDP Act; China's PIPL; many others) restrict where financial and personal data may be stored and processed. A fintech that expands to a new market without understanding that market's data residency rules can face an immediate cease-and-desist.

## How to apply

- Maintain a data residency map: for each data category (PII, transaction records, KYC documents) and each jurisdiction of operation, document where data is stored, processed, and backed up, and the legal basis for any cross-border transfer.
- Design the data architecture to support jurisdiction-scoped storage from the start: use separate database clusters or cloud regions per jurisdiction rather than retrofitting data locality onto a global schema.
- Build reporting pipelines as structured, tested code — not manual exports — so that formats are validated against the regulatory schema before submission; version-control the schema definitions.
- Set calendar alerts for all regulatory filing deadlines; automate the generation step and require human sign-off only for the final submission.
- For FATCA/CRS: identify reportable accounts at onboarding using tax residency self-certification; generate annual XML reports conforming to the OECD Common Reporting Standard schema.

## Checklist

- [ ] A data residency map exists and is reviewed when entering a new market.
- [ ] Customer PII and transaction data are stored in regions that comply with the applicable data residency law.
- [ ] All mandatory reports are generated from automated pipelines, not manual exports.
- [ ] Report schemas are version-controlled and validated before submission.
- [ ] Filing deadlines are tracked in a compliance calendar with automated reminders.

## References

- Financial Action Task Force — "The FATF Recommendations" (Recommendations 29-32, reporting obligations) — https://www.fatf-gafi.org/en/publications/Fatfrecommendations/Fatf-recommendations.html
- European Banking Authority — PSD2 regulatory reporting requirements — https://www.eba.europa.eu/legacy/regulation-and-policy/regulatory-activities/payment-services-and-electronic-money-0
- OECD — "Common Reporting Standard (CRS)" — https://www.oecd.org/tax/automatic-exchange/common-reporting-standard/
