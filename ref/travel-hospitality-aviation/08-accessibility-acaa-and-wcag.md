# Rule 08 — Accessibility: ACAA and WCAG 2.0 AA

> 항공사·공항 디지털 서비스는 WCAG 2.0 AA를 준수해야 하는 법적 의무가 있다.
> Airline and airport digital services carry a legal obligation to meet WCAG 2.0 AA.

## Why

The US Air Carrier Access Act (ACAA) and the US DOT's 2015 rule explicitly require all airlines operating flights to/from the US — domestic and foreign — to conform to WCAG 2.0 Level AA across all core booking and travel-management functions. Core functions include: booking or changing a reservation, checking in, accessing an itinerary, checking flight status, accessing a frequent-flyer account, and viewing flight schedules. Non-compliance exposes airlines to DOT enforcement actions. For airports, ACI World's Airport Customer Experience Accreditation program and growing national legislation in the EU (European Accessibility Act, effective June 2025) extend comparable requirements to airport digital touchpoints. Approximately one in five travelers has some form of disability; inaccessible booking flows are also bad conversion.

## How to apply

- Audit all core booking surfaces against WCAG 2.0 AA success criteria before launch; use automated tools (axe, Lighthouse) for initial coverage but supplement with manual keyboard navigation testing and screen-reader testing (NVDA/VoiceOver).
- Ensure the seat-map component is fully keyboard-navigable and screen-reader-accessible; this is the single most common ACAA compliance failure on airline websites.
- Integrate a Special Service Request (SSR) form into the booking flow for passengers who need assistance at the airport (wheelchair, visual impairment, traveling with a service animal); the ACAA requires this form to be accessible and clearly linked from the booking confirmation.
- All time-limited sessions (seat holds, fare locks) must display a visible countdown and offer an accessible extension mechanism — a 60-second timeout with no warning fails WCAG 2.1 Success Criterion 2.2.1.
- For kiosks (airport check-in, hotel self-check-in): comply with ADA Standards for Accessible Design (reach range, audio output, braille labeling); these are hardware requirements, not just software.
- Include real users with disabilities in usability testing as required by the DOT rule; document testing sessions and findings as part of the compliance record.

## Checklist

- [ ] WCAG 2.0 AA audit completed for all six core ACAA-defined functions; results are documented.
- [ ] Seat-map UI passes keyboard navigation and screen-reader testing.
- [ ] SSR assistance request form is present, accessible, and linked from booking confirmation.
- [ ] Session timeout warnings meet WCAG 2.2.1 with accessible extension mechanism.
- [ ] Accessibility test with users with disabilities is scheduled before launch and after major UI changes.

## References

- US DOT Air Carrier Access Act — Nondiscrimination on the Basis of Disability in Air Travel (14 CFR Part 382) — https://www.ecfr.gov/current/title-14/chapter-II/subchapter-D/part-382
- Bureau of Internet Accessibility: ACAA and digital accessibility — https://www.boia.org/blog/the-air-carrier-access-act-acaa-and-digital-accessibility
- Deque: New digital accessibility regulations for air carriers — https://www.deque.com/air-carrier-access-act-update/
- WCAG 2.0 (W3C standard) — https://www.w3.org/TR/WCAG20/
