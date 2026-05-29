# Rule 05 — Attribution and Incrementality

> 마지막 클릭 기여는 착각이다. 증분 효과를 측정하여 진짜 성과를 파악하라.
> Last-touch attribution is a fiction; measure true incremental lift through holdout experiments and media mix modeling, not rule-based credit assignment.

## Why

A 2023 Meta study of nearly 2,000 campaigns found that sophisticated observational attribution models produced errors in estimated ad effect ranging from 488% to 948% compared to randomized controlled trials. Rule-based attribution (last click, first click, linear) systematically over-credits bottom-funnel touchpoints that would have converted anyway, leading brands to over-invest in retargeting and under-invest in upper-funnel channels that actually drove demand. With third-party signal loss, multi-touch attribution that depended on cross-site cookie tracking is further degraded. Incrementality testing — randomly withholding ads from a holdout group and measuring the delta — is the only causal measurement method available to marketers.

## How to apply

- Run geo-holdout or user-holdout incrementality tests for every major channel before scaling budget; treat the measured lift as the channel's true contribution.
- Use Marketing Mix Modeling (MMM) as the top-down complement to bottom-up attribution: MMM captures offline, privacy-blocked, and view-through contributions that pixel-based models miss.
- Configure data-driven attribution in ad platforms (Google, Meta) only as a proxy; override with your own holdout results when they conflict.
- Report attributed revenue and incremental revenue as separate metrics in dashboards; never present attributed revenue as proof of incremental value to budget holders.
- Establish a testing cadence: major channels tested quarterly; new channels tested before any spend increase beyond initial pilot.

## Checklist

- [ ] At least one geo-holdout or user-holdout test run per major channel per quarter
- [ ] MMM model updated at least quarterly with offline and online spend inputs
- [ ] Dashboards distinguish attributed revenue from incrementally proven revenue
- [ ] Budget decisions require incrementality evidence, not just attribution reports
- [ ] Attribution methodology is documented and version-controlled

## References

- Google Ads Help: About data-driven attribution (official product documentation) — https://support.google.com/google-ads/answer/6394265
- Sean Ellis & Morgan Brown, "Hacking Growth: How Today's Fastest-Growing Companies Drive Breakout Success" (Crown Business, 2017) — https://www.penguinrandomhouse.com/books/545936/hacking-growth-by-sean-ellis-founder-of-growthhackerscom-and-morgan-brown/
- Nielsen Annual Marketing Report 2023 (media mix modelling industry benchmarks) — https://www.nielsen.com/insights/2023/2023-annual-marketing-report/
