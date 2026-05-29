# Rule 01 — Define SLOs and Govern by Error Budgets

> 신뢰성을 측정 가능한 목표로 정하고, 오류 예산으로 출시 속도를 다스려라.
> Set reliability as a measurable target, and govern release velocity with an error budget.

## Why

You cannot manage reliability you do not measure. The Google SRE Book makes the SLO (a target on an SLI) the central control: the error budget is 1 minus the SLO, and it converts the abstract tension between shipping fast and staying up into one objective number both product and SRE agree on. 100% is the wrong target; the budget defines how much unreliability is acceptable, so you spend it deliberately on change.

## How to apply

- Pick a few user-centric SLIs (availability, latency, correctness) measured at the user's vantage point, not the server's.
- Set each SLO from what users actually need, then derive the error budget as 1 minus the SLO.
- Write an error-budget policy: when the budget is exhausted, freeze risky launches and redirect effort to reliability.
- Track burn rate, not just remaining budget; alert on fast burn before the budget is gone.
- Review SLOs quarterly as traffic and user expectations shift.

## Checklist

- [ ] Each critical service has at least one SLI/SLO with a defined measurement window
- [ ] Error budget is computed and visible to both product and engineering
- [ ] A written, pre-agreed error-budget policy governs what happens at exhaustion
- [ ] Burn-rate alerts exist and have been tested

## References

- Google SRE — Service Level Objectives — https://sre.google/sre-book/service-level-objectives/
- Google SRE Workbook — Implementing SLOs — https://sre.google/workbook/implementing-slos/
