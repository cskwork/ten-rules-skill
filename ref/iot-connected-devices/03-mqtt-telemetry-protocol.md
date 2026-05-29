# Rule 03 — MQTT Telemetry Protocol

> QoS 등급과 페이로드 크기를 제약 환경에 맞게 의도적으로 설계하라
> Choose MQTT QoS levels and payload sizes deliberately for constrained links.

## Why

MQTT is the dominant IoT messaging protocol precisely because it is lightweight and operates over unreliable, low-bandwidth links, but misuse negates those advantages. Using QoS 2 (exactly-once) everywhere quadruples broker overhead and is unnecessary for sensor readings; using QoS 0 for commands to actuators risks silent data loss. Large JSON payloads on NB-IoT or LoRaWAN links exhaust monthly data budgets and cause dropped connections. The OASIS MQTT v5.0 standard formalizes message expiry, topic aliases, and shared subscriptions that resolve scale problems absent from v3.1.1, so the version choice is itself an architectural decision.

## How to apply

- Use QoS 0 (fire-and-forget) for high-frequency sensor telemetry where occasional loss is acceptable (temperature, GPS pings); use QoS 1 (at-least-once) for events and alerts; reserve QoS 2 (exactly-once) only for billing or safety-critical commands where duplicate delivery causes real harm.
- Use binary serialization (Protocol Buffers, CBOR, or MessagePack) instead of JSON for payloads on bandwidth-limited links; target payloads under 256 bytes for NB-IoT and LoRaWAN.
- Design topic hierarchies to support wildcard subscriptions and access control: `<tenant>/<site>/<device-type>/<device-id>/<measurement>`. Avoid flat or ambiguous topics.
- Upgrade to MQTT v5.0 for new deployments to gain message expiry intervals, topic aliases, and reason codes that greatly simplify debugging at scale.
- Set a Last Will and Testament (LWT) message on every device connection so downstream consumers detect ungraceful disconnects without polling.

## Checklist

- [ ] QoS levels are documented per topic category, not applied uniformly.
- [ ] Payload size budget is defined and enforced for each device class.
- [ ] Topic hierarchy follows a documented schema with tenant and device-type segments.
- [ ] LWT messages are configured so ungraceful disconnects surface in the platform.
- [ ] Broker ACLs restrict each device to its own topic subtree (no cross-device publish).

## References

- OASIS MQTT Version 5.0 Standard — https://docs.oasis-open.org/mqtt/mqtt/v5.0/mqtt-v5.0.html
- MQTT.org Specification Portal — https://mqtt.org/mqtt-specification/
- AWS IoT Core MQTT Documentation — https://docs.aws.amazon.com/iot/latest/developerguide/mqtt.html
- Azure IoT Hub MQTT Support — https://learn.microsoft.com/en-us/azure/iot-hub/iot-hub-mqtt-support
