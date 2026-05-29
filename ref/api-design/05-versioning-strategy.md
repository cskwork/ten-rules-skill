# Rule 05 — Version Deliberately

> 버전은 신중하게, 변경은 드물게. 깨는 변경에만 새 버전을 부여하라.
> Version deliberately and change rarely; reserve a new version for breaking changes.

## Why

Versioning is the escape hatch for changes that compatibility rules (Rule 04) cannot absorb, but every parallel version is a maintenance and migration cost. Major API programs, Stripe, Google, Microsoft, treat a new version as a last resort and keep old versions running with a published deprecation timeline. Pick one versioning scheme and apply it consistently so consumers always know how to discover and pin a version.

## How to apply

- Default to compatible evolution; introduce a new version only for genuinely breaking changes.
- Choose one scheme (URI like `/v1`, or media-type `application/...+json;version=2`) and use it everywhere.
- Publish a deprecation policy: announce, set a sunset date, signal via `Deprecation`/`Sunset` headers.
- Keep the previous major version operational through the documented support window.
- Give clients a way to discover the current version and detect when they are calling a deprecated one.

## Checklist

- [ ] Only breaking changes trigger a version bump
- [ ] One versioning scheme is applied consistently across the API
- [ ] A written deprecation and sunset policy exists and is communicated
- [ ] Deprecated versions emit `Deprecation`/`Sunset` signals before removal

## References

- Stripe API versioning — https://docs.stripe.com/api/versioning
- Zalando RESTful API Guidelines — https://opensource.zalando.com/restful-api-guidelines/
