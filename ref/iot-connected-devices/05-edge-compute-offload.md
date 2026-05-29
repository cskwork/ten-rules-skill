# Rule 05 — Edge Compute Offload

> 지연 시간이 중요한 로직과 대역폭이 큰 데이터는 에지에서 처리하라
> Push latency-sensitive logic and bandwidth-heavy data processing to the edge, not the cloud.

## Why

Round-trip latency to a cloud region is 20 to 200 ms; a factory safety interlock or autonomous vehicle reaction loop cannot wait that long. Sending raw video, LIDAR, or vibration streams from thousands of devices to the cloud is economically prohibitive and frequently technically impossible on constrained uplinks. Edge compute (AWS IoT Greengrass, Azure IoT Edge, on-premise gateways) allows pre-processing, filtering, local alerting, and protocol translation to happen at the source, reducing cloud costs by orders of magnitude while enabling offline-capable operation. The AWS IoT Lens explicitly added an edge computing scenario in its 2025 revision as a first-class architectural pattern.

## How to apply

- Define a processing tier map: what runs on the device MCU, what runs on a local gateway, and what requires the cloud. Document latency and bandwidth constraints that drive each decision.
- Deploy containerized edge modules (Lambda on Greengrass, IoT Edge modules) for ML inference, stream filtering, and local rule evaluation; these modules receive OTA updates the same as firmware.
- Implement local store-and-forward on the gateway so devices continue operating and data is not lost when the cloud uplink is unavailable.
- Aggregate and filter at the edge before cloud upload: send only anomalies, summaries, or threshold-crossing events for high-frequency signals; stream only relevant clips from video rather than raw feeds.
- Design edge modules to be stateless where possible; persist state to a local key-value store with sync semantics so the cloud twin stays consistent after reconnection.

## Checklist

- [ ] A processing tier map exists for each data type (device / gateway / cloud) with documented rationale.
- [ ] Edge modules are deployed and updated via the same OTA pipeline as firmware.
- [ ] Gateway runs local store-and-forward; data loss during cloud outage is bounded and tested.
- [ ] Bandwidth reduction ratio is measured and meets cost targets.
- [ ] Edge module health and version are reported to the cloud dashboard.

## References

- AWS IoT Greengrass Developer Guide — https://docs.aws.amazon.com/greengrass/v2/developerguide/
- Azure IoT Edge Documentation — https://learn.microsoft.com/en-us/azure/iot-edge/
- AWS Well-Architected IoT Lens (Edge Computing Scenario) — https://docs.aws.amazon.com/wellarchitected/latest/iot-lens/iot-lens.html
- Microsoft Azure IoT Reference Architecture — https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/iot
