# Rule 09 — Assessment Integrity

> 평가는 학습자의 실제 능력을 측정해야 한다. 부정행위를 막는 설계가 측정 도구의 일부다.
> Assessments must measure actual learner ability; designing against cheating is part of the measurement instrument.

## Why

Assessments are the primary signal for learner mastery, institutional transcripts, employer credentials, and accreditation compliance. A compromised assessment invalidates the credential it produces, exposes the platform to accreditation review, and — in regulated contexts such as professional licensure or academic credit — can constitute fraud. EdTech assessment integrity spans two distinct problems: preventing cheating (question randomization, time limits, proctoring) and ensuring valid measurement (avoiding question-bank leakage, aligning items to learning objectives, providing accessible accommodations).

## How to apply

- Randomize question and answer order from a pool per learner attempt; never serve the same fixed sequence to all learners in a cohort.
- Implement question bank versioning: tag each item with the learning objective it measures and track item exposure frequency; retire overexposed items before they circulate widely.
- For high-stakes assessments (certification, academic credit), enforce time limits enforced server-side (not just client-side); calculate elapsed time from server-recorded start timestamp.
- For remote proctoring, clearly disclose to learners what data is collected (webcam, screen, keystroke) before the session begins, and obtain explicit consent; this is a FERPA/COPPA disclosure requirement as well as a trust issue.
- Provide alternative assessment formats for accessibility accommodations (extended time, screen reader compatibility, oral examination option) configurable at the course or institution level without requiring learner self-disclosure per assessment.

## Checklist

- [ ] Question and answer order randomized from a pool; same sequence not repeated on retake
- [ ] Time limits enforced server-side from server-recorded start time
- [ ] Question bank items tagged to learning objectives; exposure frequency tracked
- [ ] Proctoring data-collection disclosure shown and consent recorded before any proctored session
- [ ] Accessibility accommodations (extended time, screen reader mode) configurable per learner or institution

## References

- IMS Global — QTI (Question and Test Interoperability) standard for assessment exchange — https://www.imsglobal.org/spec/qti/v3p0/
- W3C WCAG 2.2 — Accessible assessments — https://www.w3.org/TR/WCAG22/
- U.S. Department of Education — FERPA and assessment records — https://studentprivacy.ed.gov/ferpa
- Richard Mayer — Alignment of assessment items to learning objectives (Cambridge Handbook of Multimedia Learning) — https://www.cambridge.org/core/books/cambridge-handbook-of-multimedia-learning/A49922ACB5BC6A37DDCCE4131AC217E5
