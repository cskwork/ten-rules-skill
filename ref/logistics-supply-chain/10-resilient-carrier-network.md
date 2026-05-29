# Rule 10 — Architect for Carrier and Lane Failure

> 특정 운송사나 노선에 의존하는 시스템은 반드시 장애를 맞는다. 대체 경로를 미리 설계하라.
> Any system that depends on a single carrier or lane will eventually fail at the worst possible moment; design fallback routing before the first disruption, not after.

## Why

Carrier network disruptions — weather events, labor actions, port closures, carrier bankruptcy, regulatory suspension of operating authority — are a recurring reality, not exceptional events. UPS, FedEx, and regional carriers regularly impose embargo rules on specific ZIP codes or service types during peak periods. A TMS that can only tender to one carrier per lane will strand shipments, miss SLAs, and expose the operator to customer penalties. The ASCM SCOR model explicitly includes Return and Enable processes that require contingency sourcing; supply chain resilience is a first-class SCOR attribute alongside reliability and responsiveness. Resilience is not a feature added after launch; it requires multi-carrier rate shopping, tender sequencing, and fallback routing to be baked into the tendering architecture.

## How to apply

- Model carrier relationships as a ranked list per lane (origin region + destination region + service level), not as a single primary carrier; configure minimum two and ideally three carriers per critical lane.
- Implement a tender waterfall: attempt to tender to the preferred carrier with a timeout (e.g., 90 seconds for auto-accept); on timeout, rejection, or capacity refusal, automatically advance to the next carrier in rank order without human intervention.
- Monitor carrier acceptance rate, on-time performance, and exception rate per lane continuously; automatically downgrade the rank of underperforming carriers and surface alerts before SLA impact occurs.
- Integrate real-time service alerts from carrier APIs and industry sources; when a carrier publishes an embargo or service suspension for a geography, immediately flag affected open shipments and surface re-tender recommendations to operators.
- For international lanes, maintain at minimum one ocean and one air option; build customs broker relationships and API integrations for both so mode-switching does not require a new integration sprint under pressure.

## Checklist

- [ ] Every critical lane has at least two active, contracted carrier options in the TMS.
- [ ] Tender waterfall logic is implemented and tested; manual intervention is not required for carrier fallback.
- [ ] Carrier performance (acceptance rate, on-time %, exception rate) is tracked per lane and displayed in the operations dashboard.
- [ ] Carrier embargo and service-alert feeds are ingested and trigger automated affected-shipment reports.
- [ ] Fallback routing is tested with simulated carrier rejection at least quarterly.

## References

- ASCM SCOR Digital Standard v14 — Return and Enable process domains, resilience attributes — https://scor.ascm.org/
- Martin Christopher, "Logistics and Supply Chain Management" 6th ed., Pearson 2022 — https://www.pearson.com/en-us/subject-catalog/p/logistics-and-supply-chain-management/P200000007134/9781292416205
- FMCSA — Carrier safety and authority verification — https://www.fmcsa.dot.gov/regulations
- Eliyahu M. Goldratt and Jeff Cox, "The Goal: A Process of Ongoing Improvement" — system thinking and dependency management — https://www.amazon.com/Goal-Process-Ongoing-Improvement/dp/0884271951
