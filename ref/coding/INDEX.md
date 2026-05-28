# Coding Agent — Ten Commandments (index)

Source: `github.com/cskwork/coding-agent-rules`. A drop-in AGENTS.md / CLAUDE.md operating
contract for any coding agent (Claude Code, Codex, Gemini CLI, Cursor, …).

> Note: these are already present in `~/.claude/CLAUDE.md` on this machine. Inside Claude Code,
> prefer those. Read `ten-commandments.md` here only when explicitly asked, or when running an
> agent that does not load that CLAUDE.md.

| # | Commandment |
|---|-------------|
| 01 | Understand first — restate problem, goal, area, expected outcome |
| 02 | Surface uncertainty; offer options |
| 03 | Keep units small and cohesive (≤50-line fns, ≤4 nesting) |
| 04 | Explore, then plan in small verifiable steps |
| 05 | Keep changes surgical — touch only what the task needs |
| 06 | Reuse before reinventing; choose simplicity |
| 07 | Fix root causes, not symptoms |
| 08 | Test before trusting (failing test → minimal fix → pass) |
| 09 | Verify before claiming done — run tests/lint/build, report evidence |
| 10 | Protect the system — side effects, secrets, destructive ops |

Full text (plus Response Style + Repository Rules) is in `ten-commandments.md`.
