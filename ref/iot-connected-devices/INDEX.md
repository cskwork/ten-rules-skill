# IoT & Connected Devices — 10 Rules (index)

Source: Grounded in the AWS Well-Architected IoT Lens (docs.aws.amazon.com/wellarchitected/latest/iot-lens), Microsoft Azure IoT Reference Architecture (learn.microsoft.com/azure/architecture/reference-architectures/iot), OWASP IoT Top 10 (owasp.org/www-project-internet-of-things), OASIS MQTT v5.0 standard (docs.oasis-open.org/mqtt/mqtt/v5.0), IEC 62443 industrial cybersecurity series, and Claire Rowland et al., "Designing Connected Products: UX for the Consumer Internet of Things" (O'Reilly). Building software for IoT and connected devices means managing a physical-plus-cloud system where firmware runs on constrained hardware, millions of devices report telemetry continuously, and a security failure can cause real-world harm.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-secure-device-identity.md` | Every device gets a unique, hardware-rooted identity | device provisioning, certificate management, fleet onboarding, zero-touch enrollment |
| 02 | `02-ota-firmware-lifecycle.md` | OTA updates must be signed, atomic, and rollback-safe | firmware delivery, update pipelines, CI/CD for embedded, device reliability |
| 03 | `03-mqtt-telemetry-protocol.md` | Use MQTT QoS tiers deliberately; size payloads for constrained links | message broker design, telemetry ingestion, bandwidth budgeting, edge-to-cloud transport |
| 04 | `04-time-series-data-model.md` | Model telemetry as immutable time-series; never overwrite readings | sensor data storage, analytics pipelines, dashboards, anomaly detection |
| 05 | `05-edge-compute-offload.md` | Push latency-sensitive and bandwidth-heavy logic to the edge | real-time control, local alerting, offline operation, gateway design |
| 06 | `06-device-fleet-provisioning.md` | Automate zero-touch provisioning; treat device configs as code | mass deployment, factory flashing, DPS/cloud provisioning services, lifecycle management |
| 07 | `07-connectivity-resilience.md` | Design for intermittent connectivity from the first line of code | offline-first state sync, store-and-forward queues, reconnect logic, cellular or LoRaWAN links |
| 08 | `08-digital-twin-shadow.md` | Maintain a device shadow (digital twin) as the authoritative desired/reported state | device state UI, remote control, command acknowledgment, multi-app access |
| 09 | `09-owasp-iot-hardening.md` | Eliminate OWASP IoT Top 10 before a device ships; never rely on cloud-only controls | security review, pen test, physical port hardening, default credential removal |
| 10 | `10-regulatory-data-residency.md` | Know which regulations govern your device data before choosing a region | GDPR, CCPA, medical IoT (FDA, MDR), industrial safety (IEC 62443), data sovereignty |

Default for "building or reviewing a device-to-cloud telemetry pipeline": read 01, 03, 04, 07 at minimum.
