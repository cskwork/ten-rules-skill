# Rule 04 — Dynamic Pricing Transparency

> 요금 급등은 예고 없이 부과하는 순간 법적 분쟁과 환불 요청으로 돌아온다.
> Surge pricing applied without warning returns as legal disputes and refund requests.

## Why

Dynamic (surge) pricing is mathematically justified as a supply-demand equilibration mechanism, but regulators and courts treat undisclosed fare changes as deceptive trade practice. The FTC, the CPUC, and multiple state attorneys general have investigated or sanctioned ride-hailing platforms for opaque surge practices. Beyond compliance, transparent pricing reduces chargebacks: when riders see and explicitly confirm a surge multiplier before committing, dispute rates drop significantly because the rider accepted the price. Fare-lock features (price guarantee for 60 seconds after confirmation) are now an industry standard that builds trust and reduces abandonment.

## How to apply

- Display the surge multiplier (e.g., "2.1x") and the estimated total fare on the confirmation screen before the rider taps "Request"; never apply surge only in the receipt.
- Issue a fare lock token server-side at confirmation time; honor that price even if surge increases during the trip as long as the token is valid and unused.
- Implement a surge-acknowledgment flow for multipliers above a configurable threshold (e.g., 1.5x): require the rider to type or tap a confirmation before the request is placed.
- Log every fare computation with its inputs: base fare, distance, time, surge multiplier, promotions applied, tolls, and any rounding, so disputes can be reconstructed exactly.
- Expose fare-estimate and fare-breakdown endpoints in the developer API so that third-party MaaS aggregators can display accurate fares before deep-linking into your platform.

## Checklist

- [ ] Surge multiplier and estimated total shown before rider confirms the request.
- [ ] Fare lock token issued at confirmation; server honors the locked price.
- [ ] Surge acknowledgment step triggered above the configured threshold.
- [ ] Every fare stored with full computation inputs for audit and dispute resolution.
- [ ] Fare breakdown (base, distance, time, surge, tolls, promotions) available on receipt and via API.

## References

- Yan, Zhu, Korolko, Woodard — "Dynamic pricing and matching in ride-hailing platforms," Naval Research Logistics 67(8), 2020 — https://ideas.repec.org/a/wly/navres/v67y2020i8p705-724.html
- California CPUC Basic Information for TNCs — https://www.cpuc.ca.gov/-/media/cpuc-website/files/uploadedfiles/cpuc_public_website/content/licensing/transportation_network_companies/basicinformationfortncs.pdf
- "Pricing fast and slow: Limitations of dynamic pricing mechanisms in ride-hailing," Transportation Research Part C, 2025 — https://www.sciencedirect.com/science/article/abs/pii/S0968090X25003183
