# Rule 08 — Propagate Network Slice Context Through the Software Stack

> 5G 네트워크 슬라이스 식별자(S-NSSAI)는 가입자 요청의 첫 진입점부터 정책 시행 지점까지 일관되게 전달되어야 한다
> The network slice identifier (S-NSSAI) must flow from subscriber request entry point to policy enforcement without loss or substitution.

## Why

5G's network slicing allows a single physical network to be partitioned into logically isolated virtual networks, each with distinct SLA characteristics: a slice for URLLC (ultra-reliable low-latency communication) for autonomous vehicles has fundamentally different QoS guarantees than a slice for eMBB (enhanced mobile broadband) for consumer video. BSS/OSS software that ignores slice context and applies uniform policies violates the enterprise SLAs that 5G slicing is sold to deliver. The 3GPP Single Network Slice Selection Assistance Information (S-NSSAI) — composed of Slice/Service Type (SST) and optionally a Slice Differentiator (SD) — is the machine-readable identifier that must be threaded through every order, provisioning, charging, and assurance workflow.

## How to apply

- Include S-NSSAI as a first-class attribute on ProductOffering, ServiceSpecification, and subscriber session records; do not derive slice from product type at runtime.
- Propagate S-NSSAI in all API calls that touch network function configuration: AMF slice selection, SMF session establishment, PCF policy rules, and CHF charging context must all carry the same S-NSSAI value without translation.
- Implement per-slice SLA monitoring: separate RED metrics (rate, error rate, latency) per S-NSSAI value; a latency breach on an eMBB slice must not mask a breach on a URLLC slice.
- When a subscriber product bundle crosses multiple slices (e.g., consumer voice + enterprise IoT), model the bundle as a set of distinct `ServiceSpecification` entities each with its own S-NSSAI; do not average or default to one slice.
- Expose slice availability and utilisation as operator-facing dashboards; capacity planning for a slice is a commercial commitment, not a network-ops internal metric.

## Checklist

- [ ] S-NSSAI is a typed, non-nullable field on service provisioning and charging records
- [ ] Slice identity is set at order time and immutable during the session; no runtime slice reassignment without explicit re-provisioning
- [ ] Per-slice SLA metrics are tracked and alerted independently
- [ ] API contract between BSS and 5G core NFs carries S-NSSAI without lossy transformation
- [ ] Multi-slice product bundles model each slice as a distinct service entity

## References

- 3GPP TS 23.501 — System Architecture for the 5G System (S-NSSAI definition) — https://www.3gpp.org/DynaReport/23501.htm
- 3GPP TS 28.530 — Management and Orchestration: Concepts, Use Cases and Requirements — https://www.3gpp.org/DynaReport/28530.htm
- GSMA Open Gateway — Unlocking the Power of Network APIs — https://www.gsma.com/solutions-and-impact/gsma-open-gateway/open-gateway-unlocking-the-power-of-network-apis/
