# Rule 08 — Digital Twin / Device Shadow

> 기기의 현재 상태와 원하는 상태를 클라우드 섀도우로 분리하여 관리하라
> Maintain a device shadow that separates desired state from reported state as the authoritative source of truth.

## Why

Multiple applications (mobile app, web dashboard, automation rules, support tools) must read and command a device simultaneously without polling the physical device directly — which may be offline, slow, or on a metered link. The device shadow (digital twin) pattern, used by AWS IoT Device Shadow and Azure IoT Hub Device Twin, decouples application reads from device availability. It also makes command acknowledgment first-class: the desired state represents intent, and the delta between desired and reported drives the device to reconcile without requiring a persistent connection. Without this pattern, teams build ad-hoc polling and command channels that diverge into inconsistency over time.

## How to apply

- Structure every shadow with three sections: desired (platform wants), reported (device last confirmed), and delta (computed difference). Only the device writes to reported; only the platform writes to desired.
- Design shadow documents to be small and property-focused (firmware target version, thermostat setpoint, sensor reporting interval), not a dump of all telemetry; raw telemetry belongs in the time-series store.
- Handle shadow reconciliation on-device with idempotent logic: when the device connects, it reads the delta and applies any pending desired state changes, then publishes the updated reported state.
- Use shadow versioning to detect stale writes: reject desired-state updates that carry an older version number than the current shadow to prevent command races.
- Expose the shadow via a read-only API for web and mobile frontends; never allow frontends to publish directly to MQTT topics or bypass the shadow model.

## Checklist

- [ ] Shadow document distinguishes desired, reported, and delta fields.
- [ ] Devices reconcile shadow delta on every connect event.
- [ ] Shadow documents are under 8 KB (AWS limit); bloated properties are moved to time-series.
- [ ] Shadow version numbers are used to prevent stale-write conflicts.
- [ ] Frontends read device state only through the shadow API, not by subscribing to raw MQTT topics.

## References

- AWS IoT Device Shadow Service — https://docs.aws.amazon.com/iot/latest/developerguide/iot-device-shadows.html
- Azure IoT Hub Device Twins — https://learn.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-device-twins
- AWS Well-Architected IoT Lens — https://docs.aws.amazon.com/wellarchitected/latest/iot-lens/iot-lens.html
- Claire Rowland et al., "Designing Connected Products: UX for the Consumer Internet of Things" (O'Reilly, 2015) — https://www.oreilly.com/library/view/designing-connected-products/9781449372682/
