# Rule 05 — Accessibility and Universal Design for Learning

> 모든 학습자가 같은 콘텐츠에 다양한 방식으로 접근할 수 있어야 한다.
> Every learner must be able to access the same content through multiple means of representation and interaction.

## Why

WCAG 2.2 AA is the accessibility floor for any web-based learning product; U.S. Section 508, the ADA, and equivalent laws in the EU and UK make WCAG compliance a legal requirement for products sold to educational institutions. Beyond legal minimum, CAST's Universal Design for Learning (UDL) Guidelines 3.0 provide a broader framework: offer multiple means of Representation (what), Action and Expression (how), and Engagement (why). Accessibility failures in EdTech are disproportionately harmful because they exclude the learners who most need educational tools — those with visual, hearing, motor, or cognitive disabilities.

## How to apply

- Meet WCAG 2.2 AA for all UI: minimum 4.5:1 contrast ratio for body text, 3:1 for large text and UI components, keyboard-navigable focus order, no keyboard traps, ARIA roles on custom components.
- Caption all video content (minimum 99% accuracy; auto-captions alone do not meet this); provide transcripts for audio-only content; provide audio descriptions for video where visuals carry information not in the narration.
- For assessments, provide extended time settings at the platform level (configurable by instructor or institution) without requiring learners to self-identify a disability to every individual course.
- Apply UDL Representation: offer content in at least two formats (e.g., video + written summary); allow font size and contrast adjustment without breaking the layout.
- Apply UDL Action and Expression: do not require a single response format (e.g., typed text only); where the learning objective permits, accept audio, drawing, or selection-based responses.

## Checklist

- [ ] Automated accessibility scan (axe-core or equivalent) passes with zero critical violations on all page templates
- [ ] All video has closed captions at >= 99% accuracy; transcripts published alongside audio-only content
- [ ] Keyboard-only navigation tested end-to-end through course launch, lesson completion, and quiz submission
- [ ] Extended time accommodation configurable by instructors at course or platform level
- [ ] Color is never the sole indicator of meaning (e.g., correct/incorrect answer feedback includes icon or text label)

## References

- W3C Web Accessibility Initiative — WCAG 2.2 — https://www.w3.org/TR/WCAG22/
- CAST — Universal Design for Learning Guidelines 3.0 — https://udlguidelines.cast.org/
- CAST — About Universal Design for Learning — https://www.cast.org/resources/about-universal-design-for-learning/
- U.S. Access Board — WCAG 2.2 Now Available — https://www.access-board.gov/news/2023/11/27/w3c-wcag-2-2-now-available/
