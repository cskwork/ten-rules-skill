# Rule 04 — KYC/AML Customer Due Diligence

> 돈이 움직이기 전에 상대방이 누구인지 확인하고, 거래 내역을 지속적으로 모니터링하라.
> Know who you are moving money for before it moves, and keep monitoring throughout the relationship.

## Why

FATF Recommendation 10 (Customer Due Diligence) requires financial institutions to verify customer identity, identify beneficial owners, understand the purpose of the relationship, and conduct ongoing transaction monitoring. Failure to implement KYC/AML exposes the platform to criminal exploitation, regulatory fines, and license revocation. Regulators in every major jurisdiction — FinCEN (US), FCA (UK), BaFin (DE), MAS (SG) — impose large fines for inadequate CDD programs. For fintech companies, the KYC/AML obligation is non-delegable even when using banking-as-a-service (BaaS) partners: the sponsor bank audit will surface gaps.

## How to apply

- Collect and verify government-issued identity documents at onboarding; use a certified identity verification vendor (e.g., Jumio, Onfido, Persona) rather than a home-built solution.
- Screen all customers against OFAC SDN, EU consolidated sanctions, and PEP (Politically Exposed Persons) lists at onboarding and on a continuous re-screening schedule.
- Assign each customer a risk tier (low / medium / high) based on factors including jurisdiction, transaction volume, and PEP/sanctions status; apply Enhanced Due Diligence (EDD) for high-risk customers.
- File Suspicious Activity Reports (SARs) and Currency Transaction Reports (CTRs) within statutory deadlines; automate generation triggers where volume makes manual filing impractical.
- Retain KYC records for a minimum of five years after relationship termination (FATF Recommendation 11).

## Checklist

- [ ] Identity verification is completed and passes before any funded transaction is permitted.
- [ ] Sanctions screening runs at onboarding and on a periodic re-check schedule (at minimum weekly for active users).
- [ ] Risk tier is stored per customer and drives transaction limits and EDD workflows.
- [ ] SAR/CTR filing procedures are documented and tested.
- [ ] KYC documentation is retained for the jurisdiction-required period (minimum five years).

## References

- Financial Action Task Force — "The FATF Recommendations" — https://www.fatf-gafi.org/en/publications/Fatfrecommendations/Fatf-recommendations.html
- Financial Action Task Force — "FATF Recommendations" (topics page) — https://www.fatf-gafi.org/en/topics/fatf-recommendations.html
- Plaid — "5 types of fintech fraud and how to prevent them" — https://plaid.com/resources/fraud/fintech-fraud/
