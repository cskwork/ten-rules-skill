# Rule 03 — Map Jobs and Candidates to a Standard Skills Ontology

> 직무와 후보자 역량은 표준 스킬 분류 체계에 맞춰 표현해야 일관된 매칭이 가능하다.
> Express every job requirement and candidate competency using a shared, versioned skills ontology so matching, search, and analytics are consistent across the platform.

## Why

HR tech platforms live or die on match quality. When job requirements and candidate profiles use ad-hoc, uncontrolled vocabulary — "Python" vs. "Python 3" vs. "Python programming" — search recall degrades, automated matching misfires, and analytics on skill gaps become meaningless. O*NET (U.S. Department of Labor), which profiles nearly 900 occupations and 55,000+ job titles, and ESCO (European Commission multilingual classification), are the two recognized public ontologies. Building a proprietary taxonomy from scratch without anchoring to one of these produces a system that cannot interoperate with job boards, government labor data, or partner HRIS platforms.

## How to apply

- Use O*NET-SOC codes as the canonical occupation backbone for U.S.-focused products; use ESCO occupation URIs for EU/multi-lingual products; maintain a crosswalk table for platforms operating in both regions.
- Normalize free-text job titles and skill tags to ontology identifiers at ingest time using an NLP normalization step; store both the raw input and the normalized ID.
- Version your internal skills taxonomy and record which O*NET/ESCO version it was derived from; plan for annual updates as DOL and European Commission release new versions.
- Surface the canonical skill label to users in the UI; store the ontology URI in the database so API consumers can integrate with external labor market data.
- For AI-powered matching, train or fine-tune models on ontology-structured data to reduce vocabulary mismatch; evaluate recall and precision per occupation cluster, not just overall.

## Checklist

- [ ] Job posting form maps to O*NET-SOC or ESCO occupation code at save time
- [ ] Skill tags normalized to ontology identifiers stored in the database
- [ ] Crosswalk table maintained between internal skill IDs and O*NET/ESCO URIs
- [ ] Ontology version recorded; update cadence scheduled annually
- [ ] Match quality evaluated per occupation cluster, not only as a global average

## References

- O*NET Resource Center, U.S. Department of Labor — https://www.onetcenter.org/
- O*NET-SOC Taxonomy — https://www.onetcenter.org/taxonomy.html
- ESCO (European Skills, Competences, Qualifications and Occupations), European Commission — https://esco.ec.europa.eu/en
- O*NET Skills Search and crosswalk tools — https://www.onetcenter.org/tools.html
