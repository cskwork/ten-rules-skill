# Rule 02 — Use OPC UA as the Lingua Franca for OT/IT Data Exchange

> 장비와 시스템 사이의 데이터 교환은 OPC UA 표준으로 통일하라.
> Standardize all device-to-system and system-to-system data exchange on OPC UA.

## Why

Industrial floors contain equipment from dozens of vendors running proprietary protocols (Modbus, PROFINET, EtherNet/IP, FANUC FOCAS, SECS/GEM for semiconductor). Without a neutral transport and information model, every new machine requires a custom driver that becomes unmaintainable technical debt. OPC UA (IEC 62541) provides a platform-independent, secure, semantically rich protocol with built-in authentication, encryption, and structured data models. Its Companion Specifications (for robotics, CNC, PLC, semiconductor SEMI E164) give vendor-neutral schemas that MES and historians can consume without mapping layers. Choosing non-standard transports locks the factory to a single integrator and makes OEE data impossible to aggregate across lines.

## How to apply

- Require OPC UA server capability in all new equipment procurement specifications; treat legacy equipment without OPC UA as requiring an edge gateway adapter.
- Use OPC UA Companion Specifications (e.g., OPC 30270 for CNC, OPC 40001 for Machinery) as the schema — do not invent custom node structures for data that a companion spec already covers.
- Deploy OPC UA PubSub (MQTT or AMQP broker) for high-frequency telemetry (>10 Hz); use OPC UA Client/Server for transactional reads and method calls.
- Enforce certificate-based security (SecurityMode = SignAndEncrypt) on all production OPC UA connections; anonymous access is permitted only in isolated test environments.
- Maintain an OPC UA address-space registry so MES, historians, and analytics platforms discover nodes from a single catalog rather than hardcoding NodeIds.

## Checklist

- [ ] All new equipment purchase orders include OPC UA server as a mandatory deliverable.
- [ ] OPC UA Companion Specifications are referenced before designing custom information models.
- [ ] Production connections use SignAndEncrypt security mode with managed certificates.
- [ ] High-frequency telemetry uses OPC UA PubSub; transactional access uses Client/Server.
- [ ] A node catalog exists; NodeIds are not hardcoded in application code.

## References

- OPC Foundation, *OPC Unified Architecture Specification* (IEC 62541) — https://opcfoundation.org/developer-tools/specifications-unified-architecture
- OPC Foundation, Companion Specifications index — https://opcfoundation.org/developer-tools/specifications-opc-ua-information-models
- OPC Foundation official site — https://opcfoundation.org
- Wolfgang Mahnke, Stefan-Helmut Leitner, Matthias Damm, *OPC Unified Architecture* (Springer, 2009) — https://link.springer.com/book/10.1007/978-3-540-68899-0
