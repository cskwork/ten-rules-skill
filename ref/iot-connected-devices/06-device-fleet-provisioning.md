# Rule 06 — Device Fleet Provisioning

> 기기 프로비저닝은 자동화된 제로터치 파이프라인으로 처리하고 설정을 코드로 관리하라
> Automate zero-touch provisioning through a repeatable pipeline; treat device configuration as code.

## Why

Manually provisioning even hundreds of devices is error-prone and does not scale to thousands or millions. Inconsistencies in provisioning create security gaps (duplicated certificates, wrong policy assignments) and operational confusion (unknown firmware versions in the field). Zero-touch provisioning — where a device authenticates with a factory certificate and receives its final identity and configuration automatically — is the industry standard modeled by AWS IoT Device Provisioning Service and Azure IoT Hub DPS. Treating device configuration as code means the entire fleet state is reproducible, reviewable, and auditable.

## How to apply

- Implement a claim-certificate workflow: devices ship with a short-lived claim certificate that is exchanged for a unique operational certificate and device policy during first-boot registration.
- Store device configuration (desired state, feature flags, reporting intervals, endpoint URLs) as versioned config files in source control; deploy them through the device shadow or a configuration service, not manual console edits.
- Tag every device in the registry with structured metadata (firmware version, hardware revision, install location, tenant ID) at provisioning time; these tags drive fleet queries, update targeting, and billing attribution.
- Automate deprovisioning: retiring a device must revoke its certificate, delete its shadow, and emit an audit log entry — all in one pipeline step.
- Test the full provisioning flow in a staging fleet before every production release; one corrupted provisioning template can brick an entire batch.

## Checklist

- [ ] Zero-touch provisioning flow is documented and automated end-to-end.
- [ ] Claim certificates are short-lived and revoked after first successful registration.
- [ ] Device configuration is version-controlled and deployed through the shadow or config service.
- [ ] Device metadata tags are standardized and populated at provisioning time.
- [ ] Deprovisioning pipeline revokes credentials and cleans up cloud state atomically.

## References

- AWS IoT Device Provisioning Service — https://docs.aws.amazon.com/iot/latest/developerguide/iot-provision.html
- Azure IoT Hub Device Provisioning Service — https://learn.microsoft.com/en-us/azure/iot-dps/
- AWS Well-Architected IoT Lens — https://docs.aws.amazon.com/wellarchitected/latest/iot-lens/iot-lens.html
- Microsoft Azure IoT Reference Architecture — https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/iot
