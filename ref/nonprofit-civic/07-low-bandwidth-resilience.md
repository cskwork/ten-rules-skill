# Rule 07 — Low-Bandwidth and Inclusive Resilience

> 글로벌 NGO 사이트는 2G 연결과 저사양 기기에서도 작동해야 한다
> A global NGO site must function on a 2G connection and a low-end Android device.

## Why

International NGOs and civic tech platforms serve populations in regions where median mobile connections are 2G or early 3G, and where the primary device is a low-cost Android smartphone with 512 MB to 1 GB of RAM. A site optimized only for broadband US users is structurally inaccessible to many of the beneficiaries and field staff it is meant to serve. UNDP's Civic Tech guidance explicitly flags digital exclusion as a barrier to civic participation in low-income countries. ICT4D (Information and Communication Technologies for Development) research demonstrates that bandwidth constraints are not temporary — they persist for years in the regions where humanitarian need is greatest.

## How to apply

- Set a hard performance budget: total page weight under 200 KB for critical pages (home, donate, volunteer), no single resource over 50 KB uncompressed. Use tools like Lighthouse and WebPageTest on throttled 3G profiles.
- Serve images in modern formats (WebP, AVIF) with responsive `srcset` and lazy loading; provide a low-resolution fallback for browsers that do not support modern formats.
- Use a progressive enhancement strategy: the core content and donation functionality must be accessible without JavaScript; JS should enhance, not gate, the experience.
- Avoid autoplay video, large background images, and heavy animation on pages that field staff or beneficiaries are likely to access; provide a text-only mode toggle for critical information pages.
- Test the critical donation path on an actual low-end Android device (or BrowserStack Emulator set to a budget device profile) before each release.
- For offline-capable field tools (data collection, case management), implement a service worker with cache-first strategy so the app remains functional with intermittent connectivity.

## Checklist

- [ ] Critical pages pass Lighthouse performance score >= 75 on a Slow 3G throttle profile
- [ ] Total page weight under 200 KB for the homepage and donation page
- [ ] Core donation path functional with JavaScript disabled
- [ ] Images served in WebP/AVIF with appropriate fallbacks and lazy loading
- [ ] Tested on a low-end device profile (BrowserStack or physical device) before release

## References

- UNDP Asia-Pacific — "Civic Tech for Transparent, Inclusive, and Accountable Governance" — https://www.undp.org/asia-pacific/civic-tech
- ICTworks — "Understanding Basic ICT4D Ideas" — https://www.ictworks.org/basic-ict4d-concepts-student-guide/
- W3C — Accessibility Guidelines for Low-Bandwidth Environments — https://www.w3.org/WAI/
- Google Chrome — Lighthouse Performance Audits — https://developer.chrome.com/docs/lighthouse/performance/
