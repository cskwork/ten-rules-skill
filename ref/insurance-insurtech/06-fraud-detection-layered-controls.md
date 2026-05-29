# Rule 06 — Fraud Detection Layered Controls

> 보험 사기는 단일 모델이 아닌 행동, 네트워크, 모델 기반 신호를 겹쳐야 막을 수 있다.
> Insurance fraud requires overlapping behavioral, network, and model-based signals — one layer is never enough.

## Why

Insurance fraud costs the US industry an estimated $300+ billion annually and directly raises premiums for honest policyholders. Fraudsters adapt to single-signal detection quickly; a rule that flags one pattern is bypassed by slightly varying the behavior. Digital-first platforms that automate claims create new attack surfaces (synthetic identities, AI-generated video, organized rings) that require multi-layer defenses. Lemonade's fraud architecture combines behavioral analysis, ML fraud scoring, and non-verbal cue analysis on video submissions — a model that works precisely because no single signal is decisive.

## How to apply

- Implement at minimum three independent fraud signal layers: (1) rules-based anomaly detection (duplicate claims, address mismatches, timing patterns), (2) ML model score trained on historical fraud labels, and (3) network/link analysis to detect organized rings sharing addresses, phones, or repair shops.
- At claims FNOL, compute a composite fraud score from all layers before routing to STP or human review queue.
- At underwriting, flag applications with mismatched identity data, prior policy cancellations for non-payment, or known fraud list matches.
- Maintain a feedback loop: adjuster fraud determinations must flow back to retrain ML models; stale models are worse than no model.
- Log all fraud signal inputs and scores with the claim/application record; these logs are required evidence if a denial is challenged in court.

## Checklist

- [ ] At least three independent fraud signal layers are active on claims intake (rules, ML score, network analysis).
- [ ] Composite fraud score is computed before any STP payment decision; score and contributing signals are persisted.
- [ ] Underwriting fraud screening checks identity consistency, prior cancellation history, and known fraud lists.
- [ ] Fraud adjudication outcomes feed back to model retraining pipeline on a defined cadence.
- [ ] Fraud signal logs are retained for the legally required period and are admissible as evidence (tamper-evident storage).

## References

- AI Is Shaping the Future of Underwriting, Fraud Detection, Risk Management (American Academy of Actuaries) — https://actuary.org/publication-issue/ai-is-shaping-the-future-of-underwriting-fraud-detection-risk-management/
- Lemonade "AI Jim" and fraud detection — How We Handle Claims (Lemonade blog) — https://www.lemonade.com/blog/claims-2/
- *Insurance Technology: Navigating the Innovation, Risk, and Future of Insurance*, Steven Haynes (Elsevier, 2024) — https://www.amazon.com/dp/0443439729
- *The INSURTECH Book*, VanderLinden et al. (Wiley, 2018) — https://www.oreilly.com/library/view/the-insurtech-book/9781119362210/
