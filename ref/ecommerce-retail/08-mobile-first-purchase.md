# Rule 08 — Thumb-Reachable Targets and Single-Tap Payment on Mobile

> 모바일 구매는 엄지손가락 한 번으로 완료될 수 있어야 한다.
> The majority of e-commerce traffic is mobile; a checkout that requires precision tapping or excessive scrolling loses that majority.

## Why

Mobile accounts for more than 60% of e-commerce traffic globally and is the dominant channel in markets such as Korea (Coupang), Southeast Asia, and emerging economies. Yet mobile conversion rates remain 2–3x lower than desktop, primarily because checkout forms, tap targets, and keyboard types are not optimized for thumb-driven one-handed use. Baymard Institute's mobile checkout research identifies keyboard mismatch (showing alphabetic keyboard for a numeric field) and small tap targets as top sources of mobile abandonment. Luke Wroblewski's *Web Form Design* establishes that input field placement, label proximity, and input type attributes are directly tied to form completion rates. Digital wallet payments (Apple Pay, Google Pay, Samsung Pay) short-circuit the entire address and card-entry flow and have been shown to increase mobile conversion by 10–15% in A/B tests when surfaced prominently.

## How to apply

- Set the correct `inputmode` or `type` attribute on every form field: `type="tel"` for phone numbers, `type="number"` for quantities, `inputmode="numeric"` for card numbers and postal codes, `autocomplete` tokens for every shipping and card field to trigger browser autofill.
- Make all interactive tap targets (buttons, links, checkboxes, quantity steppers) at least 44 x 44 CSS pixels — Apple's and Google's minimum recommended touch target size.
- Place the primary CTA ("Add to Cart", "Place Order") in the thumb zone: within reach of the bottom-center of the screen; do not force users to scroll to a button anchored above the fold.
- Offer Apple Pay / Google Pay as the first checkout option on supported devices; detect availability with the Payment Request API and surface the button before the manual form.
- Avoid modals and overlays that require precise dismissal; use full-page navigation or bottom sheets for mobile-specific flows.
- Test checkout on real devices at low-end specs (e.g., an Android mid-range phone on a 4G connection), not only on desktop DevTools device emulation.

## Checklist

- [ ] Every form field has the correct `type` or `inputmode` attribute; numeric fields show a numeric keyboard.
- [ ] `autocomplete` attributes are set on all shipping and payment fields.
- [ ] All tap targets are at least 44 x 44 CSS pixels with sufficient spacing.
- [ ] Apple Pay / Google Pay button is displayed when available, before the manual card entry form.
- [ ] Checkout is tested on a real mid-range Android or iOS device, not only desktop DevTools.

## References

- Baymard Institute — Mobile Checkout Usability — https://baymard.com/blog/mobile-checkout
- Luke Wroblewski, *Web Form Design: Filling in the Blanks* — https://rosenfeldmedia.com/books/web-form-design/
- Google web.dev — Payment Request API — https://web.dev/articles/payment-request-ux-best-practices
- Apple — Human Interface Guidelines: Buttons — https://developer.apple.com/design/human-interface-guidelines/buttons
