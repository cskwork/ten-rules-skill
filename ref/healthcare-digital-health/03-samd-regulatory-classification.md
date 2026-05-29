# Rule 03 — SaMD Regulatory Classification

> 기능을 구현하기 전에 규제 분류를 먼저 결정하라: 임상 의도가 있는 소프트웨어는 의료기기다.
> Determine regulatory classification before implementing a feature: software with clinical intent is a medical device.

## Why

The FDA defines Software as a Medical Device (SaMD) as software intended for medical purposes that operates independently of a physical device. A feature that diagnoses a condition, recommends a treatment, or is used to make clinical decisions can classify the entire product as a Class II or Class III medical device, requiring 510(k) clearance or De Novo authorization before deployment. Building first and classifying later is the most expensive mistake in digital health: it requires retrospective design controls, risk documentation, and potential market withdrawal. The FDA's 2025 AI/ML-enabled SaMD guidance adds lifecycle management obligations for adaptive algorithms.

## How to apply

- Before any feature enters design, answer the FDA's intended-use question: does this software fulfill a medical purpose (diagnose, treat, cure, mitigate, or prevent)? If yes, apply SaMD classification using the IMDRF SaMD framework (four-category risk matrix based on significance of information and healthcare situation).
- Maintain a Software Bill of Materials (SBOM) and Design History File (DHF) from day one for any feature that may be or become SaMD; retrofitting these documents after the fact is significantly harder.
- Apply IEC 62304 (medical device software lifecycle) to your development process: define software items, establish a defect classification system (Class A/B/C), and maintain traceability from requirements to test cases.
- For AI/ML features, follow the FDA's 2025 draft guidance on predetermined change control plans (PCCPs) so that model retraining does not require a new marketing submission for each update.
- Clearly document features that are explicitly NOT intended for clinical decision-making (general wellness, administrative workflow) to establish the boundary of SaMD scope in regulatory records.

## Checklist

- [ ] Intended-use statement written and reviewed by a regulatory professional for every clinical-facing feature
- [ ] IMDRF category assigned and documented in the DHF
- [ ] IEC 62304 software item classification (Class A/B/C) applied to each component
- [ ] Design History File initialized; requirements traceable to test cases
- [ ] AI/ML features have a predetermined change control plan if retraining is planned post-market

## References

- FDA Software as a Medical Device (SaMD) — https://www.fda.gov/medical-devices/digital-health-center-excellence/software-medical-device-samd
- FDA AI/ML-Enabled Device Software Functions: Lifecycle Management (2025 Draft Guidance) — https://www.fda.gov/medical-devices/software-medical-device-samd/artificial-intelligence-and-machine-learning-aiml-enabled-medical-devices
- IEC 62304 Medical Device Software Lifecycle Processes — https://www.iso.org/standard/38421.html
