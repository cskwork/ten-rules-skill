# Rule 07 — Build Lawful Intercept and Data Retention Hooks from the Start

> 통신 규제 의무(합법적 감청, 통화 기록 보존)는 시스템 설계 초기에 아키텍처로 내장해야 하며, 사후 추가는 불가능하다
> Lawful intercept interfaces, call detail record retention, and regulatory reporting must be first-class architectural concerns, not retrofit features.

## Why

Every licensed telecommunications carrier worldwide is legally required to support lawful intercept (LI) under CALEA (US), ETSI TS 101 671 (Europe), or equivalent national frameworks. Call Detail Records (CDRs) must be retained for regulatory-mandated periods (typically 12 to 24 months) and produced to law enforcement on demand. GDPR and similar privacy laws add a paradox: subscriber data must be erasable on request, but retained for lawful intercept — systems that have not modelled this tension from the start cannot satisfy both obligations simultaneously. Retrofitting LI into a live network requires a full architecture review and typically a network freeze; operators who buy software without LI capability embedded will fail their carrier licence audit.

## How to apply

- Implement a dedicated Lawful Intercept Gateway (LIG) component that is isolated from the main product stack: interception targets and intercept records must never be queryable by normal application code or logs.
- Model CDR storage as an immutable, append-only audit log with a separate retention policy engine: regulatory retention (12–24 months) runs independently of GDPR erasure; implement a legal-hold flag that blocks erasure on records subject to an active interception order.
- Ensure the LI interface conforms to ETSI TS 101 671 / CALEA standards for Handover Interface (HI1 administration, HI2 call-associated data, HI3 content); do not implement proprietary variants.
- Encrypt LI data at rest with keys held in an HSM accessible only to the LIG; LI data must never coexist in the same storage tier as normal application data.
- Audit every access to LI data — who queried, what warrant authorised it, what was delivered — in a tamper-evident log.

## Checklist

- [ ] LI Gateway is deployed as an isolated component; no direct access from application services
- [ ] CDR storage is append-only with legal-hold flag support that blocks GDPR erasure
- [ ] HI1/HI2/HI3 interfaces are implemented per ETSI TS 101 671 or CALEA as required by jurisdiction
- [ ] LI encryption keys are stored in HSM, not in application config
- [ ] LI access audit log is tamper-evident and retained separately from application logs

## References

- ETSI TS 101 671 — Lawful Interception: Handover Interface for the Lawful Interception of Telecommunications Traffic — https://www.etsi.org/deliver/etsi_ts/101600_101699/101671/
- CALEA — Communications Assistance for Law Enforcement Act (FCC) — https://www.fcc.gov/public-safety/communications-assistance-law-enforcement-act
- 3GPP TS 33.107 — Lawful Interception Architecture and Functions — https://www.3gpp.org/DynaReport/33107.htm
- TM Forum eTOM — https://www.tmforum.org/open-digital-architecture/process-framework-etom/
