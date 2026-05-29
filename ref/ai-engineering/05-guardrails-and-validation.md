# Rule 05 — Put Guardrails on Inputs and Outputs

> 입력과 출력 양쪽에 가드레일을 둬라.
> Guard both the inputs and the outputs.

## Why

The model is an untrusted component embedded in your trusted system; its inputs can be adversarial (prompt injection, jailbreaks) and its outputs can be harmful, malformed, or leak data. The NIST AI RMF "Manage" function requires controls that contain these risks. Treat model I/O the way you treat any external boundary: validate, sanitize, and constrain.

## How to apply

- Validate model output against a strict schema and reject or repair non-conforming responses.
- Filter and classify inputs for injection, PII, and policy violations before they reach the model.
- Never pass model output directly into shells, SQL, file systems, or eval without sanitization.
- Constrain tool/function access with least privilege and allow-lists, not open-ended capability.
- Apply content safety classifiers on outputs for user-facing and high-reach surfaces.
- Fail closed: on guardrail violation, degrade to a safe default rather than the raw output.

## Checklist

- [ ] Output is schema-validated before any downstream use
- [ ] Inputs are screened for injection and sensitive data
- [ ] Tool/function access follows least privilege
- [ ] Guardrail violations fail closed to a safe path

## References

- NIST AI Risk Management Framework — https://www.nist.gov/itl/ai-risk-management-framework
- OWASP Top 10 for LLM Applications 2025 — https://genai.owasp.org/llm-top-10/
