# Rule 09 — Ancillary and Upsell Merchandising

> 부가 서비스는 예약 맥락에서 투명하게 제안하고, 수수료는 절대 확인 단계에서 숨기지 마라.
> Present ancillaries transparently in booking context; never hide fees until the confirmation step.

## Why

Ancillary revenue (baggage, seat selection, meals, lounge access, travel insurance, hotel upgrades) represents 15–50% of total revenue for low-cost carriers and a growing share for full-service airlines and hotels. IATA's NDC ServiceList standard and the EU's Unfair Commercial Practices Directive both require that add-on fees be disclosed before the payment step, not revealed at checkout. The US DOT's Enhancing Airline Passenger Protections rules require upfront disclosure of baggage fees. Hidden fees are also the top driver of booking abandonment and negative reviews. The merchandising architecture must retrieve live ancillary prices from the airline's NDC ServiceList or hotel's PMS at the time of display, not from a stale cached lookup table.

## How to apply

- Retrieve ancillary offers from the supplier's live catalog (NDC ServiceList for airlines, PMS rate plans for hotels) at the moment the booking flow reaches the add-ons step; do not cache ancillary prices beyond the offer expiry.
- Display the total price including all mandatory fees at the first fare/rate display, not only at checkout; comply with EU and US regulatory requirements by making fees visible in the search result card.
- Present ancillaries in context of the traveler's itinerary: offer seat selection immediately after flight selection, baggage add-on before payment, not on a separate "manage my booking" page only.
- Model opted-in ancillaries as order items attached to the Order, not as ad hoc fields; this allows proper modification, cancellation, and refund calculations.
- Implement pre-tick opt-in suppression: no ancillary or travel insurance may be pre-selected by default (EU Directive 2011/83/EU, Package Travel Directive); the traveler must take an affirmative action to add it.
- Offer a clear "no thanks" path at every upsell step; dark-pattern dismissal buttons (very small, low-contrast, misleading labels) violate consumer protection law in the EU and UK.

## Checklist

- [ ] Total price including mandatory fees is shown on the search result, not only at checkout.
- [ ] No ancillary is pre-ticked by default; opt-in requires affirmative action.
- [ ] Ancillary prices are fetched from live supplier catalog, not a static lookup table.
- [ ] Opted-in ancillaries are modeled as Order items with their own modification/cancellation rules.
- [ ] "No thanks" / skip path is clearly visible and equally sized to the accept path.

## References

- IATA NDC ServiceList specification — https://www.iata.org/en/programs/airline-distribution/retailing/ndc/
- US DOT baggage fee disclosure rules — https://www.transportation.gov/airconsumer/fly-rights
- EU Unfair Commercial Practices Directive 2005/29/EC — https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32005L0029
- AltexSoft: Ancillary revenue and travel payments — https://www.altexsoft.com/blog/travel-payments-integration-otas/
