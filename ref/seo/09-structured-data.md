# Rule 09 — Add Valid Structured Data

> 기계가 읽을 수 있게 표시하면, 기계가 너를 보여준다.
> Mark it up so machines can read it, and machines will surface you.

## Why

Structured data using the schema.org vocabulary describes a page's entities in a machine-readable form, making content eligible for rich results and reinforcing entity understanding and trust. Google recommends JSON-LD and supports specific types (Article, Product, FAQ, Recipe, Organization, and more). Markup must describe content actually visible on the page; invalid or deceptive markup forfeits eligibility and can draw a structured-data manual action.

## How to apply

- Implement structured data in JSON-LD using schema.org types relevant to the page.
- Mark up only content that is visible to users on the page.
- Choose types Google supports for the rich result you want, and supply all required properties.
- Validate with the Rich Results Test and monitor enhancement reports in Search Console.
- Keep markup accurate as content changes; never mark up misleading or absent information.

## Checklist

- [ ] Structured data uses JSON-LD with appropriate schema.org types
- [ ] Markup reflects only content visible on the page
- [ ] All required properties for the target rich result are present
- [ ] The Rich Results Test passes without errors
- [ ] Search Console reports no structured-data errors or manual actions

## References

- schema.org — https://schema.org
- Google Search Central — https://developers.google.com/search/docs/appearance/structured-data/intro-structured-data
