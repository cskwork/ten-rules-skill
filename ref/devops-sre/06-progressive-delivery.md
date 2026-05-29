# Rule 06 — Deploy Progressively and Make Rollback Cheap

> 점진적으로 내보내고, 되돌리기를 싸게 만들어라.
> Roll out gradually, and make rollback cheap and fast.

## Why

A change that hits 100% of users at once turns a small defect into a full outage. Progressive delivery limits blast radius by exposing a new version to a small slice first, watching its real SLIs, then expanding only if it stays healthy. Canary releases (named for the coal-mine canary) and feature flags separate deployment from release, so you can disable a feature instantly without a redeploy. The Google SRE Workbook treats canarying as a core release-safety practice.

## How to apply

- Canary new versions to a small traffic percentage and compare error rate and latency against the baseline.
- Gate features behind flags so release is a config change, decoupled from deployment.
- Define automated promotion and automated rollback criteria tied to SLIs, not human eyeballing.
- Ensure rollback (or flag-off) is a single fast action rehearsed in advance.
- Bake changes long enough to catch slow-burn problems before full rollout.

## Checklist

- [ ] New versions reach production via canary or staged rollout, not all-at-once
- [ ] Risky features sit behind flags that can be disabled without a deploy
- [ ] Rollback criteria are defined and automated against SLIs
- [ ] Rollback has been rehearsed and completes quickly

## References

- Google SRE Workbook — Canarying Releases — https://sre.google/workbook/canarying-releases/
- DORA — Software Delivery Performance Metrics — https://dora.dev/guides/dora-metrics-four-keys/
