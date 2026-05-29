# Rule 06 — Rate Parity and Revenue Management Integration

> 모든 판매 채널의 요금은 원자적으로 동기화하라. 무음 불일치는 계약 위반이다.
> Synchronize rates across all channels atomically; a silent parity break is a contractual violation.

## Why

Hotels operating across direct website, OTAs (Booking.com, Expedia), metasearch (Google Hotel Ads, Trivago), and GDS channels are contractually bound to rate parity clauses with major OTAs. A rate displayed lower on one channel than another triggers OTA penalties, loss of ranking position, and potential contract termination. At the same time, dynamic pricing (adjusting rates in real time by demand, competitor pricing, and local events) is the primary revenue lever for hotels and airlines. The channel manager must push rate and inventory changes to all connected distribution channels within seconds; a 60-second lag during a demand spike can result in the hotel selling rooms below market rate on some channels while the correct rate has already taken effect on others.

## How to apply

- Use a channel manager that supports synchronous push to all connected OTAs and GDS channels with delivery confirmation; treat unconfirmed pushes as failures and alert on them.
- Model rates as a Revenue Management System (RMS) output, not a manually edited value; the RMS feeds the channel manager, which feeds all channels — human override is an exception path, not the default.
- Implement a rate parity monitoring job that scrapes or queries your top OTA and GDS channels hourly and compares published rates to your RMS source of truth; alert when the delta exceeds a configurable threshold (e.g., more than 1% or $1).
- When a parity break is detected, the automated remediation path should re-push the correct rate immediately, not wait for a human to notice; log every re-push with the channel, rate before and after, and timestamp.
- Distinguish between "best available rate" parity (OTA contractual) and "member rate" or "direct booking incentive" pricing (typically exempt from parity clauses); enforce these rules in the pricing engine, not in UI copy.
- For airlines, fare filing through ATPCO (Airline Tariff Publishing Company) is the source of truth for published fares; NDC offer pricing must reconcile with filed fares or be explicitly flagged as a private/negotiated fare.

## Checklist

- [ ] Channel manager confirms delivery of every rate/inventory update; unconfirmed updates trigger an alert within 5 minutes.
- [ ] Rate parity monitoring runs at least hourly across all contracted OTA channels.
- [ ] RMS is the authoritative source for rates; manual overrides are logged with approver and reason.
- [ ] Parity-exempt rate types (member rates, package rates) are documented and enforced at the data model level.
- [ ] Airline fare filings through ATPCO are reconciled with NDC offer pricing before publication.

## References

- SiteMinder: Hotel Rate Parity guide — https://www.siteminder.com/r/hotel-rate-parity/
- Mews: Hotel dynamic pricing strategies — https://www.mews.com/en/blog/dynamic-pricing-hotels
- ATPCO (Airline Tariff Publishing Company) — https://www.atpco.net/
- Cloudbeds: Rate parity definition and management — https://www.cloudbeds.com/articles/rate-parity/
