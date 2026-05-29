# Rule 04 — Explainable Underwriting Decisions

> 자동화된 인수 결정은 규제 당국과 고객 모두에게 설명 가능해야 한다.
> Every automated underwriting decision must be explainable to both regulators and applicants.

## Why

Underwriting determines whether coverage is offered and at what price; an adverse decision (decline, surcharge, restricted coverage) is legally required to be explainable to the applicant under adverse action notice laws in most US states, and to regulators under the NAIC AI Model Bulletin. Using opaque ML models without explainability infrastructure creates regulatory exposure and fair lending / anti-discrimination liability. Regulators and industry bodies consistently find that interpretable models perform comparably to black-box alternatives on underwriting tasks while substantially reducing legal and compliance risk — transparency and accuracy are complementary, not in tension.

## How to apply

- For every underwriting decision, record the top contributing factors (e.g., "prior claims frequency", "credit-based insurance score") with their direction of effect; store alongside the decision record.
- When a model declines or prices adversely, generate a human-readable adverse action notice identifying the principal reason codes per state requirements.
- Version every underwriting model and rule set; never replace a model in production without logging the changeover date and keeping the prior version queryable for open investigations.
- Test models for disparate impact against protected class proxies before deployment; document results and retain for regulator review.
- Separate the decisioning engine (rules + models) from the data ingestion layer; this makes it possible to replay a historical application through the model version that was active at the time of decision.

## Checklist

- [ ] Every underwriting decision record includes model version, top factor codes, and direction of influence.
- [ ] Adverse action notices are generated automatically with jurisdiction-appropriate reason codes.
- [ ] Disparate impact testing on protected class proxies is documented and retained per model deployment.
- [ ] Historical decisions can be replayed against the model version active at the time of the original decision.
- [ ] The AI governance program per the NAIC AI Model Bulletin is reflected in operational controls: governance docs, risk management, third-party vendor oversight.

## References

- NAIC Model Bulletin on Insurers' Use of AI Systems — https://content.naic.org/insurance-topics/artificial-intelligence
- Quarles: Nearly Half of States Have Adopted NAIC AI Model Bulletin — https://www.quarles.com/newsroom/publications/nearly-half-of-states-have-now-adopted-naic-model-bulletin-on-insurers-use-of-ai
- AI Is Shaping the Future of Underwriting (American Academy of Actuaries) — https://actuary.org/publication-issue/ai-is-shaping-the-future-of-underwriting-fraud-detection-risk-management/
- *Insurance Technology: Navigating the Innovation, Risk, and Future of Insurance*, Steven Haynes (Elsevier, 2024) — https://www.amazon.com/dp/0443439729
