# Rule 09 — Instrument Cost-to-Serve at the Shipment Level

> 모든 화물의 실제 서비스 비용을 개별적으로 측정해야 한다. 평균 비용 관리는 수익성 있는 고객과 적자 고객을 구분하지 못한다.
> Measure actual cost to serve every shipment individually; managing averages conceals which customers, lanes, and service levels are profitable and which are not.

## Why

Martin Christopher's work on supply chain profitability demonstrates that the 80/20 rule applies inversely in logistics: many customers who appear profitable on revenue are net destroyers of value when their full service cost — small orders, expedited shipments, excessive returns, premium accessorial charges, after-hours delivery requirements — is attributed to them. Without shipment-level cost instrumentation, a carrier rate shop that saves $0.50 per package is invisible against a customer-specific exception-handling cost of $8. TMS and billing platforms that only aggregate to lane-level or customer-level averages cannot surface this. Carriers and 3PLs who instrument cost-to-serve at shipment granularity can reprice, re-route, or restructure service agreements with data rather than intuition.

## How to apply

- Capture and store every cost component on the shipment record: base linehaul rate, fuel surcharge, residential delivery fee, address-correction fee, Saturday delivery, dimensional weight upcharge, return handling. Do not roll these into a single freight total.
- Implement automated carrier invoice auditing: compare billed charges against rated charges for every shipment; flag discrepancies above a configurable tolerance for dispute workflow.
- Attribute internal handling cost to shipments: pick-and-pack labour (from WMS task times), packaging material (from pack station), dock labour (from dock schedule), returns processing.
- Calculate and persist "net margin per shipment" = revenue attributed to shipment - all carrier charges - all internal handling costs; make this queryable by customer, lane, service level, carrier, and date range.
- Surface cost-to-serve metrics in operational dashboards so carrier selection, service-level negotiation, and customer pricing decisions are data-driven.

## Checklist

- [ ] All carrier accessorial charges are stored as individual line items on the shipment, not merged into a freight total.
- [ ] Automated carrier invoice audit runs on every invoice and routes discrepancies to a dispute queue.
- [ ] Internal handling costs (labour, materials) are attributed to shipments from WMS and pack-station records.
- [ ] Net margin per shipment is calculable and queryable.
- [ ] Dashboards expose cost-to-serve segmented by customer, lane, and carrier.

## References

- Martin Christopher, "Logistics and Supply Chain Management" 6th ed., Pearson 2022 — https://www.pearson.com/en-us/subject-catalog/p/logistics-and-supply-chain-management/P200000007134/9781292416205
- ASCM SCOR Digital Standard v14 — performance metrics, cost to serve — https://scor.ascm.org/
- Eliyahu M. Goldratt and Jeff Cox, "The Goal: A Process of Ongoing Improvement" — throughput accounting principles — https://www.amazon.com/Goal-Process-Ongoing-Improvement/dp/0884271951
