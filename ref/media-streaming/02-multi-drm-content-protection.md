# Rule 02 — Multi-DRM Content Protection

> 모든 보호 콘텐츠에 Widevine, FairPlay, PlayReady를 동시에 적용하여 저작권을 지켜라.
> Protect every licensed asset simultaneously under all three major DRM systems.

## Why

Content licensing agreements from studios and rights-holders universally mandate DRM as a contractual condition of distribution. A single missing DRM system means a class of devices cannot play content legally, which either blocks users (hurting retention) or causes a license breach (risking contract termination). The three systems map to non-overlapping device ecosystems: Widevine (Google) covers Android, Chrome, and Chromecast; FairPlay (Apple) covers iOS, macOS, Safari, and Apple TV; PlayReady (Microsoft) covers Windows, Edge, Xbox, and many Smart TV chipsets. Multi-DRM is not optional for any production OTT platform with commercial content.

## How to apply

- Encrypt all protected segments using CENC (Common Encryption, ISO/IEC 23001-7) so the same encrypted byte stream is decryptable by Widevine, PlayReady, and FairPlay from a single encode.
- Integrate a multi-DRM license server (e.g., Axinom, EZDRM, BuyDRM) that issues Widevine, PlayReady, and FairPlay licenses from a single API endpoint keyed by content ID and entitlement token.
- Never store or log DRM license keys in application logs; route key requests through a dedicated key management service with audit logging.
- Include DRM initialization data (PSSH boxes for Widevine/PlayReady; EXT-X-KEY tags for FairPlay) in the manifest so the player can identify the correct DRM system without a round trip.
- Test each DRM system on its reference device class (Chrome desktop, Safari macOS, iOS, Android, Edge, Smart TV) before releasing a title.

## Checklist

- [ ] All commercial content segments are CENC-encrypted before reaching CDN cache.
- [ ] License server returns Widevine, FairPlay, and PlayReady licenses from the same entitlement token.
- [ ] DRM key IDs are rotated per title (or per season for series) and never reused across unrelated titles.
- [ ] License request URLs are HTTPS only; license tokens expire within a short window (15-30 minutes).
- [ ] Playback smoke tests run against all three DRM systems in CI before any catalog release.

## References

- ISO/IEC 23001-7, "Common Encryption in ISO Base Media File Format Files" (MPEG) — https://www.iso.org/standard/84637.html
- Widevine DRM documentation (Google) — https://developers.google.com/widevine
- FairPlay Streaming overview (Apple) — https://developer.apple.com/streaming/fps/
- W3C, "Encrypted Media Extensions" (EME specification, browser DRM integration) — https://www.w3.org/TR/encrypted-media/
