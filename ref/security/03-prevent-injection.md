# Rule 03 — Prevent Injection by Separating Code from Data

> 코드와 데이터를 분리하라. 사용자 값은 명령이 아니라 매개변수로 넘겨라.
> Keep code and data apart; pass user values as parameters, never as commands.

## Why

Injection (SQL, NoSQL, OS command, LDAP, template) is ranked #3 in the OWASP Top 10 (2021); 94% of tested applications showed some form. The root cause is always the same: an interpreter cannot tell attacker data from intended code when the two are concatenated. Parameterization removes the ambiguity structurally.

## How to apply

- Use parameterized queries / prepared statements for all database access.
- Use safe ORMs or query builders; never string-concatenate user input into queries.
- For OS calls, avoid the shell; pass arguments as an array, not a command string.
- Use context-aware templating with auto-escaping to prevent template injection.
- Allowlist and validate any value that must appear in a query structure (e.g., sort column).
- Apply least-privilege DB accounts so a successful injection has limited blast radius.

## Checklist

- [ ] No query is built by concatenating untrusted strings.
- [ ] All SQL/NoSQL access uses bound parameters or a safe ORM.
- [ ] OS commands pass args as a list and avoid `shell=true` style execution.
- [ ] Template engines escape by default; raw/unescaped output is justified and reviewed.
- [ ] Database accounts hold only the privileges the app actually needs.

## References

- OWASP Top 10 (2021), A03 Injection — https://owasp.org/Top10/2021/A03_2021-Injection/
- OWASP Cheat Sheet Series (SQL Injection Prevention) — https://cheatsheetseries.owasp.org/
