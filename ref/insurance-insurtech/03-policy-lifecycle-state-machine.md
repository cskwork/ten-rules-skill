# Rule 03 — Policy Lifecycle State Machine

> 보험 증권은 단순 레코드가 아니라 법적 효력을 가진 상태 기계로 모델링해야 한다.
> An insurance policy must be modeled as a legally-consequential state machine, not a flat record.

## Why

A policy progresses through legally distinct states — quoted, bound, in-force, endorsed, lapsed, cancelled, reinstated, expired — and the rules governing data mutation, premium calculation, and claims eligibility differ at each state. Treating a policy as a mutable flat record leads to invalid state combinations (e.g., paying a claim on a lapsed policy), audit failures, and regulatory penalties. The policy administration system (PAS) is the system of record for this lifecycle, and every transition must be gated, logged, and reversible where regulations require it.

## How to apply

- Define an explicit state machine for each policy type with named states, legal transitions, and the business rules that guard each transition (e.g., binding requires approved form + payment authorization).
- Persist state transitions as immutable events (event sourcing pattern); never overwrite the previous state record.
- Calculate premium and coverage dates from the effective and expiration timestamps on the bound state; do not rely on wall-clock time at query time.
- Enforce that claims intake checks policy state — only in-force policies with matching coverage can generate payable claims.
- Support endorsements (mid-term changes) as a separate transaction type with pro-rata or short-rate premium adjustment; never modify the original bound record.

## Checklist

- [ ] Policy state machine is explicitly defined with all legal states and allowed transitions documented.
- [ ] State transitions are persisted as immutable events; no in-place overwrite of historical state.
- [ ] Claims processing validates policy state and coverage at time of loss before creating a claimable record.
- [ ] Endorsement transactions produce a new version record with adjusted premium; original policy version is preserved.
- [ ] Lapse, cancellation, and reinstatement logic implements jurisdiction-specific notice period and grace period rules.

## References

- Guidewire PolicyCenter (policy administration reference implementation) — https://www.guidewire.com/products/core-products/insurancesuite/policycenter-insurance-policy-administration
- *Insurance Technology: Navigating the Innovation, Risk, and Future of Insurance*, Steven Haynes (Elsevier, 2024) — https://www.amazon.com/dp/0443439729
- ACORD Data Standards (policy transaction schemas) — https://www.acord.org/standards-architecture/acord-data-standards
- *The INSURTECH Book*, VanderLinden et al. (Wiley, 2018) — https://www.oreilly.com/library/view/the-insurtech-book/9781119362210/
