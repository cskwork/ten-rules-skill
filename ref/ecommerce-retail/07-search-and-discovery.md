# Rule 07 — Faceted Search and Relevance Must Match Buyer Intent

> 검색과 필터는 구매자의 의도를 이해하고 정확한 결과를 즉시 보여줘야 한다.
> A shopper who cannot find the product cannot buy it; search failure is silent revenue loss.

## Why

Baymard Institute research shows that site search is used by 43% of e-commerce visitors on their first page visit, and these users convert at 2–3x the rate of browse-only visitors. Yet the same research found that the majority of large retail sites fail to handle even basic search queries correctly — mishandling product synonyms, failing to tolerate typos, or returning zero results for queries that have valid matches. Faceted filtering (filter by brand, size, price range, rating, availability) is the primary navigation tool for category pages with more than 20 products; without it, users face a wall of results and abandon. Unlike general web search, e-commerce search operates against a structured product catalog: the right architecture uses a dedicated search index (not SQL LIKE queries) with field-level boosting, synonym expansion, and availability filtering at query time.

## How to apply

- Use a dedicated search index (Elasticsearch, OpenSearch, Algolia, or equivalent) rather than full-table SQL text search; LIKE queries on large catalogs are too slow and too brittle for production e-commerce.
- Define a synonym dictionary for your catalog's domain terms (e.g., "sneaker" = "trainer" = "running shoe") and maintain it as a versioned configuration artifact.
- Implement typo tolerance: a query for "samgsung" should return Samsung products, not zero results.
- Build facets from the product attributes already in your data model; surface only facets relevant to the current result set (do not show a "Color" filter on a page where all results are colorless items).
- Handle zero-result pages with suggestions: did-you-mean corrections, broadened category links, or a curated fallback — never a dead end.
- Sort default results by a relevance signal that combines text match score, sales velocity, margin, and in-stock status; do not sort by database insertion order.

## Checklist

- [ ] Search is served from a dedicated inverted index, not SQL LIKE or ILIKE.
- [ ] Synonym list exists and is version-controlled; it covers the top 20 catalog ambiguities.
- [ ] Typo tolerance handles at minimum one-character edits for queries over 4 characters.
- [ ] Facets update dynamically based on the current result set; zero-count facet values are hidden.
- [ ] Zero-result pages offer at least one recovery path (did-you-mean, category suggestion).

## References

- Baymard Institute — Site Search UX Research — https://baymard.com/research/site-search
- Nielsen Norman Group — E-commerce Homepages, Category Pages, and Product Listing Pages — https://www.nngroup.com/articles/ecommerce-homepages-listing-pages/
- Elasticsearch — E-commerce Search Best Practices — https://www.elastic.co/guide/en/elasticsearch/reference/current/search-your-data.html
