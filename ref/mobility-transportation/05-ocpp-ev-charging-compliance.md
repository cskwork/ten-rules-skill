# Rule 05 — OCPP EV Charging Compliance

> OCPP 없이 충전기를 연동하면 벤더 종속과 운영 장애가 반복된다.
> Integrating chargers without OCPP locks you into vendor dependency and repeated operational failures.

## Why

OCPP (Open Charge Point Protocol), maintained by the Open Charge Alliance, is the de facto global standard for communication between EV charging stations (charge points) and a Central Management System (CMS). As of 2025 it is deployed in 137 countries and has received IEC approval (IEC 63584). Without OCPP, each hardware vendor requires a proprietary integration: when a vendor changes firmware, your platform breaks. OCPP 2.1 adds V2G (vehicle-to-grid) capability, device management, and transaction event granularity that regulators in the EU (under AFIR — Alternative Fuels Infrastructure Regulation) now mandate for public charging infrastructure. A charging platform that does not implement OCPP correctly will fail hardware certification and cannot participate in national charging networks.

## How to apply

- Implement OCPP 2.0.1 as the minimum version for new integrations; target OCPP 2.1 for any V2G, smart charging, or ISO 15118 (Plug and Charge) use cases.
- Use the OCPP message protocol over WebSocket (JSON-RPC); never use proprietary REST wrappers that hide the transaction event model.
- Implement the full transaction lifecycle: `TransactionEvent` (Started / Updated / Ended) with `MeterValues` at configurable intervals — billing systems must receive granular energy readings, not just start/stop totals.
- Model the data hierarchy correctly: Location > EVSE (Electric Vehicle Supply Equipment) > Connector; a single charge point may have multiple EVSEs, each with multiple connectors.
- Test against the OCPP Compliance Testing Tool from the Open Charge Alliance before connecting any hardware in production; maintain a test charge point in your CI environment.

## Checklist

- [ ] All charger integrations use OCPP 2.0.1 or higher over WebSocket.
- [ ] Full `TransactionEvent` lifecycle (Started / Updated / Ended) is implemented and stored.
- [ ] `MeterValues` (energy in kWh) are recorded at configurable intervals and reconciled with billing.
- [ ] Location / EVSE / Connector data model is correctly represented and exposed in the operator dashboard.
- [ ] Integration tested against OCA compliance test suite before production rollout.

## References

- Open Charge Alliance — OCPP Protocols — https://openchargealliance.org/protocols/ocpp-protocols/
- Open Charge Alliance — Open Charge Point Protocol 2.1 — https://openchargealliance.org/protocols/open-charge-point-protocol/
- Open Charge Alliance — OCPP 2.0.1 Specification (official download) — https://openchargealliance.org/protocols/ocpp-201/
- EU Alternative Fuels Infrastructure Regulation (AFIR) — Regulation (EU) 2023/1804 — https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32023R1804
