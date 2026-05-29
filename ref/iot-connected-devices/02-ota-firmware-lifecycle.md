# Rule 02 — OTA Firmware Lifecycle

> 펌웨어 업데이트는 서명되고, 원자적이며, 롤백이 보장되어야 한다
> Firmware updates must be cryptographically signed, applied atomically, and guaranteed to roll back on failure.

## Why

A device that cannot be updated remotely becomes a permanently exploitable liability; a device that bricks during an update becomes an expensive truck roll. IoT fleets span geographies, environments, and intermittent networks, so partial or corrupted updates are a statistical certainty at scale. Unsigned updates create a trivial remote code execution vector — OWASP IoT Top 10 item I4 (Lack of Secure Update Capability) is one of the most commonly exploited weaknesses in fielded products. A/B partition schemes and differential patches are the industry-standard solution that cloud providers (AWS IoT Jobs, Azure Device Update for IoT Hub) are built around.

## How to apply

- Sign every firmware binary with a manufacturer private key; verify the signature on-device before applying using a stored public key in a read-only partition.
- Implement A/B (dual-bank) partitions: write the new image to the inactive bank, verify checksum and signature, then atomically swap the boot pointer. On boot failure, revert to the previous bank automatically.
- Use differential (delta) patches for bandwidth-constrained deployments (cellular, LoRaWAN, NB-IoT); transmit only changed blocks to reduce data costs.
- Stage rollouts using fleet cohorts (canary 1% -> 10% -> 100%); monitor error rates and device health metrics before advancing each stage.
- Report update status (idle / downloading / verifying / applying / success / rollback) to the device shadow so the platform has full observability into fleet update state.

## Checklist

- [ ] Firmware images are signed; devices reject unsigned or tampered images.
- [ ] A/B partition or equivalent rollback mechanism is in place and tested with a deliberately corrupted image.
- [ ] Update progress and outcome (including rollback events) are reported to the cloud.
- [ ] Staged rollout gates (canary cohort, metric threshold) are defined before any fleet-wide push.
- [ ] Delta patch pipeline reduces update payload size for bandwidth-limited links.

## References

- AWS IoT Jobs (OTA Update Service) — https://docs.aws.amazon.com/iot/latest/developerguide/iot-jobs.html
- Azure Device Update for IoT Hub — https://learn.microsoft.com/en-us/azure/iot-hub-device-update/
- Mender OTA Update Documentation — https://docs.mender.io/artifact-creation/create-an-artifact
- OWASP IoT Top 10 (I4: Lack of Secure Update Mechanism) — https://owasp.org/www-project-internet-of-things/
