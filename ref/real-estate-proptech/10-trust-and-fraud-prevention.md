# Rule 10 — Trust and Fraud Prevention at Every Transaction Touch Point

> 부동산 거래는 사기범의 최우선 표적이다 — 매물 진위, 중개인 신원, 자금 이동을 각각 독립적으로 검증하라.
> Real estate transactions are a top fraud target — verify listing authenticity, agent identity, and fund movement independently at each step.

## Why

Wire fraud in real estate closings cost U.S. buyers $446 million in 2022 (FBI Internet Crime Complaint Center report). Fraudulent listings (phantom rentals, hijacked listing photos) plague portals and damage consumer trust. Fake or impersonated agent profiles allow unlicensed actors to collect deposits. The high transaction values ($400,000+ median U.S. home price), long closing timelines (30–60 days), and one-time-buyer unfamiliarity with the process make real estate one of the most socially-engineered financial domains. Platforms that do not implement explicit anti-fraud controls bear reputational and, in some jurisdictions, negligence liability.

## How to apply

- Verify new listing agent accounts against the state real estate commission license database before allowing any listing to go live; re-verify license status monthly via automated API checks.
- Detect duplicate or scraped listing photos using perceptual hashing (pHash) at ingest; flag listings whose primary photos appear verbatim on a different address with a different agent as suspected fraud.
- Display a verified badge on listings only after the listing agent's license status, brokerage affiliation, and MLS membership have been confirmed from authoritative sources, not self-attestation.
- For closing workflows involving wire transfers, implement CertifID-style account verification: the receiving party enters wire instructions through an authenticated portal session, and the system confirms account details via bank-level verification, not email; warn explicitly about email interception fraud.
- Rate-limit and flag anomalous behavior: new account + listing creation within 10 minutes, listing price 40% below median for the ZIP code, photos matching a different city's known fraudulent listing cluster.

## Checklist

- [ ] Agent license verified against state commission API before first listing activation.
- [ ] License re-verification runs monthly for all active agent accounts.
- [ ] Perceptual hash check flags duplicate photos across different addresses at ingest.
- [ ] Wire instructions are collected through an authenticated portal, not email; email interception warning is displayed.
- [ ] Fraud anomaly detection rules are active: new-account-plus-listing, below-median-price, and cross-market photo duplication signals.

## References

- FBI Internet Crime Complaint Center (IC3) Real Estate Fraud report 2022 — https://www.ic3.gov/Media/PDF/AnnualReport/2022_IC3Report.pdf
- CertifID wire fraud prevention for title companies — https://www.certifid.com/
- ARELLO license lookup for agent verification — https://www.arello.org/
- Qualia SOC 2 and ISO 27001 security posture for closing platforms — https://www.qualia.com/title-and-escrow/
