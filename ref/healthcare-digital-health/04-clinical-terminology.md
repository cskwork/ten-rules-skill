# Rule 04 — Clinical Terminology

> 임상 코드 없는 데이터는 재사용할 수 없다: SNOMED, LOINC, ICD-10, RxNorm을 원천부터 적용하라.
> Data without clinical codes cannot be reused: apply SNOMED, LOINC, ICD-10, and RxNorm from the source.

## Why

Healthcare data that uses free-text or proprietary codes cannot be aggregated, queried, billed, or safely exchanged. FHIR resources require coded values from recognized terminologies: SNOMED CT for clinical findings and procedures, LOINC for lab observations and vital signs, ICD-10-CM for diagnoses and billing, RxNorm for medication names and routes. A patient portal that stores "patient has diabetes" as unstructured text cannot populate a problem list, trigger a clinical decision rule, or satisfy meaningful use criteria. Coding errors also create billing fraud risk and care-continuity failures when records move between providers.

## How to apply

- Map every clinical concept to its canonical code system at point of capture: diagnoses to ICD-10-CM, clinical findings to SNOMED CT, lab results to LOINC, medications to RxNorm, procedures to CPT or SNOMED.
- Use the NLM Value Set Authority Center (VSAC) to select and pin value sets; record the version of each terminology used — terminologies release new versions annually and codes are retired.
- Implement display logic that shows the human-readable preferred term alongside the code; never show raw codes to patients.
- When accepting free-text clinical input from providers, run NLP-assisted code suggestion and require a coder or clinician to confirm the code before saving — do not store uncoded clinical data as the primary record.
- Maintain a terminology versioning policy: when a new ICD or SNOMED release ships, audit existing records for retired codes and remap before the new billing cycle.

## Checklist

- [ ] All diagnosis fields store ICD-10-CM codes, not free-text strings
- [ ] All lab observations store LOINC codes
- [ ] All medications store RxNorm codes
- [ ] Terminology version recorded alongside every coded value in the database schema
- [ ] NLM VSAC value sets in use; value set versions pinned in configuration

## References

- SNOMED CT — https://www.snomed.org/
- LOINC (Regenstrief Institute) — https://loinc.org/
- ICD-10-CM (CDC/NCHS) — https://www.cdc.gov/nchs/icd/icd-10-cm.htm
- RxNorm (NLM) — https://www.nlm.nih.gov/research/umls/rxnorm/index.html
