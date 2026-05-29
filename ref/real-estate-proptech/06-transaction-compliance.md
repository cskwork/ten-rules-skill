# Rule 06 — Transaction Compliance: RESPA, TRID, and State Disclosures

> 부동산 거래는 연방법과 주법이 교차하는 지뢰밭이다 — 공시와 타이밍을 코드로 강제하라.
> Real estate closings sit at the intersection of federal and state law — enforce disclosure requirements and timing windows in code, not in training documents.

## Why

RESPA (Real Estate Settlement Procedures Act) and TRID (TILA-RESPA Integrated Disclosure rule) impose strict timing and content requirements on loan disclosures: the Loan Estimate must be delivered within three business days of application, and the Closing Disclosure must be delivered at least three business days before consummation. Violations carry per-violation fines and can void transactions. Remote Online Notarization (RON) is now legal in 42 states but each state has different requirements for audio-video technology, identity proofing, and journal retention. Building a closing platform that ignores these rules exposes title companies and lenders to regulatory sanction; building without RON support loses competitive relevance.

## How to apply

- Encode TRID deadline calculation into a state-machine workflow engine: track application date, business-day definitions per jurisdiction (excluding federal holidays), and trigger automated Loan Estimate and Closing Disclosure generation at the legally required moments.
- Store every disclosure document with an immutable timestamp, delivery method, and recipient acknowledgment; generate audit trails in PDF/A format for long-term retention.
- Integrate with a RON platform (Qualia, Notarize, or equivalent) that is certified in the transaction's state; verify RON certification status before enabling the feature for a given state.
- For earnest-money and escrow fund flows, enforce dual-approval (maker-checker) on all wire initiations; display account details on a confirmation screen requiring explicit re-entry, not copy-paste, to reduce wire fraud.
- Maintain a compliance rule engine that is configurable per state for attorney-state versus escrow-state closing requirements, transfer-tax calculations, and mandatory disclosure forms; do not hardcode state rules into application logic.

## Checklist

- [ ] TRID business-day countdown is computed by a dedicated compliance engine, not ad-hoc date arithmetic.
- [ ] Disclosure documents are stored with immutable timestamps and delivery receipts.
- [ ] RON integration checks state certification before enabling electronic notarization.
- [ ] Wire initiation requires dual-approval and manual re-entry of account numbers.
- [ ] State compliance rules are configuration-driven, not hardcoded.

## References

- RESPA — Consumer Financial Protection Bureau — https://www.consumerfinance.gov/compliance/compliance-resources/mortgage-resources/real-estate-settlement-procedures-act/
- TRID (TILA-RESPA Integrated Disclosure) rule — CFPB — https://www.consumerfinance.gov/policy-compliance/rulemaking/final-rules/integrated-mortgage-disclosures-under-real-estate-settlement-procedures-act-regulation-x-and-truth-lending-act-regulation-z/
- Qualia digital closing platform — https://www.qualia.com/title-and-escrow/
- CertifID: Title Production Software guide — https://www.certifid.com/article/title-production-software
