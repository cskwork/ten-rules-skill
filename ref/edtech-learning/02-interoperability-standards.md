# Rule 02 — Interoperability Standards (xAPI / SCORM / LTI)

> 콘텐츠와 플랫폼은 표준 인터페이스로만 연결하고, 독자적인 통합을 만들지 않는다.
> Connect content and platforms only through standard interfaces; never build proprietary integrations.

## Why

EdTech buyers — schools, districts, universities, enterprises — operate multi-vendor LMS ecosystems. A product that requires custom integration work for every institution fails at procurement. SCORM packages content so any SCORM-compliant LMS can launch and track it. xAPI (Experience API, developed by ADL) records learning activity from any context — mobile, simulation, video — to a Learning Record Store (LRS). LTI (IMS Global Learning Tools Interoperability, now 1.3 / Advantage) enables secure, grade-passback tool embedding inside platforms like Canvas, Moodle, and Blackboard. Ignoring these standards means manual re-implementation for every buyer and blocks enterprise sales entirely.

## How to apply

- Package distributable course content as SCORM 1.2 or SCORM 2004 for maximum LMS compatibility; add xAPI statements for richer event tracking beyond completion and score.
- Implement LTI 1.3 Advantage for any tool that embeds into an LMS: use the platform's launch URL, handle the OAuth 2.0 PKCE flow, and pass grades back via the Assignment and Grade Services (AGS) extension.
- Expose an LRS endpoint or integrate with a third-party LRS (e.g., SCORM Cloud, Learning Locker) to store xAPI statements; never lock learning records in a proprietary schema only your platform can read.
- Validate SCORM packages with the ADL SCORM test suite before publishing; validate LTI launches with IMS Global's conformance test.
- Support OneRoster 1.1 or Ed-Fi for roster and course sync with district SIS (Student Information Systems) to automate enrollment.

## Checklist

- [ ] Exported content passes ADL SCORM conformance test
- [ ] LTI 1.3 launch, deep linking, and AGS grade passback verified against target LMS (Canvas, Moodle, or Blackboard)
- [ ] xAPI statements follow a published profile (ADL vocabulary) with actor, verb, and object populated correctly
- [ ] LRS stores statements and returns them via the xAPI State and Statement APIs
- [ ] Roster sync tested with a representative district SIS before institutional go-live

## References

- ADL Initiative — xAPI (Experience API) specification — https://adlnet.gov/projects/xapi/
- IMS Global Learning Consortium — LTI 1.3 Advantage — https://www.imsglobal.org/spec/lti/v1p3/
- ADL Initiative — SCORM (Sharable Content Object Reference Model) — https://adlnet.gov/projects/scorm/
- IMS Global — OneRoster 1.1 Specification — https://www.imsglobal.org/spec/oneroster/v1p1/
