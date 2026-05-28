# Rule 09 — Performance Is a Design Decision

> 성능은 개발 문제가 아니라 디자인 결정이다.

## Why

무거운 이미지, 과한 비디오, 불필요한 애니메이션, 복잡한 스크립트 — 디자인이 만든 성능 문제다. Google Core Web Vitals 기준:

| Metric | Good |
|--------|------|
| LCP (Largest Contentful Paint) | ≤ 2.5 s |
| INP (Interaction to Next Paint) | ≤ 200 ms |
| CLS (Cumulative Layout Shift) | ≤ 0.1 |

## How to apply

디자인 단계에서 정해야 할 것:

- 히어로 비디오는 정말 필요한가 → 대체 이미지/포스터 준비.
- 폰트는 weight 2~3 개로 제한, `font-display: swap`, 변수 폰트 고려.
- 이미지: WebP/AVIF, `srcset`/`sizes`, `loading="lazy"`, 폭/높이 명시(CLS 0).
- 위 fold 컨텐츠 우선 — defer non-critical CSS/JS.
- 애니메이션은 transform / opacity 만 사용.
- 3rd party 스크립트 예산 정의 (예: ≤ 3 개, ≤ 100 KB).
- 모바일 3G/4G 실측을 기준으로 한다 — Wi-Fi 만 보지 마라.

## Checklist

- [ ] Lighthouse Performance ≥ 90 (모바일)
- [ ] LCP / INP / CLS 모두 “Good” 통과
- [ ] 이미지에 width/height 또는 aspect-ratio 지정
- [ ] 폰트 / 3rd party 스크립트 예산 내

## References

- Core Web Vitals — https://web.dev/articles/vitals
