# Rule 02 — Write Clear, Structured, Specific Prompts

> 프롬프트는 명확하고 구조화되고 구체적으로 써라.
> Make prompts clear, structured, and specific.

## Why

The model only acts on what you actually said; ambiguity is the single largest source of bad output. Both the Anthropic and OpenAI prompt engineering guides converge on the same primitives: explicit instructions, role and context, delimiters, examples, and a defined output format. Clear prompts reduce variance, cost, and downstream guardrail load.

## How to apply

- State the task, audience, constraints, and success criteria explicitly; do not assume the model infers them.
- Separate instructions from data with delimiters (XML tags, fenced blocks) so the model parses boundaries.
- Give few-shot examples that show the exact format and edge cases you expect.
- Specify the output contract: schema, length, language, and what to do when uncertain.
- Prefer positive instructions ("respond in JSON with keys x,y") over negative ones.
- Iterate against the eval set from Rule 01, not against single anecdotes.

## Checklist

- [ ] Task, constraints, and output format are stated explicitly
- [ ] Instructions and input data are clearly delimited
- [ ] At least one representative example is provided where useful
- [ ] Behavior under uncertainty or missing input is defined

## References

- Anthropic Prompt Engineering — https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/overview
- OpenAI Prompt Engineering Guide — https://platform.openai.com/docs/guides/prompt-engineering
