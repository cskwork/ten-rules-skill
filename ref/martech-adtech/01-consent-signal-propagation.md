# Rule 01 — Consent Signal Propagation

> 사용자 동의 신호를 데이터 사용 전 반드시 전파하고 검증하라.
> Propagate and verify consent signals before any personal data is processed or shared.

## Why

GDPR and the IAB Transparency and Consent Framework (TCF v2.2/2.3) require that a lawful basis — typically explicit consent — is established and encoded in a TC String before any vendor in the programmatic supply chain processes personal data. Failing to carry consent signals downstream exposes every party (publisher, SSP, DSP, data broker) to joint-controller liability, not just the consent management platform. A March 2024 European Court of Justice ruling confirmed that TC Strings themselves qualify as personal data when linkable to an identifiable user, raising the compliance bar further. Ad revenue dries up the moment a regulator issues an injunction blocking TCF-based bidding, as happened in Belgium in 2022.

## How to apply

- Integrate a TCF-certified CMP that writes a valid TC String to the `__tcfapi` JavaScript API before any ad call fires.
- Read and pass the `consent` and `addtlConsent` fields in every OpenRTB bid request `Regs` and `User` objects; never strip or ignore them downstream.
- Gate all first-party data writes (CDP profile updates, pixel fires, email capture) on a resolved consent status — do not write optimistically and clean up later.
- Maintain a per-user consent log with timestamp, version, and signal source; this log is the audit trail regulators will request.
- Re-acquire consent when the vendor list version or purposes change; stale consent for an updated vendor list is not valid.

## Checklist

- [ ] CMP is IAB TCF-certified and transmits a valid TC String before ad calls
- [ ] TC String is forwarded in every outbound bid request without modification
- [ ] Data pipeline writes are blocked when consent status is unresolved or denied
- [ ] Consent log is append-only, timestamped, and retained for the regulatory minimum (commonly 3 years)
- [ ] Consent re-solicitation triggers automatically when vendor list version changes

## References

- IAB Europe Transparency and Consent Framework — https://iabeurope.eu/transparency-consent-framework/
- IAB Tech Lab GDPR Transparency and Consent Framework (technical spec) — https://iabtechlab.com/standards/gdpr-transparency-and-consent-framework/
- IAB Europe TCF v2.2 vendor list and purpose definitions (official policy document) — https://iabeurope.eu/tcf-policy/
