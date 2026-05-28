# Rule 07 — Purposeful Motion

> 모션은 장식이 아니라 방향 안내와 감정 설계에 써야 한다.

## Why

Awwwards 의 Interactive 컬렉션과 D&AD Motion Design 카테고리는 모션을 “전환과 동적 요소로 UX 를 향상시키는 도구”로 정의한다. “움직이면 멋지다”가 아니라 **상태 변화, 계층, 인과, 브랜드 분위기**를 설명해야 한다.

## How to apply

- 모션 목적 분류: state change / spatial relationship / emphasis / brand mood / story progression.
- 지속시간 가이드: micro (80–150 ms) / macro (200–400 ms) / hero (≤ 600 ms).
- easing 은 자연 가속/감속 (ease-out for entry, ease-in for exit).
- 스크롤을 hijack 하지 않는다 — 사용자 통제 우선.
- `prefers-reduced-motion` 반드시 대응.
- 60 fps 미만이면 모션을 줄인다.

## Checklist

- [ ] 모든 애니메이션이 “왜 움직이는지” 설명 가능
- [ ] `prefers-reduced-motion` 대응 적용
- [ ] 모션이 클릭/스크롤을 방해하지 않음
- [ ] 60 fps 유지 (transform / opacity 기반)

## References

- Awwwards Interactive Web — https://www.awwwards.com/websites/web-interactive/
- D&AD Digital Experience Design — https://www.dandad.org/awards/d-ad-awards/categories/digital-experience-design
