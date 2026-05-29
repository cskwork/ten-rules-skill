# Rule 09 — OWASP IoT Hardening

> 기기 출하 전에 OWASP IoT Top 10을 제거하라; 클라우드 통제만으로는 충분하지 않다
> Eliminate the OWASP IoT Top 10 before a device ships; cloud-only controls cannot protect a physically accessible device.

## Why

IoT devices are physically accessible to end users and attackers in ways that cloud servers are not. An attacker who holds the device can extract firmware via UART debug ports, read keys from unencrypted flash, downgrade firmware, and pivot to the local network. OWASP IoT Top 10 documents the most commonly exploited weaknesses seen in real product security reviews; treating this list as a pre-ship checklist eliminates the majority of known attack surface. Critically, many of these weaknesses (hardcoded credentials, open debug ports, unencrypted storage) cannot be patched remotely after the device is in the field — they require hardware or firmware decisions made before manufacturing.

## How to apply

- Remove all default and hardcoded credentials before manufacture (OWASP I1); require unique per-device credentials provisioned at factory time.
- Disable or physically destroy UART, JTAG, and USB debug interfaces in production firmware builds; leave them accessible only on developer/QA hardware variants.
- Encrypt sensitive data at rest on device storage (keys, user credentials, configuration); use the secure element or hardware encryption engine where available.
- Disable all unused network services and close all unused ports on both the device and the local gateway; conduct a port scan as part of QA sign-off.
- Perform threat modeling (STRIDE or similar) before finalizing hardware design; late-stage security fixes in hardware are prohibitively expensive.

## Checklist

- [ ] No hardcoded or default passwords exist in shipping firmware (verified by automated scan).
- [ ] Debug interfaces (UART, JTAG) are disabled or fused in production builds.
- [ ] Sensitive data on device storage is encrypted.
- [ ] Unused network ports and services are closed (verified by port scan in QA).
- [ ] Threat model document exists and was reviewed before hardware design freeze.

## References

- OWASP Internet of Things Top 10 Project — https://owasp.org/www-project-internet-of-things/
- IEC 62443-4-2: Technical Security Requirements for IoT Components — https://webstore.iec.ch/en/publication/34421
- IEC 62443-4-1: Secure Product Development Lifecycle — https://webstore.iec.ch/en/publication/33615
- AWS IoT Security Best Practices — https://docs.aws.amazon.com/iot/latest/developerguide/security-best-practices.html
