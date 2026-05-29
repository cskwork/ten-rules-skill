# Changelog — 2026-05-30

## Add 22 industry-vertical rule sets ("world knowledge" tier) + refine 12 builder-stack sets

### What
Expanded the router from 17 to **39** "10 rules" reference sets by adding a new tier of **industry
verticals** — book-grounded rules for building sites/software *for a specific industry* (as opposed
to the existing cross-cutting engineering/product/design disciplines). Also re-researched and made
surgical improvements to the 12 in-repo builder-stack sets. Updated the router (SKILL.md) and the
landing page (docs/index.html) to represent all 39.

New industry verticals (slug — grounded in), 22 across four groups:

Consumer & commerce
- ecommerce-retail — Baymard, Nielsen Norman, PCI DSS v4, Schema.org, Core Web Vitals
- edtech-learning — Mayer (CTML), Make It Stick, CAST UDL 3.0, ADL SCORM/xAPI, FERPA/COPPA
- media-streaming — MPEG-DASH/HLS, CDN, recommender systems, subscription economics, DRM
- gaming-liveops — Koster, Schell, live-ops/retention, fair monetization, anti-cheat
- social-community — Andrew Chen (Cold Start), network effects, Santa Clara Principles, Kraut & Resnick

Enterprise & industrial
- enterprise-data-platform — Kleppmann (DDIA), ontology/Foundry, NIST RBAC/ABAC, DAMA-DMBOK, lineage
- manufacturing-industrial — ANSI/ISA-95, ISA/IEC 62443, OPC UA, MESA, RAMI 4.0, AAS
- logistics-supply-chain — ASCM SCOR, Goldratt (The Goal), WMS/TMS, EDI/GS1, track-and-trace
- b2b-saas — multi-tenancy, SOC 2, SAML/OIDC + SCIM, SaaStr metrics, usage metering
- iot-connected-devices — AWS/Azure IoT, MQTT, OTA, fleet provisioning, OWASP IoT
- energy-utilities — smart grid/AMI, IEC 61850, NERC CIP, demand response, GHG Protocol

Regulated
- fintech-banking — PCI DSS, PSD2/EBA SCA, FATF, double-entry ledger, idempotent payments
- healthcare-digital-health — HIPAA, HL7 FHIR R4, FDA SaMD, ONC Cures Act, NHS DCB clinical safety
- insurance-insurtech — NAIC, policy admin, automated underwriting, claims, ACORD
- govtech-public-sector — GOV.UK Service Standard, USDS Playbook, Section 508/WCAG, NIST 800-63

Travel & marketing
- travel-hospitality-aviation — IATA NDC, ACI ASQ, GDS/OTA booking, irregular-ops handling
- martech-adtech — IAB OpenRTB, CDP, attribution, IAB TCF/GDPR consent, cookieless
- real-estate-proptech — RESO/MLS, listing search, virtual tours, AVM, fair housing
- mobility-transportation — GTFS/GTFS-realtime, matching/dispatch, OCPP, dynamic pricing
- telecom-connectivity — TM Forum Open APIs/eTOM, OSS/BSS, 5G SBA, 3GPP charging
- hrtech-recruiting — ATS, EEOC bias-in-AI-hiring, GDPR employee data, SCIM/HRIS, ESCO/O*NET
- nonprofit-civic — fundraising UX, donor trust (Charity Navigator), WCAG, GDPR consent, impact reporting

Each set: `INDEX.md` + 10 prioritized rule files (Why / How to apply / Checklist / References). 242
new files. The 12 builder-stack sets received targeted edits (citation/accuracy refresh).

### Decisions and why
- **Verticals vs disciplines.** The existing 17 sets are *cross-cutting disciplines* (how to do API
  design, security, growth, etc.). The new ask was *industries* (Amazon, Palantir, Hynix, airports,
  schools). Modeled these as a distinct **Industry verticals** tier that layers ON TOP of the
  disciplines (e.g. online pharmacy = ecommerce-retail + healthcare-digital-health + data-privacy-legal),
  rather than diluting the discipline sets. Confirmed scale (encyclopedic 20+), the four industry
  groups, and "also refine existing" with the user before running.
- **Did NOT refine the 5 vendored core sets** (web-design, communication, investment, planning,
  coding). They are upstream snapshots pulled by `scripts/refresh.sh`; editing them in-repo would be
  overwritten on next refresh and diverge from source of truth. Refinement was limited to the 12
  in-repo builder-stack sets. Recommend upstream edits if the core sets need work.
- **Format = multi-file (INDEX + 10), bilingual per rule**, matching the builder-stack tier exactly,
  so progressive disclosure (load INDEX, then only the rules that apply) and the landing-page card
  pattern both keep working unchanged.
- **Grounding = each industry's recognized books and standards**, cited in each rule's References
  with canonical URLs. Spot-checked realism across 6 verticals: all real, precise (correct standard
  numbers, current 2024-2026 rulemakings). Adversarial verify agents fixed citations in place.
- **Landing page = a third compact-card tier** ("Industry verticals — twenty-two domains"), one
  card per vertical with the 10 rule titles and a click-to-expand bilingual "why", mirroring the
  builder-stack cards added on 2026-05-29. Count labels updated to 39 sets / 390 rules.

### How it was built
- **Workflow 1 (author + refine + verify):** pipeline over 34 chains (22 author + 12 refine), each
  stage-1 agent web-searched to confirm authorities then wrote/edited files, each followed by an
  adversarial stage-2 verify agent that checked format, bilingual maxims, emoji, and citation realism
  and fixed in place. The final landing-page designer agent within this run authored the verticals'
  CSS accent colors but failed at the StructuredOutput return step (the workflow surfaced an error),
  so the HTML card markup and count labels were not added by it.
- **Recovery:** verified on disk that all 242 files were written correctly (0 format/maxim/emoji
  issues; refined sets intact). The dangling vertical CSS was already present and correct.
- **Workflow 2 (vertical cards):** 22 parallel agents (no output schema, to avoid the prior failure
  mode) each read a vertical's 11 files and wrote a self-contained `<article>` card to /tmp; the main
  loop then validated all 22 (class, 10 rules, csrc slug, no emoji), spliced them into a new tier in
  docs/index.html after the builder-stack grid, and applied the 9 count-label edits.
- Builder/author/verify agents ran on Sonnet to manage cost across ~90 total agents.

### Verification
- Structure: `ref/` has 39 domains; all 22 new verticals have INDEX + 10 rule files (242 files);
  every new rule file has Why / How to apply / Checklist / References and a bilingual maxim
  (Hangul line + English line). 12 refined builder sets keep 10 rule files each, all sections intact.
- No emojis anywhere (the `→` arrow is pre-existing house style, also used in untouched core sets).
- Citations spot-checked across ecommerce, fintech, manufacturing, travel, edtech, healthcare — all
  real authorities with correct canonical URLs.
- Landing page: balanced tags (div 129/129, article 39/39, details 390/390, ol 39/39, section 4/4,
  one html/body/script); 22 vertical cards each present once; no stale "17 / 170 / seventeen" labels;
  0 emojis.
- SKILL.md: description + intro + new Industry-verticals routing table (22 rows) + Notes + Source
  repos section updated.

### Known follow-ups
- Pre-existing typo in the data-privacy-legal landing card (line ~760): "모지 않은" should read
  "모으지 않은". Introduced by an earlier commit, unrelated to this change — left untouched pending
  user confirmation.
