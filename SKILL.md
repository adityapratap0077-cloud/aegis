---
name: aegis
description: Design, build, audit, and fix websites in one visible pipeline. Generates sites with real design principles (no template slop), audits them with real scanners, reports every finding with evidence, and proposes fixes. Fixes are human-gated by default; auto-fix is opt-in and limited to mechanically safe changes.
license: MIT
metadata:
  version: "0.1.0"
---

# Aegis

One installable skill that takes a website from idea to audited, fixed, and shippable. Four phases, each visible. Nothing happens silently.

## The pipeline

### Phase 1: Design and build

Read `skills/design/SKILL.md`. Generate the site following `references/design-principles.md`: real hierarchy, real type scale, restrained color, no gradient-headline template look. Use the animation skills when motion serves the design, never as decoration.

Before moving on, run the design QA in `skills/design/SKILL.md` (screenshot review, contrast check, legibility floor).

### Phase 2: Audit

Read `skills/audit/SKILL.md`. Run `scripts/run-scanners.sh` against the built site. Scanners are the ground truth: semgrep for code patterns, npm audit for dependencies, pa11y for accessibility. LLM review may add findings, but a finding only counts when a scanner or a reproducible check confirms it.

### Phase 3: Report

Read `skills/report/SKILL.md`. Write every confirmed finding as: what is wrong, the evidence (file, line, scanner output), why it matters, and how to fix it. No finding without evidence. No severity inflation.

### Phase 4: Fix

Read `skills/fix/SKILL.md`. Default: propose diffs and stop. The human approves each fix.

Auto-fix is opt-in only (`AEGIS_AUTOFIX=1`), and only for the safe category: security headers, dependency bumps, output escaping, and other reversible, scanner-verifiable changes. After any auto-fix, re-run the scanners. If a scanner fails after a fix, revert the fix and report it.

## Rules

- Each phase is visible. The user sees what was generated, what was found, and what changed.
- Never auto-fix by default. Never fix what no scanner confirmed.
- Never market or describe this as handling everything on its own. The human is in the loop by design.
- Keep `SKILL.md` and `README.md` in sync. Keep the version in `SKILL.md`, `CHANGELOG.md`, and `.claude-plugin/plugin.json` identical.
