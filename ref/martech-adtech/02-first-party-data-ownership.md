# Rule 02 — First-Party Data Ownership

> 퍼스트파티 데이터는 광고 기술의 핵심 자산이다. 직접 수집하고 활성화하라.
> Treat first-party data as the core durable asset; collect, unify, and activate it directly rather than depending on rented third-party data.

## Why

Google's reversal on third-party cookie deprecation in Chrome (July 2024) did not eliminate the structural shift: Safari and Firefox have blocked third-party cookies since 2020, iOS App Tracking Transparency reduced mobile IDFA availability by over 60%, and regulators continue to restrict third-party data brokering. Brands that built first-party data programs through CDPs and direct customer relationships weathered these changes; those that relied on audience segments rented from data exchanges saw targeting accuracy collapse overnight. A Customer Data Platform (CDP) that unifies behavioral, transactional, and declared data into a persistent customer profile is now the operational prerequisite for any personalized marketing.

## How to apply

- Deploy a CDP (as defined by the CDP Institute: persistent, unified, individual-level profiles accessible to other systems) as the canonical source of customer identity.
- Build explicit value exchanges for data collection — loyalty programs, preference centers, gated content — rather than covert pixel-based collection that regulators target.
- Model your first-party data schema around stable identifiers (email hash, phone hash, CRM ID) rather than browser cookies or device IDs that expire or get blocked.
- Export audience segments from the CDP to ad platforms via secure server-to-server APIs (Meta CAPI, Google Enhanced Conversions, TikTok Events API) to bypass browser-side signal loss.
- Classify data by provenance (first-party collected, second-party shared, third-party purchased) in your data catalog; apply different retention and activation policies per class.

## Checklist

- [ ] CDP stores persistent, unified profiles keyed on stable first-party identifiers
- [ ] Data collection has a disclosed legal basis (consent or legitimate interest) per jurisdiction
- [ ] Audience exports to ad platforms use server-to-server APIs, not client-side pixels alone
- [ ] Data provenance is documented and policies differ by class (1P / 2P / 3P)
- [ ] Consent status from the CMP is written to the CDP profile in real time

## References

- CDP Institute Buyer's Guide — https://www.cdpinstitute.org/resources/customer-data-platform-buyers-guide/
- CDP Institute Industry Reports (biannual, free) — https://www.cdpinstitute.org/
- CDP Institute: What is a CDP (official definition by the organisation that coined the term) — https://www.cdpinstitute.org/what-is-a-cdp/
