# Rule 05 — Treat Number Portability as a Hard Dependency

> 번호 이동성(MNP/LNP) 조회는 가입자 활성화 경로에서 생략할 수 없는 의무 단계이다
> Every activation, routing, and porting workflow must resolve number portability status before committing a subscriber record or emitting a routing update.

## Why

Mobile Number Portability (MNP) and Local Number Portability (LNP) are regulatory mandates in virtually every jurisdiction where telecoms operate. A subscriber activation that skips an NPAC/MNP database query and assigns a number already ported to a competitor causes a double-assignment: two carriers believe they own the same MSISDN, producing call routing failures, billing disputes, and regulatory complaints. In the US, the Number Portability Administration Center (NPAC), operated by iconectiv, is the authoritative source of truth; queries against it are not optional. Porting workflows have strict regulatory timelines (e.g., one business day in the US, 24 hours in many EU markets) that translate directly into software SLA requirements.

## How to apply

- Treat the NPAC/MNP database query as a synchronous gate on every new activation: do not write the subscriber record until portability status is confirmed.
- Implement a Service Order Activator (SOA) interface that subscribes to SPN (Service Provider Notifications) from the NPAC to receive real-time porting notifications rather than polling.
- Model the porting workflow as a state machine with mandatory regulatory checkpoints: Port Request Submitted → Port Validated → Port Accepted/Rejected → Due Date Set → Port Completed.
- Maintain a local number inventory that tracks each MSISDN's portability state (native, ported-in, ported-out, pending-port) and update it atomically when NPAC notifications arrive.
- Build separate rejection handling for LNP validation failures; do not silently fall back to completing the activation without portability confirmation.

## Checklist

- [ ] Activation path queries NPAC/MNP database before writing subscriber record
- [ ] SPN subscription is active and tested for inbound port notifications
- [ ] Porting workflow enforces regulatory timing SLAs and alerts on approaching deadlines
- [ ] Number inventory tracks portability state per MSISDN with audit log
- [ ] Double-assignment scenario is tested: attempt to activate an already-ported number must fail gracefully

## References

- NPAC — Number Portability Administration Center (iconectiv) — https://iconectiv.com/NPAC
- numberportability.com — About NPAC — https://numberportability.com/about/npac
- Wikipedia — Local Number Portability — https://en.wikipedia.org/wiki/Local_number_portability
- netnumber — Understanding Number Portability — https://netnumber.com/what-is-number-portability/
