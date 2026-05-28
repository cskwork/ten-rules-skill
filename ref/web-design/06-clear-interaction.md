# Rule 06 — Discoverable Interaction

> 인터랙션은 발견 가능하고, 피드백이 있고, 되돌릴 수 있어야 한다.

## Why

Don Norman 의 4 원칙: **affordance, signifier, mapping, feedback**. 사용자는 무엇이 클릭 가능한지 알아야 하고, 클릭하면 어떤 일이 일어나는지 예측할 수 있어야 하며, 행동 후 상태 변화를 볼 수 있어야 한다.

## How to apply

- 버튼은 버튼처럼, 링크는 링크처럼 보인다 (style ≠ semantics 금지).
- 모든 인터랙션 요소에 focus ring 제공 — 키보드 사용자 기본.
- 행동의 모든 상태를 디자인: idle / hover / loading / success / error / disabled.
- 위험한 행동(삭제·결제·전송)은 확인 + 되돌리기 경로 제공.
- 폼은 실수 “예방” 우선 — inline validation, 명확한 라벨, 기본값.

## Checklist

- [ ] 모든 클릭 가능 요소가 시각적으로 클릭 가능해 보임
- [ ] keyboard focus 상태가 명확하게 보임
- [ ] 로딩 / 성공 / 실패 상태가 정의되어 있음
- [ ] 파괴적 행동에 확인 또는 undo 가 있음

## References

- The Design of Everyday Things — https://jnd.org/books/the-design-of-everyday-things-revised-and-expanded-edition/
- Nielsen — 10 Usability Heuristics — https://www.nngroup.com/articles/ten-usability-heuristics/
