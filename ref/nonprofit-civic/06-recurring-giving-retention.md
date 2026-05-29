# Rule 06 — Recurring Giving and Donor Retention

> 정기 후원자를 잃는 것은 단순한 취소가 아니라 평생 가치를 잃는 것이다
> Losing a recurring donor is not a cancellation — it is the loss of their lifetime value.

## Why

Recurring donors have a lifetime value three to five times higher than equivalent one-time donors and provide the predictable revenue that lets nonprofits plan multi-year programs. Failed payment recovery (involuntary churn) is the single largest preventable source of recurring donor loss — card expiry and issuer declines account for the majority of lapsed recurring gifts, not donor intent to cancel. A donor whose card fails and receives no proactive outreach defaults to lapsed; one who receives a timely, human-toned recovery email often updates their payment and stays for years. The technical systems supporting recurring giving therefore have direct mission impact.

## How to apply

- Implement an account updater service (Visa Account Updater, Mastercard Automatic Billing Updater) through your payment processor to auto-refresh stored card credentials before they expire.
- Build a dunning (failed-payment recovery) sequence: attempt retry on day 1, day 3, and day 7 with exponential backoff; send a donor-facing email after the first failure using empathetic, non-accusatory language.
- Provide a self-service payment update portal so donors can update cards, switch payment methods, or pause (not only cancel) their giving; reducing friction on pausing prevents outright cancellations.
- Surface a "giving anniversary" touchpoint in your CRM and send a thank-you with updated impact data on each annual anniversary of a recurring gift.
- Alert program staff when a high-value recurring donor ($500+/year) lapses; a personal phone call or email from a program lead recovers a significant fraction.
- Never make cancellation harder to find than sign-up — this creates legal liability and destroys trust when discovered.

## Checklist

- [ ] Account updater service enabled with the payment processor
- [ ] Automated retry logic with at least three attempts before marking a gift lapsed
- [ ] Donor-facing failed-payment email sends within 24 hours of first failure
- [ ] Self-service pause option available (not only cancellation)
- [ ] Giving anniversary touchpoint configured in the CRM

## References

- Bloomerang — "Nonprofit Fundraising Website Best Practices" — https://bloomerang.com/blog/nonprofit-fundraising-website-best-practices
- Fundraise Up — Recurring Giving and Donor Retention documentation — https://fundraiseup.com/blog/
- Nonprofit Leadership Alliance — "Optimizing the Donor Journey with Your Website" — https://nla1.org/optimizing-the-donor-journey/
- Charity Navigator — Culture & Community Beacon (donor engagement metrics) — https://www.charitynavigator.org/about-us/our-methodology/ratings/
