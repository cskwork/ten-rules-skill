# Rule 03 — Make Pages Crawlable and Indexable

> 크롤링되고 색인되지 않으면 순위도 없다.
> No crawl, no index, no ranking.

## Why

Google must crawl a page, then index it, before it can rank — this is a hard gate, not an optimization. Pages blocked by robots.txt, marked noindex, hidden behind un-crawlable links, or buried by canonical conflicts simply do not appear. Google finds most pages by following crawlable links, so technical access is the precondition for every other SEO effort. Migrations and JavaScript-heavy sites fail here most often.

## How to apply

- Use crawlable `<a href>` links so Google can discover every important page.
- Keep robots.txt and `noindex` directives intentional; never block pages you want ranked.
- Submit an accurate XML sitemap and monitor coverage in Search Console.
- Set a clear canonical for each piece of content to consolidate duplicates.
- Ensure server-rendered or properly rendered content for JavaScript pages; verify with URL Inspection.

## Checklist

- [ ] Every important page is reachable via crawlable links from the homepage
- [ ] robots.txt and noindex do not block any page meant to rank
- [ ] An accurate XML sitemap is submitted and reports no critical errors
- [ ] Each canonical tag points to the intended representative URL
- [ ] URL Inspection confirms target pages are indexed and render correctly

## References

- Google Search Central — https://developers.google.com/search/docs/fundamentals/how-search-works
- Google Search Essentials — https://developers.google.com/search/docs/essentials
