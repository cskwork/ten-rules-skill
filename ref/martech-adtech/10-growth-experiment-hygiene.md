# Rule 10 — Growth Experiment Hygiene

> 통계적 유의성 없이 예산을 확대하는 것은 도박이다. 실험 기준을 먼저 정하고 검증 후 확장하라.
> Scaling spend without statistical significance is gambling; define experiment criteria before launch, validate lift with sufficient sample size, then and only then scale.

## Why

Sean Ellis and Morgan Brown's "Hacking Growth" (2017) codified the growth team model: cross-functional squads running rapid-tempo experiments with a structured hypothesis-test-analyze loop. The failure mode they document — and that remains endemic in MarTech — is teams launching experiments with inadequate sample sizes, calling winners after two days, and scaling budgets on noise rather than signal. In paid acquisition, this produces the "winner's curse": a campaign variant that appears to win in a small test fails to replicate at scale because the initial result was a statistical artifact. Because marketing spend is irreversible (you cannot reclaim budget spent on impressions), false positives are asymmetrically expensive.

## How to apply

- Calculate the required sample size before launching any experiment: use a power calculator with minimum detectable effect (MDE) of 5–10%, significance level of 95%, and power of 80%; reject tests that cannot reach sample size within the campaign flight.
- Assign users or geos to control and treatment groups before the experiment starts; do not re-randomize mid-flight.
- Define a single primary metric and up to two secondary guardrail metrics per experiment; do not report on 20 metrics and pick the one that moved.
- Enforce a minimum run duration of one full business cycle (typically 7–14 days for consumer campaigns) to control for day-of-week and recency bias.
- Log every experiment in a shared registry with hypothesis, design, results, and decision; this record prevents re-running already-invalidated ideas and builds organizational learning.

## Checklist

- [ ] Sample size calculated from power analysis before experiment launch
- [ ] Randomization performed before flight start; no mid-flight re-randomization
- [ ] Single primary metric declared; guardrail metrics limited to two
- [ ] Minimum run duration enforced (at least one full business cycle)
- [ ] Experiment results logged in shared registry with hypothesis and decision

## References

- Sean Ellis & Morgan Brown, "Hacking Growth: How Today's Fastest-Growing Companies Drive Breakout Success" (Crown Business, 2017) — https://www.penguinrandomhouse.com/books/545936/hacking-growth-by-sean-ellis-founder-of-growthhackerscom-and-morgan-brown/
- GrowthHackers.com (Sean Ellis's platform for the growth community) — https://growthhackers.com/
- Nielsen Annual Marketing Report 2023 (experiment-based spend validation) — https://www.nielsen.com/insights/2023/2023-annual-marketing-report/
