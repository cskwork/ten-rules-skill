# Rule 07 — Content Authoring Pipeline (Separate Content from Delivery)

> 콘텐츠 구조와 렌더링 방식을 분리하면, 플랫폼이 변해도 콘텐츠는 살아남는다.
> Separating content structure from rendering means content survives platform changes.

## Why

EdTech content has a long lifecycle — a course built today may be delivered in a new LMS, on mobile, via voice assistant, or inside an AR environment five years from now. Coupling content to a specific renderer (React component tree, Articulate Storyline HTML, or proprietary rich-text blob) creates re-authoring debt and blocks localization. Institutions also need to import existing SCORM or IMS Common Cartridge content without re-authoring. A clean content model — structured JSON or XML representing learning objects, separate from the presentation layer — is what makes import, export, versioning, and multi-modal delivery tractable.

## How to apply

- Define a canonical content schema (learning object model): course > module > lesson > activity, each with a unique stable ID, metadata (title, locale, version), and a type-discriminated content body (video, text, quiz, interactive, etc.).
- Store rich-text lesson bodies as a structured document format (e.g., portable JSON block model, similar to Draft.js or Slate.js content state) not as raw HTML strings; render to HTML at delivery time.
- Support IMS Common Cartridge import/export so institutions can migrate content in and out without vendor lock-in.
- Version every content object independently; never overwrite — append a new version and let the course reference a specific version ID; instructors can publish a new version without affecting in-progress learners.
- Separate the localization layer: store all translatable strings outside the content body so a translation pipeline can operate on them without touching the structure.

## Checklist

- [ ] Content schema documented with stable IDs at every level (course, module, lesson, activity)
- [ ] Rich-text bodies stored as structured JSON, not raw HTML
- [ ] IMS Common Cartridge import tested with at least one third-party course file
- [ ] Content versioning implemented; updating a lesson creates a new version, not an overwrite
- [ ] Translatable strings extracted and stored separately from structural content

## References

- IMS Global — Common Cartridge 1.3 Specification — https://www.imsglobal.org/spec/cc/v1p3/
- ADL Initiative — SCORM content packaging — https://adlnet.gov/projects/scorm/
- IMS Global — IMS Common Cartridge Implementation Guide — https://www.imsglobal.org/cc/ccv1p3/imscc_Implementation-v1p3.html
