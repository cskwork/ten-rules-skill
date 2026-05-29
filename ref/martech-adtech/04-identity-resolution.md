# Rule 04 — Identity Resolution

> 채널과 기기를 가로지르는 고객 정체성을 결정론적으로 통합하고 확률적 방법은 명확히 표시하라.
> Resolve customer identity across channels and devices deterministically where possible; label probabilistic matches explicitly and apply lower-confidence treatment.

## Why

A single customer may interact with a brand through a mobile app, a desktop browser, a retail loyalty program, and a call center — generating four or more separate identity fragments. Without resolution, the CDP sends duplicate messages, attribution double-counts conversions, and frequency capping fails (the same person sees the same ad 30 times). Deterministic matching — joining on hashed email or phone at login — is accurate but limited to authenticated sessions. Probabilistic matching (device fingerprinting, IP + user-agent clustering) scales to anonymous sessions but carries a false-positive rate that, if untracked, corrupts downstream model training. Privacy regulations in the EU prohibit certain fingerprinting techniques entirely, so the resolution strategy must be jurisdiction-aware.

## How to apply

- Assign a durable first-party ID (FPID) at account creation; use this as the golden record key in the CDP, not a cookie ID.
- Implement a deterministic merge rule: when two profiles share a verified email hash or phone hash, merge immediately; log the merge event with timestamp and confidence = "deterministic".
- For probabilistic links, store the match as a relationship edge with a confidence score and expiry; do not merge profiles — query across the edge at activation time.
- Respect jurisdictional limits: disable IP-based probabilistic matching for EEA users unless TCF consent purpose 1 and feature 1 (actively scan device characteristics) is granted.
- Run a monthly identity graph audit: measure merge accuracy, split rate (incorrectly merged profiles), and orphan rate (unresolvable anonymous sessions).

## Checklist

- [ ] Durable FPID assigned at account creation and stored in CDP as primary key
- [ ] Deterministic merges logged with timestamp, source identifier type, and confidence label
- [ ] Probabilistic matches stored as edges, not merged profiles, with expiry dates
- [ ] Probabilistic matching disabled or consent-gated for EEA jurisdictions
- [ ] Monthly identity graph accuracy audit with merge error rate tracked

## References

- CDP Institute Buyer's Guide (identity resolution section) — https://www.cdpinstitute.org/resources/customer-data-platform-buyers-guide/
- IAB Tech Lab Privacy Sandbox and identity standards — https://iabtechlab.com/
- IAB Europe TCF feature 1 (actively scan device characteristics for identification) — https://iabeurope.eu/transparency-consent-framework/
