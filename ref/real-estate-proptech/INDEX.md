# Real Estate & PropTech — 10 Rules (index)

Source: Grounded in RESO Data Dictionary 2.0 and Web API standards (Real Estate Standards Organization, reso.org), NAR Internet Data Exchange (IDX) policy, HUD Fair Housing Act guidance, RESPA/TRID federal disclosure regulations, and industry references including "PropTech 101" by Aaron Block and Zach Aarons (2019, Lioncrest Publishing). Building real estate and proptech software means handling regulated MLS listing data, federally enforced fair-housing obligations, high-stakes financial transactions, and consumer trust at the moment of the largest purchase most users will ever make.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-reso-data-dictionary.md` | Conform to RESO field names and types | MLS feeds, IDX integration, listing data ingestion, search indexing |
| 02 | `02-fair-housing-compliance.md` | Never discriminate; audit every filter and algorithm | Search filters, tenant screening, ad targeting, algorithmic recommendations |
| 03 | `03-listing-data-freshness.md` | Surface listing status changes within minutes, not hours | Listing syndication, status badges, availability checks, cache TTL |
| 04 | `04-geospatial-search-ux.md` | Lead with map-first, polygon-draw search | Property search UI, map components, school-district filters, commute overlays |
| 05 | `05-avm-transparency.md` | Show AVM confidence range, not a single number | Price estimates, Zestimate-style widgets, valuation tools, investment calculators |
| 06 | `06-transaction-compliance.md` | Enforce RESPA, TRID, and state disclosure rules in every closing flow | Offer forms, earnest money, escrow integration, closing timeline, RON |
| 07 | `07-media-quality-virtual-tours.md` | Require high-res photos, floor plans, and virtual tours as first-class data | Listing detail pages, media upload pipelines, 3D tour embeds |
| 08 | `08-lead-capture-and-routing.md` | Route inquiries to the right licensed agent instantly | Contact forms, showing requests, chatbots, CRM webhooks, co-broke rules |
| 09 | `09-property-data-provenance.md` | Record the source, timestamp, and chain of custody for every data point | AVM inputs, tax records, permit data, ownership history, title search |
| 10 | `10-trust-and-fraud-prevention.md` | Authenticate listings, agents, and funds before money moves | Listing verification, agent license lookup, wire-fraud prevention, escrow identity |

Default for "building or updating a property search experience": read 01, 02, 03, 04 at minimum.
