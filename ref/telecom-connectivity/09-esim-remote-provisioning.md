# Rule 09 — Follow GSMA RSP Specifications for eSIM and Profile Management

> eSIM 프로파일 다운로드 및 관리는 GSMA SGP.22(소비자) 또는 SGP.32(IoT) 규격의 프로토콜 흐름을 정확히 구현해야 한다
> Implement eSIM Remote SIM Provisioning strictly per GSMA SGP.22 (consumer) or SGP.32 (IoT) — no proprietary shortcuts in the provisioning protocol flow.

## Why

eSIM eliminates the physical SIM but introduces a complex, GSMA-standardised provisioning chain: the Subscription Manager Data Preparation (SM-DP+) server generates encrypted operator profiles; the Local Profile Assistant (LPA) on the device negotiates download via a defined protocol over HTTPS; the SM-DS (Discovery Server) routes device discovery to the correct SM-DP+. Any deviation from these protocol flows — skipping certificate validation, bypassing the activation code exchange, or using non-standard profile format — produces devices that cannot roam to partner networks, fail GSMA compliance audits, or expose profile keys to interception. For IoT deployments governed by SGP.32, the constrained-device architecture differs significantly from SGP.22 and the two must not be conflated.

## How to apply

- Implement SM-DP+ per GSMA SGP.22 Section 2 for consumer eSIM: profile package encryption uses ECIES; the ES8+ interface between SM-DP+ and eUICC (the embedded SIM chip) is mandatory and must not be proxied.
- For IoT fleets, implement the eIM (eSIM IoT Remote Manager) role per SGP.32: the eIM manages profile lifecycle for constrained devices that cannot run a full LPA.
- Certificate chain management is critical: operator certificates must be enrolled in the GSMA Certificate Issuer (CI) root before a profile can be downloaded to any device; plan a 30-day lead time for CI enrolment in new markets.
- Implement idempotent profile download: if a download is interrupted mid-session, the device must be able to resume without requesting a new profile package; the SM-DP+ must support re-download of the same profile transaction ID.
- Expose profile lifecycle events (downloaded, enabled, disabled, deleted) as auditable events with ICCID, EID (eUICC identifier), timestamp, and initiating actor for regulatory and fraud tracing.

## Checklist

- [ ] SM-DP+ implements GSMA SGP.22 ES8+ interface with full ECIES profile encryption
- [ ] IoT provisioning follows SGP.32 eIM architecture, not the consumer SGP.22 LPA flow
- [ ] Operator certificate chain is enrolled in GSMA CI root before go-live
- [ ] Profile download supports resume/re-download for interrupted sessions
- [ ] Profile lifecycle events are logged with EID, ICCID, and actor for audit purposes

## References

- GSMA SGP.22 — RSP Technical Specification (consumer eSIM) — https://www.gsma.com/solutions-and-impact/technologies/esim/esim-specification/
- GSMA SGP.32 — eSIM IoT Architecture and Technical Specification — https://www.gsma.com/solutions-and-impact/technologies/internet-of-things/iot-esim-specification-sgp-32/
- GSMA — How GSMA IoT and consumer eSIM powers innovation — https://www.gsma.com/solutions-and-impact/technologies/esim/about/
- Onomondo — What is GSMA SGP.32? — https://onomondo.com/blog/what-is-gsma-sgp-32-esim-iot-standard/
