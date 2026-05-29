# Rule 06 — Right-Size the Sample

> 표본 크기는 방법이 정한다. 정성은 5명, 정량은 통계가 요구하는 만큼.
> Sample size follows the method: about 5 for qualitative, statistically sufficient for quantitative.

## Why

Nielsen Norman Group's research shows ~5 users are enough for a qualitative usability test because each finds many of the same issues, while quantitative studies need far larger samples (NN/G suggests around 40+) to reach statistical confidence. Using 5 users to compute metrics, or 40 to run an exploratory diagnostic, wastes effort and misleads. The number is a consequence of the goal, not a default.

## How to apply

- For qualitative diagnostic testing, run about 5 users per round, then iterate rather than adding more.
- For quantitative metrics, size the sample for the desired confidence and margin of error (commonly 40+).
- Add participants when user groups are distinct: roughly 5 per distinct segment, not 5 total.
- Stop qualitative rounds when new sessions stop revealing new problems (saturation).
- State the rationale for n in the plan, tied to method and confidence target.

## Checklist

- [ ] Sample size is justified by method (qual vs quant), not by convenience
- [ ] Distinct user segments each receive adequate coverage
- [ ] Quantitative claims meet a stated confidence and margin
- [ ] Qualitative rounds run to saturation, then iterate

## References

- Nielsen Norman Group, Why You Only Need to Test with 5 Users — https://www.nngroup.com/articles/why-you-only-need-to-test-with-5-users/
- Nielsen Norman Group, Quantitative vs. Qualitative Sample Size — https://www.nngroup.com/articles/quant-vs-qual/
