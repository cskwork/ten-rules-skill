# Rule 08 — Meet Core Web Vitals and Page Experience

> 빠르고 안정적이며 반응하는 페이지가 좋은 페이지다.
> A fast, stable, responsive page is a good page.

## Why

Core Web Vitals (web.dev) quantify real-user experience through three metrics: Largest Contentful Paint (loading), Interaction to Next Paint (responsiveness, which replaced First Input Delay), and Cumulative Layout Shift (visual stability). Google treats page experience as a ranking signal, most decisive as a tie-breaker between comparable pages. Poor vitals frustrate users and raise bounce, undercutting otherwise strong content. Measure with field data, not just lab scores.

## How to apply

- Target the published thresholds: LCP under 2.5s, INP under 200ms, CLS under 0.1.
- Optimize LCP: compress and properly size images, defer non-critical resources, use efficient hosting.
- Improve INP: minimize and break up long JavaScript tasks; keep the main thread free.
- Prevent CLS: reserve space for images, ads, and embeds; avoid inserting content above existing content.
- Validate with field data (CrUX / Search Console), not lab tools alone.

## Checklist

- [ ] LCP, INP, and CLS meet Google's "good" thresholds on mobile
- [ ] Images are compressed and correctly sized
- [ ] Long JavaScript tasks are split to keep interactions responsive
- [ ] Layout-affecting elements reserve space to prevent shift
- [ ] Field data, not just lab scores, confirms the results

## References

- Core Web Vitals (web.dev) — https://web.dev/articles/vitals
- Google Search Central — https://developers.google.com/search/docs/appearance/page-experience
