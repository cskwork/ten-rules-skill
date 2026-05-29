# Rule 02 — Donation Form Conversion

> 기부 양식은 단일 단계로, 필수 항목만 요청하라
> A donation form must be single-step and ask only for what processing requires.

## Why

Multi-step donation flows cause a 52% drop-off compared to single-step forms, according to conversion data aggregated across nonprofit platforms. More than 60% of nonprofit website traffic now originates from mobile devices, and a one-second load delay reduces conversions by up to 7%. Unlike e-commerce, donation intent is emotionally driven and fragile — any unexpected friction (extra form fields, page redirects, pop-up authentication) can break the impulse entirely. The only fields that must exist are those required to process the payment and issue a tax receipt.

## How to apply

- Limit the donation form to: amount selection, payment method, email address, and legal name (for tax receipts). Remove phone, mailing address, and birth date unless legally mandated.
- Offer three to five preset giving amounts anchored to real program costs (e.g., "$50 feeds a family for a week") plus a free-entry field; the middle preset should be the suggested amount.
- Make monthly/recurring giving the visually prominent default option, with one-time giving clearly available but secondary.
- Host the form on your own domain or a subdomain of it — never redirect donors to a third-party domain without a visible trust indicator (SSL lock, recognizable processor logo).
- Test page load time for the donation page on a throttled 3G connection; target under 3 seconds to first interactive.
- Provide a guest checkout path; requiring account creation before donating kills mobile conversions.

## Checklist

- [ ] Donation form completes in a single page or scroll without navigation away
- [ ] Fewer than seven visible fields at any point in the flow
- [ ] Preset amounts tied to concrete program costs with plain-language labels
- [ ] Recurring gift option present and visually prominent
- [ ] Form loads under 3 seconds on a throttled 3G simulation (Chrome DevTools)
- [ ] No account creation required to complete a one-time donation

## References

- Nielsen Norman Group — "Attracting Donors and Volunteers: Non-Profit and Charity Website UX" report (116 guidelines) — https://www.nngroup.com/reports/attracting-donors-and-volunteers-non-profit/
- Bloomerang — "Nonprofit Fundraising Website Best Practices" — https://bloomerang.com/blog/nonprofit-fundraising-website-best-practices
- Fionta — "Designing for Donor Engagement: UX Tips for Nonprofits" — https://fionta.com/insights/ux-for-nonprofits/
- iDonate — "Nonprofit Donation Page Basics: How to Optimize for More Donations" — https://www.idonate.com/blog/nonprofit-donation-page-basics-how-to-optimize-for-more-donations
