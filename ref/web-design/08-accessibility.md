# Rule 08 — Accessibility by Default

> 접근성은 별도 옵션이 아니라 완성도의 기본 조건이다.

## Why

WCAG 2.2 는 웹 접근성을 **Perceivable, Operable, Understandable, Robust** 4 원칙으로 정의한다. D&AD 의 Inclusive 카테고리도 나이·능력·상황과 무관한 디지털 경험을 평가한다. 더 많은 사용자가 더 적은 마찰로 쓰게 만드는 품질 기준이다.

## How to apply

- 색 대비: 본문 4.5:1, 큰 텍스트 3:1 이상.
- 모든 인터랙션 요소는 키보드만으로 사용 가능 + 가시 focus.
- 시맨틱 HTML 우선 (`button`, `nav`, `main`, `h1–h6`, `label/input`).
- 이미지 alt, 폼 label, 오류 메시지 명시.
- 확대(최소 200%) 시 콘텐츠 손실 없음.
- 터치 타깃 최소 24×24 (WCAG 2.2) / 권장 44×44.
- 자동 재생 / 무한 모션 제거.

## Checklist

- [ ] 키보드만으로 모든 화면 탐색 가능
- [ ] 대비 비율 통과 (Lighthouse / axe)
- [ ] 시맨틱 마크업 사용, ARIA 는 최후 수단
- [ ] 200% 확대 시 가로 스크롤 없음
- [ ] 터치 타깃 ≥ 24×24

## References

- WCAG 2.2 — https://www.w3.org/WAI/standards-guidelines/wcag/
- Accessible Responsive Design — https://web.dev/articles/accessible-responsive-design
