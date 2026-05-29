# Rule 07 — Represent Every Asset with an Asset Administration Shell

> 모든 설비 자산은 표준화된 디지털 트윈(AAS)으로 표현하여 전 생애주기 데이터를 연결하라.
> Give every physical asset a standardized Asset Administration Shell so its digital data is accessible across its entire lifecycle.

## Why

A machine on the factory floor generates engineering data (CAD, manuals, wiring diagrams), operational data (telemetry, alarms, OEE), quality data (SPC, calibration records), and maintenance data (work orders, spare parts). Without a standardized container, this data lives in siloed systems and is lost when equipment is transferred, upgraded, or decommissioned. The Asset Administration Shell (AAS), standardized in IEC 63278-1:2023 and governed by the Industrial Digital Twin Association (IDTA), provides a machine-readable, vendor-neutral digital representation of any industrial asset. It is the formal definition of "digital twin" inside the RAMI 4.0 architecture, and it enables plug-and-produce equipment integration, predictive maintenance, and Digital Product Passport compliance — all of which are procurement and regulatory requirements in EU Industry 4.0 frameworks.

## How to apply

- Create an AAS instance for every significant asset (machine, line, tool, sensor cluster) at procurement or commissioning; populate the Nameplate and TechnicalData submodels from the supplier's documentation before first startup.
- Use IDTA-standardized submodels (Nameplate, TechnicalData, Documentation, Maintenance, SoftwareNameplate) before inventing custom submodels — proprietary extensions are permitted but must not duplicate a standard submodel.
- Expose AAS instances via the AAS HTTP/REST API (IEC 63278-2) so MES, ERP, and analytics platforms can discover asset metadata without direct database queries.
- Synchronize live telemetry into the OperationalData submodel via the OPC UA–to–AAS bridge where the asset supports OPC UA; this couples Rules 02 and 07.
- Archive the complete AAS package (all submodels) when equipment is decommissioned; regulatory and warranty traceability requires this data to be retained and queryable for 10+ years.

## Checklist

- [ ] Every production asset has an AAS instance with at minimum Nameplate and TechnicalData submodels populated.
- [ ] AAS instances are exposed via the standard AAS REST API; consumers do not query the underlying database directly.
- [ ] IDTA standard submodels are used before creating custom submodels.
- [ ] AAS packages are archived on equipment decommissioning with a defined retention policy.
- [ ] Live telemetry linkage (OPC UA or equivalent) is documented in the AAS OperationalData submodel.

## References

- IEC 63278-1:2023, *Asset Administration Shell — Part 1: Metamodel* — https://www.iec.ch/homepage
- Industrial Digital Twin Association (IDTA) — https://industrialdigitaltwin.org
- Plattform Industrie 4.0, *Reference Architecture Model Industrie 4.0 (RAMI 4.0)* — https://www.plattform-i40.de/IP/Redaktion/EN/Downloads/Publikation/rami40-an-introduction.html
- IDTA AAS Submodel Templates — https://industrialdigitaltwin.org/en/content-hub/submodels
