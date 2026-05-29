# Rule 05 — Disruption and Irregular Operations Handling

> 항공편 지연·취소 상태는 실시간으로 전파하고, 고객 통보보다 재예약을 먼저 처리하라.
> Propagate disruption state in real time and execute reaccommodation before notifying the passenger.

## Why

IROP (Irregular Operations) — flight cancellations, significant delays, hotel overbookings — are not edge cases in travel software; they are routine operational states that affect millions of passengers daily. The legal and contractual obligations triggered by an IROP are strict: EU Regulation 261/2004 mandates compensation and rebooking rights for delays over two hours and cancellations; US DOT rules require prompt rebooking or refund. Systems that queue a notification before a rebooking option is ready strand passengers at the gate with no recourse. At scale (a hub cancellation can affect 10,000+ passengers simultaneously), the rebooking engine must be automated, prioritized by loyalty tier and connection risk, and idempotent.

## How to apply

- Subscribe to a real-time flight status feed (AIRS, FlightAware, or the airline's own SSIM/OAG stream) and propagate status changes to the booking record within 60 seconds of the official airline update.
- Model IROP as a first-class workflow state: `FLIGHT_DISRUPTED` → `REACCOMMODATION_IN_PROGRESS` → `REACCOMMODATED` or `REFUND_INITIATED`; do not handle IROP as an ad hoc exception.
- Automate rebooking proposals before sending passenger notifications: identify alternative flights with available inventory, calculate the best option by connection protection rules, and present a pre-selected offer — the passenger confirms or rejects, not searches.
- For hotel overbooking: integrate with the property's PMS to detect oversell before check-in; walk the guest to a comparable or superior property and record the walk with cost-transfer reference before the guest arrives at the desk.
- Expose a compensation eligibility calculator as an internal API: given the disruption type, delay duration, route origin/destination, and booking class, return the applicable regulation (EU 261, DOT, Montreal Convention) and compensation amount.
- Design the notification system to be a downstream consumer of the IROP workflow, not a trigger for it; notifications should only fire when a rebooking option or refund is ready to present.

## Checklist

- [ ] Flight status changes are reflected in booking records within 60 seconds of source update.
- [ ] IROP workflow state machine is implemented; no IROP is handled as a one-off exception in application code.
- [ ] Rebooking proposals are generated automatically before passenger notification is sent.
- [ ] Compensation eligibility is calculated by rule engine, not hardcoded per airline or route.
- [ ] Hotel walk procedure is recorded in the PMS with cost-transfer reference before guest contact.

## References

- EU Regulation 261/2004 on air passenger rights — https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32004R0261
- US DOT Air Passenger Protections — https://www.transportation.gov/airconsumer/fly-rights
- ACI World Airport Service Quality program — https://aci.aero/programs-and-services/asq/
- IATA Operations standards — https://www.iata.org/en/programs/ops-infra/
