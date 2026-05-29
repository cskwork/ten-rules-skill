# Rule 09 — Bridge the Offer-to-Day-One Gap Without Data Re-Entry

> 입사 제안부터 첫 출근까지 후보자 데이터는 한 번만 입력되어야 하며 중복 입력은 허용되지 않는다.
> The data collected during recruiting must flow directly into onboarding and HRIS without requiring the new hire or HR to re-enter information they already provided.

## Why

The offer-to-day-one gap is where candidate experience most often breaks down. A new hire who spent 30 minutes on an ATS application and then receives a separate onboarding portal asking for the same name, address, and emergency contacts forms an immediate negative impression. More concretely, manual data re-entry between ATS and HRIS introduces errors in payroll setup, benefits enrollment, and background check triggers. Background check (BGC) vendors (Checkr, Sterling, HireRight) require a candidate record push from the ATS — if this is a manual step, BGC delays frequently cause start-date slippage, which has real cost in rescinded offers. The onboarding process is also where I-9 employment eligibility verification (U.S.) and right-to-work checks (UK) must be completed before day one, making it a compliance-critical handoff.

## How to apply

- Define a "hire trigger" event in the ATS (offer accepted + background check cleared) that automatically pushes the candidate record to the HRIS as a new employee record using the integration defined in Rule 04.
- At hire trigger, automatically initiate the background check via BGC vendor API, passing the candidate's consent token and data already in the ATS; never require HR to copy-paste into the BGC portal.
- Send the new hire a single onboarding task list pre-populated with their known data (name, start date, role, manager); ask only for information not yet collected (bank details, tax forms, emergency contacts).
- Model the onboarding task list as structured tasks with due dates, dependencies, and completion tracking — not a PDF checklist emailed to the new hire.
- Build a pre-boarding completion gate: the HRIS should not mark the employee as "Active" for payroll until I-9 / right-to-work documentation is verified.

## Checklist

- [ ] Offer-accepted event triggers automatic HRIS new employee record creation
- [ ] Background check initiated automatically via vendor API at hire trigger, no manual copy-paste
- [ ] New hire onboarding form pre-populated with data already in the ATS
- [ ] Onboarding tasks are structured records with due dates and completion tracking
- [ ] I-9 / right-to-work verification completion is required before payroll activation

## References

- "Recruit Rockstars" — Jeff Hyman (Lioncrest Publishing, 2017) — https://lioncrest.com/books/recruit-rockstars/
- USCIS I-9 Central (Employment Eligibility Verification) — https://www.uscis.gov/i-9-central
- Checkr Background Check API documentation — https://docs.checkr.com/
- IETF RFC 7644 (SCIM Protocol for provisioning) — https://www.rfc-editor.org/rfc/rfc7644.html
