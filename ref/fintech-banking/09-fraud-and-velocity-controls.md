# Rule 09 — Fraud and Velocity Controls

> 거래 경계에서 속도 제한과 이상 탐지를 강제하여 사기를 사후 대응이 아닌 실시간으로 차단하라.
> Enforce velocity limits and anomaly detection at the transaction boundary so fraud is blocked in real time, not discovered after the fact.

## Why

Payment fraud — card-not-present fraud, account takeover, synthetic identity fraud, and money mule networks — is measured in seconds. Once a fraudulent payment is authorized and settled, recovery rates are low and reversal costs are high. Velocity controls (rate limits on transaction count, amount, and recipient per unit time) and behavioral anomaly detection are the primary real-time controls available at the application layer. FATF Recommendation 10 requires ongoing transaction monitoring as part of CDD; card network rules (Visa Core Rules, Mastercard Rules) hold issuers and acquirers liable for fraud above defined thresholds if they lack adequate controls.

## How to apply

- Define velocity rules per customer and per account: maximum transaction count per hour, maximum single transaction amount, maximum cumulative amount per day, and maximum number of distinct recipients per week.
- Enforce velocity rules synchronously before authorizing any payment; return a clear decline code and do not retry automatically.
- Implement step-up authentication (SCA challenge or human review queue) when a transaction pattern deviates from the customer's historical baseline.
- Integrate a dedicated fraud scoring service (in-house ML model or third-party such as Stripe Radar, Sift, or Sardine) that scores each transaction before authorization; configure decline and review thresholds by transaction type and risk segment.
- Log all declined transactions with the rule that triggered the decline; use this data to tune thresholds and detect rule evasion.

## Checklist

- [ ] Velocity rules (count, amount, recipient) are enforced before payment authorization, not asynchronously.
- [ ] Velocity rule breaches return a defined decline code; the customer is notified without revealing rule specifics.
- [ ] High-risk transaction patterns trigger step-up authentication.
- [ ] All declines are logged with the triggering rule and transaction details for tuning.
- [ ] Fraud rate (chargebacks / total volume) is monitored as a KPI and reviewed at least monthly.

## References

- Plaid — "5 types of fintech fraud and how to prevent them" — https://plaid.com/resources/fraud/fintech-fraud/
- Financial Action Task Force — "The FATF Recommendations" (Recommendation 10, ongoing monitoring) — https://www.fatf-gafi.org/en/publications/Fatfrecommendations/Fatf-recommendations.html
- FFIEC — "Supplement to Authentication in an Internet Banking Environment" — https://www.ffiec.gov/press/PDF/FFIEC_Guidance_Supplement.pdf
