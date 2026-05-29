# Rule 08 — Standardize Job Schema for Multi-Channel Syndication

> 채용 공고는 표준 스키마로 구조화해야 모든 채용 플랫폼에서 정확하게 노출된다.
> Every job posting must be structured to schema.org/JobPosting so it syndicates correctly to Indeed, LinkedIn, Google for Jobs, and downstream aggregators without manual reformatting.

## Why

A job posting that lives only in an ATS database has no distribution. Enterprise customers expect their ATS to push openings to Indeed, LinkedIn, ZipRecruiter, and niche boards automatically. Each board has its own ingestion format, but all of them derive from schema.org/JobPosting (Google for Jobs requires it for rich search result eligibility). Without a canonical internal schema that maps cleanly to schema.org, every new board integration requires custom field mapping that breaks when the board changes its API. Poor structured data also degrades SEO on the employer's own career site, since Google's indexing of job postings depends on correct schema.org markup.

## How to apply

- Model the internal job posting entity to cover every required and recommended schema.org/JobPosting field: title, description, datePosted, validThrough, employmentType, hiringOrganization, jobLocation (or applicantLocationRequirements for remote), baseSalary, identifier.
- Emit JSON-LD in the `<head>` of every public job detail page automatically; validate against Google's Rich Results Test before launch.
- Build a board integration layer that translates from the canonical internal schema to each board's format; isolate board-specific logic in adapters so adding a new board requires only a new adapter, not changes to core posting logic.
- Treat job feed freshness as a reliability concern: stale or expired jobs left active on boards damage employer brand; implement automated feed reconciliation that closes jobs on boards within one hour of ATS closure.
- Support `applicantLocationRequirements` and `jobLocationType` = "TELECOMMUTE" for remote roles; Google for Jobs downgrades postings that omit these fields for remote jobs.

## Checklist

- [ ] Internal job entity maps to all required schema.org/JobPosting fields
- [ ] JSON-LD emitted on every public job detail page and passes Google Rich Results Test
- [ ] Board adapters isolated from core posting schema; core schema unchanged when adding new board
- [ ] Expired/closed jobs removed from all board feeds within one hour of ATS closure
- [ ] Remote job postings include applicantLocationRequirements and TELECOMMUTE jobLocationType

## References

- schema.org/JobPosting specification — https://schema.org/JobPosting
- Google for Jobs structured data documentation — https://developers.google.com/search/docs/appearance/structured-data/job-posting
- Google Rich Results Test — https://search.google.com/test/rich-results
- Indeed Publisher Program (XML feed specification) — https://opensource.indeedeng.io/api-documentation/docs/xml-feed-ia/
