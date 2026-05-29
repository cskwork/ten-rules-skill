# Rule 10 — Regulatory Compliance and Data Residency

> 클라우드 리전을 선택하기 전에 기기 데이터를 규율하는 규정을 파악하라
> Identify which regulations govern your device data before choosing a cloud region or data architecture.

## Why

IoT data is not generic application data: a smart meter reading is energy consumption PII; a connected medical device trace is protected health information; an industrial control system log may be subject to critical infrastructure protection law. Choosing the wrong cloud region after deployment requires migrating millions of records across borders, potentially violating GDPR data transfer restrictions. Medical IoT devices fall under FDA 510(k) premarket cybersecurity guidance and EU MDR, which mandate specific security controls documented before submission. Industrial devices in critical infrastructure must comply with IEC 62443 security levels, and failure can carry civil and criminal liability distinct from a typical software breach.

## How to apply

- Map each data type to its regulatory regime at the design phase: PII data (GDPR/CCPA), health data (HIPAA/EU MDR/FDA), energy metering (utility regulations), industrial control (IEC 62443, NERC CIP for energy), automotive (UNECE WP.29).
- Select cloud regions that satisfy data residency requirements before provisioning infrastructure; document the legal basis for any cross-border data transfer.
- Implement data classification labels at ingest so downstream pipelines can apply differential retention, encryption, and access controls per data type.
- For medical or safety-critical IoT, engage regulatory counsel and a notified body before finalizing the software architecture; retroactive changes to comply with FDA or MDR are extremely expensive.
- Audit third-party SDKs and cloud services used in the device or backend for compliance certifications (ISO 27001, SOC 2, HIPAA BAA, FedRAMP) before signing commercial agreements.

## Checklist

- [ ] Data classification map exists linking each data type to its governing regulation and required controls.
- [ ] Cloud region selection is documented with the legal basis for residency and any cross-border transfer.
- [ ] For health or safety IoT: regulatory submission strategy and timeline are defined before architecture is finalized.
- [ ] Third-party services hold required compliance certifications (SOC 2, ISO 27001, HIPAA BAA as applicable).
- [ ] Data retention and deletion policy satisfies the strictest applicable regulation (often GDPR right-to-erasure).

## References

- IEC 62443 Industrial Cybersecurity Standards Series — https://webstore.iec.ch/en/publication/7029
- OWASP IoT Top 10 Project — https://owasp.org/www-project-internet-of-things/
- AWS Well-Architected IoT Lens (Security Pillar) — https://docs.aws.amazon.com/wellarchitected/latest/iot-lens/iot-lens.html
- Microsoft Azure IoT Hub Architecture Best Practices — https://learn.microsoft.com/en-us/azure/well-architected/service-guides/azure-iot-hub
