# Rule 02 — Model for the Business: Declare the Grain First

> 가장 먼저 사실 테이블의 입자(grain)를 선언하라.
> Declare the grain of your fact table before anything else.

## Why

Kimball's four-step design process puts declaring the grain second only to choosing the business process, and calls it the decision every dimension and fact depends on. A confused grain ("one row per what?") is the single most common cause of double-counted metrics and unjoinable tables. Get the grain right and the model becomes self-documenting; get it wrong and no amount of SQL rescues it.

## How to apply

- Follow Kimball's order: pick the business process, declare the grain, choose dimensions, choose facts.
- State the grain in one sentence: "one row per order line per day."
- Keep facts at the lowest practical (atomic) grain; aggregate in marts, not in the base fact.
- Build star schemas: narrow fact tables surrounded by conformed dimension tables joined on surrogate keys.
- Reuse conformed dimensions across processes so metrics align org-wide.
- Store additive numeric measures in facts; store descriptive context in dimensions.

## Checklist

- [ ] The grain is written as a single explicit sentence
- [ ] Every row in the fact table matches that grain exactly
- [ ] Facts hold measures; dimensions hold descriptive attributes
- [ ] Shared dimensions are conformed, not redefined per mart
- [ ] No mixed-grain measures live in the same fact table

## References

- Kimball Group — https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/kimball-techniques/dimensional-modeling-techniques/
- Building a Kimball dimensional model with dbt — https://docs.getdbt.com/blog/kimball-dimensional-model
