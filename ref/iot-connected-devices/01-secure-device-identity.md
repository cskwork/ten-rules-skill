# Rule 01 — Secure Device Identity

> 모든 기기는 변조 불가능한 고유 신원을 가져야 한다
> Every device must carry a tamper-resistant unique identity before it joins any network.

## Why

IoT fleets can contain millions of physical nodes; if identity is shared or spoofable, a single compromised device can impersonate the entire fleet and inject false telemetry or receive malicious commands. Unlike web users who can re-authenticate interactively, a device in a wall or a shipping container must authenticate autonomously. Hardware-backed certificates (stored in a TPM, secure element, or HSM-provisioned key store) are the only mechanism that survives firmware extraction. The AWS IoT and Azure IoT Hub provisioning models both require per-device X.509 certificates or TPM endorsement keys as their trust anchors.

## How to apply

- Provision a unique X.509 client certificate per device at manufacture time; store the private key in a secure element or TPM — never in flash accessible to the application processor.
- Use a cloud Device Provisioning Service (AWS IoT DPS, Azure DPS) with a device certificate chain so zero-touch enrollment verifies hardware identity, not a shared secret.
- Rotate certificates on a scheduled cadence (yearly or after fleet-size thresholds); implement automated certificate renewal before expiry via MQTT or EST protocol.
- Revoke compromised device certificates immediately at the cloud CA level; do not rely solely on denying cloud connections.
- Maintain a device registry (AWS IoT Registry, Azure IoT Hub device registry) as the source of truth for all enrolled identities, metadata, and certificate thumbprints.

## Checklist

- [ ] Each physical device has a unique certificate with a unique Common Name (serial number or UUID).
- [ ] Private keys are stored in a hardware-backed secure enclave, not in application flash.
- [ ] Certificate expiry alerts and automated renewal are in place.
- [ ] Device revocation removes cloud access within minutes, verified by test.
- [ ] Provisioning pipeline is automated and auditable (no manual CSV imports in production).

## References

- AWS Well-Architected IoT Lens — https://docs.aws.amazon.com/wellarchitected/latest/iot-lens/iot-lens.html
- Microsoft Azure IoT Hub Architecture Best Practices — https://learn.microsoft.com/en-us/azure/well-architected/service-guides/azure-iot-hub
- OWASP IoT Top 10 (I1: Weak, Guessable, or Hardcoded Passwords) — https://owasp.org/www-project-internet-of-things/
- IEC 62443-4-2: Technical Security Requirements for Components — https://webstore.iec.ch/en/publication/34421
