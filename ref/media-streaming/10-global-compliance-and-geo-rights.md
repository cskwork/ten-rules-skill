# Rule 10 — Global Compliance and Geo-Rights

> 콘텐츠 라이선스 지역 제한과 연령 등급을 엣지에서 강제 적용하라.
> Enforce territorial licensing restrictions and age ratings at the CDN edge, not in application logic.

## Why

Content licensing agreements specify the exact territories in which a title may be played, often at the country or region level. Delivering content outside licensed territories is a contract breach that can result in financial penalties, license termination, and liability to rights-holders. Similarly, broadcasting age-inappropriate content to minors violates national broadcasting codes (e.g., UK OFCOM, German JMStV, South Korean KCSC) and platform rating rules imposed by app stores. Geo-rights enforcement cannot rely on application-layer checks alone because CDN caches and P2P delivery can bypass them; enforcement must happen at the token level and optionally at the CDN edge.

## How to apply

- Determine viewer territory from the IP geolocation of the playback token request (not from user-declared location or device locale), using an authoritative IP geolocation database (MaxMind GeoIP2 or equivalent); refresh the database at least monthly.
- Embed territory and content rating assertions in the signed playback token; the license server and CDN token auth system validate the token rather than re-resolving territory at each request.
- Use CDN geo-blocking rules as a secondary defense layer on top of token enforcement; configure the CDN to reject unsigned or geographically mismatched requests before they reach origin.
- Model licensed territories per content item in the catalog (see Rule 05); a single title may have different licensees in different regions and may be fully unlicensed in some countries — model this as an explicit deny, not an omission.
- Implement parental control profile enforcement: each user profile stores a maximum permitted age rating; the entitlement gate checks the profile's rating ceiling against the content rating before issuing a playback token. PIN-protect rating ceiling changes on profile settings.

## Checklist

- [ ] Viewer territory is resolved from IP geolocation at playback token request time; user-declared location is not used for rights enforcement.
- [ ] Licensed territory list is stored per content item in the catalog and explicitly denies unlicensed territories.
- [ ] Playback tokens carry signed territory and rating claims; license server validates claims.
- [ ] CDN geo-restriction rules provide a secondary enforcement layer independent of application tokens.
- [ ] Parental control rating ceiling is enforced at entitlement check time; changes are PIN-protected.

## References

- EIDR (Entertainment Identifier Registry), territory and rights metadata standards — https://www.eidr.org/
- MaxMind GeoIP2 database (IP geolocation) — https://www.maxmind.com/en/geoip2-databases
- OFCOM (UK), "Broadcasting Code" (age rating and watershed rules) — https://www.ofcom.org.uk/tv-radio-and-on-demand/broadcast-codes/broadcast-code
- EBU (European Broadcasting Union), "EBU Core Metadata Set" (rights and territory fields) — https://tech.ebu.ch/MetadataEbuCore
