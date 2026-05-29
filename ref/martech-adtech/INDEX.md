# MarTech & AdTech — 10 Rules (index)

Source: Grounded in IAB Tech Lab OpenRTB 2.6 specification (iabtechlab.com/standards/openrtb), IAB Europe Transparency and Consent Framework v2.2/2.3 (iabeurope.eu/transparency-consent-framework), CDP Institute Buyer's Guide and Industry Reports (cdpinstitute.org), and Sean Ellis & Morgan Brown "Hacking Growth" (Crown Business, 2017). Building software for MarTech and AdTech means constructing systems that collect and activate customer data, buy and sell advertising inventory in real time, measure attribution across channels, and satisfy overlapping privacy regulations — all at web scale and under strict data contractual obligations.

Pick the rules that bear on the task, then open those files for the full Why / How / Checklist.

| # | File | Principle | Read when the task touches |
|---|------|-----------|----------------------------|
| 01 | `01-consent-signal-propagation.md` | Propagate consent signals before any data use | cookie banners, CMP integration, TCF, GDPR/CCPA compliance, user data collection |
| 02 | `02-first-party-data-ownership.md` | Own and activate first-party data as a strategic asset | CDPs, identity resolution, audience segmentation, cookieless readiness |
| 03 | `03-openrtb-bid-contract.md` | Honour the OpenRTB bid-request contract exactly | ad server, DSP/SSP integration, programmatic plumbing, bid logic |
| 04 | `04-identity-resolution.md` | Resolve identity across devices and channels deterministically | cross-device tracking, identity graphs, unified customer profiles |
| 05 | `05-attribution-and-incrementality.md` | Measure incrementality, not just last-touch credit | attribution models, campaign measurement, budget allocation, reporting |
| 06 | `06-ad-quality-and-brand-safety.md` | Enforce ad quality and brand-safety controls at ingestion | creative review, fraud detection, IVT, contextual targeting |
| 07 | `07-latency-budget-for-auctions.md` | Respect the auction latency budget end-to-end | bid response times, QPS handling, infrastructure sizing, timeouts |
| 08 | `08-data-activation-pipeline.md` | Design data pipelines for real-time activation, not batch ETL | audience activation, lookalike modeling, retargeting, data freshness |
| 09 | `09-revenue-and-yield-controls.md` | Instrument yield controls to protect inventory value | floor prices, header bidding, waterfall management, publisher monetisation |
| 10 | `10-growth-experiment-hygiene.md` | Run experiments with statistical rigour before scaling spend | A/B tests, growth loops, funnel analysis, budget scaling |

Default for "building or debugging a campaign management or audience targeting feature": read 01, 02, 04, 05 at minimum.
