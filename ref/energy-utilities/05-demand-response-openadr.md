# Rule 05 — Implement Demand Response over Certified OpenADR 2.0

> 수요 반응 신호는 OpenADR 2.0 인증 경로를 통해서만 교환해야 한다.
> Demand response signals must be exchanged only through a certified OpenADR 2.0 communication path.

## Why

Demand response (DR) programs — where utilities or grid operators pay customers to reduce consumption during peak periods — now constitute a significant and growing grid resource. FERC Order 2222 requires grid operators to allow aggregated distributed energy resources (DERs), including DR, to participate in wholesale markets alongside traditional generators. OpenADR 2.0 (Open Automated Demand Response) is the ANSI/CTA standard communication protocol that defines how Virtual Top Nodes (VTNs — utilities and aggregators) signal curtailment events to Virtual End Nodes (VENs — building management systems, industrial loads, EV chargers). Building a proprietary DR signal path creates a closed ecosystem that cannot interoperate with utility programs, cannot be certified for market participation, and breaks when the utility upgrades its DR platform. Uncertified VEN implementations also fail event acknowledgment, opt-out, and fault-tolerance requirements that market operators require for settlement.

## How to apply

- Implement the VEN (customer side) and/or VTN (utility/aggregator side) using an OpenADR 2.0b certified library or platform; verify certification status on the OpenADR Alliance certified products list before selecting a component.
- Use HTTPS + XML (SOAP) or REST+JSON transport as mandated by the 2.0b profile; enforce TLS 1.2 or higher with mutual certificate authentication — OpenADR event signals carry financial value and must not be spoofable.
- Model every DR event with explicit payload (simple, price, reliability), event duration, and response-required flag; build the opt-out path as a first-class workflow, not an afterthought, because FERC and most PUC tariffs require customers to be able to opt out.
- For FERC 2222 wholesale market participation, ensure the aggregator platform can produce settlement-grade telemetry proving actual load reduction per interval — the DR signal alone is insufficient; measured and verified (M&V) metering is required for payment.
- Test event delivery end-to-end against the utility's DR test server before enabling live events; include fault scenarios: what happens when the VEN is offline when an event starts, what happens if the utility cancels mid-event.

## Checklist

- [ ] VEN and/or VTN components carry valid OpenADR Alliance 2.0b certification.
- [ ] TLS mutual authentication is enforced on all OpenADR communication paths.
- [ ] Opt-out workflow is implemented and reachable within the event acknowledgment response window.
- [ ] Settlement-grade interval metering is in place to support M&V for market payment.
- [ ] End-to-end delivery is tested against the utility DR test environment including edge-case event scenarios.

## References

- OpenADR Alliance: An Introduction to Automated Demand Response and the OpenADR Standard — https://www.openadr.org/assets/docs/openadr_primer.pdf
- FERC Order No. 2222: Facilitating Participation in Electricity Markets by Distributed Energy Resources — https://www.ferc.gov/ferc-order-no-2222-explainer-facilitating-participation-electricity-markets-distributed-energy
- ANSI/CTA-2045-B: Modular Communications Interface for Energy Management — Consumer Technology Association — https://www.cta.tech/Resources/Standards/Standard-Shares/2022/ANSI-CTA-2045-B
