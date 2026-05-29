# Rule 10 — Design Edge Nodes to Operate Fully Offline

> 공장 엣지 시스템은 네트워크 단절 상황에서도 핵심 기능이 중단 없이 작동해야 한다.
> Factory edge systems must execute all safety-critical and production-critical functions without any dependency on network connectivity to central systems.

## Why

A factory floor is not a cloud-native environment. Network partitions between the shop floor and the data center (or cloud) happen routinely: planned maintenance windows, fiber cuts, switch failures, and OT security isolation events. If an operator terminal, edge MES node, or SCADA server requires a round-trip to a central server to display a work instruction, dispatch a work order, or record a quality measurement, a network outage stops production. For high-value processes — semiconductor implant steps, pharmaceutical batch critical path, automotive press operations — each minute of unplanned downtime costs thousands of dollars and may scrap in-process material. Edge-first design means the local node holds sufficient state to continue operating during a partition and reconciles with the central system when connectivity is restored.

## How to apply

- Define which functions are offline-critical for each edge node: at minimum, work instruction display, process parameter dispatch, material scan/consume, and quality measurement capture must work without network.
- Implement a local store-and-forward queue for all events generated during a partition; replay to central systems in arrival order after reconnection, with idempotency keys to prevent duplicate records.
- Use conflict resolution rules defined before deployment (last-writer-wins for non-critical config, central-wins for recipe versions, append-only for quality records) — do not design conflict resolution as a future task.
- Monitor connectivity health at the edge node and surface partition start/end events to operations; never allow silent data loss during a partition.
- Test offline behavior explicitly in acceptance testing: simulate a 30-minute network partition, verify production continues, verify full reconciliation after reconnect with zero data loss.

## Checklist

- [ ] Offline-critical functions are enumerated per edge node and tested in isolation from central systems.
- [ ] A local store-and-forward queue is implemented; events are persisted to durable local storage (not only RAM).
- [ ] Conflict resolution rules for every data type are documented before deployment.
- [ ] Network partition events are surfaced to operations in real time; silent data loss is not possible by design.
- [ ] Acceptance test suite includes a 30-minute simulated partition with full reconciliation verification.

## References

- IEC 62264-1, *Enterprise-Control System Integration* (Level 2/3 edge guidance) — https://www.isa.org/standards-and-publications/isa-standards/isa-95-standard
- OPC Foundation, *OPC UA PubSub Specification* (offline buffering patterns) — https://opcfoundation.org/developer-tools/specifications-unified-architecture
- MESA International, *Edge Computing in Manufacturing* — https://mesa.org
- Industry 4.0 / Plattform Industrie 4.0, *Edge Cloud* architecture guidance — https://www.plattform-i40.de
