---
name: aegis-fix
description: Propose and apply fixes for audit findings, human-gated by default. Part of the Aegis pipeline (phase 4). Use when Aegis is fixing reported issues.
---

# Aegis fix phase

## Default mode: propose

For each finding in the report, write the diff that fixes it. Present the diffs and stop. The human approves each one before anything is applied. Never apply a fix the human has not approved.

## Opt-in auto-fix

Auto-fix runs only when the user sets `AEGIS_AUTOFIX=1`, and only for the safe category:

- Security headers (CSP, HSTS, X-Frame-Options, and similar)
- Dependency bumps to patched versions
- Output escaping and parameterized queries
- Other changes that are reversible and verifiable by re-running the scanners

Anything outside this category stays in propose mode, even with the flag set. If a category is ambiguous, it is not safe.

## After any fix

Re-run `../../scripts/run-scanners.sh`. If a scanner fails after a fix, revert the fix immediately and report what happened. A fix that breaks the build or introduces a new finding is worse than the original issue.

## Records

Log every applied fix: the finding it addresses, the diff, the scanner results before and after. The log lives next to the report.
