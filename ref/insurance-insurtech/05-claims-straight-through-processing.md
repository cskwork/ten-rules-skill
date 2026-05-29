# Rule 05 — Claims Straight-Through Processing

> 보험금 청구는 커버리지 검증과 사기 심사를 통과한 후에만 자동 지급되어야 한다.
> A claim must pass coverage verification and fraud screening before any automated payment is issued.

## Why

Straight-through processing (STP) — fully automated claim resolution without human touch — is the competitive differentiator for digital insurers. Lemonade's AI Jim resolved 55% of claims end-to-end in seconds as of 2025, with 96% of first notices of loss (FNOL) handled without human intervention. However, speed without correctness destroys combined ratios: paying claims on ineligible policies, uncovered perils, or fraudulent submissions is a direct solvency risk. Every STP path must gate on policy state, coverage match, fraud score, and payment limit before releasing funds.

## How to apply

- Model the claims pipeline as a sequence of explicit, testable gates: FNOL intake → policy/coverage validation → fraud scoring → reserve setting → adjudication decision → payment authorization.
- Define a maximum STP payment threshold (e.g., claims under $X with fraud score below Y on in-force policy auto-pay); route everything above threshold to human adjuster queue.
- Integrate a fraud scoring step (see Rule 06) as a non-bypassable gate; a failed or timed-out fraud check must route to human review, never default to payment.
- Emit a structured event at each pipeline stage; use these events to drive reserve accounting, regulatory reporting, and customer notification.
- Test every STP decision path with synthetic claims including boundary conditions: lapsed policy, exclusion match, duplicate claim, inflated amount.

## Checklist

- [ ] Claims pipeline stages are defined as explicit gates with documented pass/fail criteria.
- [ ] Fraud scoring is a mandatory, non-bypassable gate; timeout or error routes to human queue, not auto-approval.
- [ ] STP payment authorization has a documented monetary threshold and fraud score floor that is configurable per product line.
- [ ] Each pipeline stage emits a structured event consumed by reserve accounting and regulatory reporting.
- [ ] STP paths are covered by automated tests including lapsed policy, excluded peril, and duplicate claim scenarios.

## References

- Lemonade "AI Jim" announcement — How We Handle Claims (Lemonade blog) — https://www.lemonade.com/blog/claims-2/
- *The INSURTECH Book*, VanderLinden, Millie, Anderson, Chishti (Wiley, 2018) — https://www.oreilly.com/library/view/the-insurtech-book/9781119362210/
- *Insurance Technology: Navigating the Innovation, Risk, and Future of Insurance*, Steven Haynes (Elsevier, 2024) — https://www.amazon.com/dp/0443439729
- ACORD Claims Transaction Standards — https://www.acord.org/standards-architecture/acord-data-standards
