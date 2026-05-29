# Rule 05 — LCP Under 2.5 s and CLS Under 0.1 on Every Product Page

> 페이지 속도가 곧 매출이다. 1초 지연은 전환율 하락으로 직결된다.
> Every additional second of load time between 0 and 5 seconds costs 4.42% of conversion rate.

## Why

A Deloitte study for eBay showed that every 100 ms of LCP improvement correlated with a 1.11% increase in session-based conversion. Product pages that load in 2 seconds convert at 40–50% higher rates than equivalent pages at 4–5 seconds. CLS (Cumulative Layout Shift) above 0.1 causes price labels, "Add to Cart" buttons, and promotional banners to jump after the initial render — users click the wrong element or lose trust in the page. E-commerce pages are structurally performance-hostile: high-resolution product images, third-party review widgets, A/B testing scripts, and analytics tags all compete on the critical path. Google uses Core Web Vitals (LCP, INP, CLS) as ranking signals, making performance doubly important: it affects both the ranking position and the conversion rate of any traffic that does arrive.

## How to apply

- Serve product hero images in WebP or AVIF at the rendered dimensions; use `<img srcset>` for responsive sizes; add `loading="eager"` and `fetchpriority="high"` on the above-the-fold hero image.
- Reserve explicit width and height on every image and media element to prevent layout shift; use CSS `aspect-ratio` for responsive containers.
- Defer or async-load third-party scripts (analytics, chat, review widgets) that are not required for first render; use a tag manager facade if needed.
- Use a CDN for static assets and enable HTTP/2 or HTTP/3; set aggressive cache headers on product images (immutable, long TTL with content-hash in URL).
- Measure with real-user data (Google Search Console Core Web Vitals report, CrUX) not only lab tools; field and lab scores often diverge on image-heavy e-commerce pages.
- Set a performance budget in CI: fail the build if the Lighthouse LCP score for the product page template exceeds your threshold.

## Checklist

- [ ] LCP is under 2.5 s in the 75th-percentile field data (CrUX / Search Console).
- [ ] CLS is under 0.1; no price, button, or image shifts after initial paint.
- [ ] INP is under 200 ms; add-to-cart and quantity interactions respond quickly.
- [ ] Product hero image has `fetchpriority="high"` and is served in a next-gen format (WebP or AVIF).
- [ ] A Lighthouse or Web Vitals CI check exists and blocks deploys that regress the product page template.

## References

- Google web.dev — The business impact of Core Web Vitals — https://web.dev/case-studies/vitals-business-impact
- Google web.dev — Core Web Vitals — https://web.dev/explore/metrics
- Deloitte / Google — Milliseconds Make Millions (mobile speed and revenue) — https://www2.deloitte.com/content/dam/Deloitte/ie/Documents/Consulting/Milliseconds_Make_Millions_report.pdf
