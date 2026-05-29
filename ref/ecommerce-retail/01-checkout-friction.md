# Rule 01 — Minimize Checkout Friction

> 결제 단계는 줄일수록 매출이 늘어난다.
> Every additional step or field in checkout costs you a measurable percentage of orders.

## Why

Baymard Institute's research across 41,000+ hours of usability testing shows the average large e-commerce site can increase its checkout completion rate by 35% through better UX alone — the biggest lever is reducing form fields and eliminating forced account creation. Cart abandonment sits at roughly 70% industry-wide; the majority of avoidable abandonment happens because checkout feels long, confusing, or distrustful. Unlike generic web forms, checkout forms carry purchase anxiety: every unnecessary field is a reason to reconsider the transaction. The business impact is direct: one fewer required field at scale equals thousands of recovered orders per month.

## How to apply

- Offer guest checkout as the primary, visually dominant path; do not bury it behind account creation.
- Reduce address form fields to the minimum required for shipping: name, street lines, city, postal code, country. Remove redundant fields (e.g., separate "first" + "last" when a single "full name" suffices).
- Use address autocomplete (Google Places API or equivalent) to cut keystrokes; auto-fill city and state from postal code.
- Show a persistent order summary (product, price, shipping cost, total) visible on every checkout step, never hidden behind an accordion on mobile.
- Validate fields inline on blur, not on submit; surface the exact error next to the field, not in a banner at the top.
- After checkout completes, offer account creation with a single password field — never require it before purchase.

## Checklist

- [ ] Guest checkout is the first option presented, not secondary to "Sign In".
- [ ] Address form has 6 or fewer required fields (Baymard benchmark).
- [ ] Order summary with final total (including shipping and tax) is visible on every step.
- [ ] Inline field validation fires on blur with a specific, actionable error message.
- [ ] No redirect to a third-party page mid-checkout without a return guarantee and clear branding.

## References

- Baymard Institute — E-commerce Checkout Usability Research — https://baymard.com/research/checkout-usability
- Luke Wroblewski, *Web Form Design: Filling in the Blanks* — https://rosenfeldmedia.com/books/web-form-design/
- Nielsen Norman Group — Shopping Carts, Checkout & Registration Report — https://www.nngroup.com/reports/ecommerce-ux-shopping-carts-checkout-registration/
