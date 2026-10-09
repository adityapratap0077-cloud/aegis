---
name: aegis-audit
description: Security-audit a website with real scanners plus LLM review. Part of the Aegis pipeline (phase 2). Use when Aegis is auditing a built site.
---

# Aegis audit phase

## Ground truth rule

Scanners decide. Run `../../scripts/run-scanners.sh <site-dir>` first. It runs:

- `semgrep` with the default rulesets (secrets, injection, XSS patterns)
- `npm audit` on the project dependencies
- `pa11y` for accessibility violations on the built pages

An LLM may review the code afterward and suggest additional findings, but a finding only enters the report when a scanner confirms it or when you can reproduce it with a concrete check. An unconfirmed suspicion is not a finding.

## What to check

Use `../../references/owasp-checklist.md` as the coverage list: injection, broken access control, sensitive data exposure, XSS, security misconfiguration, vulnerable dependencies, and missing security headers. Check each item or mark it not-applicable with a reason.

## Boundaries

- Audit the built site in the project directory only. Do not probe deployed URLs, external services, or other people's infrastructure.
- Do not test against production data or real credentials. Use fixtures.
- Record the scanner versions and the commit or file state audited. An audit without a recorded target is not reproducible.
