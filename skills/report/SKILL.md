---
name: aegis-report
description: Write security and quality findings with evidence and fix guidance. Part of the Aegis pipeline (phase 3). Use when Aegis is reporting audit results.
---

# Aegis report phase

## Finding format

Every finding has four parts, in this order:

1. What is wrong, in one sentence.
2. Evidence: file, line, and the scanner output or reproduction step. No evidence, no finding.
3. Why it matters: the concrete outcome if exploited or left as is. One or two sentences.
4. How to fix it: the smallest change that resolves it. Name the file and the approach.

## Severity

- High: exploitable now, or exposes user data.
- Medium: exploitable with conditions, or weakens a defense layer.
- Low: hygiene, headers, or best practice with no direct exploit path.

Do not inflate. A missing header is low, not high. If you are unsure between two levels, pick the lower one and say why.

## Output

Write the report as markdown. Group by severity, high first. End with the counts and the list of checklist items marked not-applicable. The report is the handoff to the fix phase; it must be complete enough that someone else could do the fixes from it alone.
