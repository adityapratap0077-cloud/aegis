# Aegis

One installable skill that takes a website from idea to audited, fixed, and shippable.

[![Watch the pipeline](demo/aegis-pipeline-16x9-preview.gif)](demo/aegis-pipeline-16x9.mp4)

*Tap to watch with sound (0:41). A 20-second vertical cut is [below](#teaser).*

## The problem

Two things ship with every AI-built website: generated looks and unpatched holes. Design tools make slop. Security tools find issues nobody fixes. Aegis closes the loop.

## The pipeline

Four phases, each one visible. Nothing happens silently.

**01 / Design.** Real hierarchy, real type scale, restrained color. Template tells are banned by default: gradient headlines, glowing cards, tech-chip walls, purple-blue dark mode soup. Motion only when it serves the content.

**02 / Audit.** Real scanners are the ground truth: semgrep for code patterns, npm audit for dependencies, pa11y for accessibility. LLM review can suggest findings, but only confirmed ones count.

**03 / Report.** Every finding ships with evidence (file, line, scanner output), why it matters, and the smallest fix. No finding without evidence. No inflated severity.

**04 / Fix.** Human-gated by default. The skill proposes diffs, you approve each one. Auto-fix is opt-in (`AEGIS_AUTOFIX=1`) and limited to mechanically safe, reversible, scanner-verifiable changes: security headers, dependency bumps, output escaping. Every fix re-runs the scanners; a fix that breaks the build gets reverted.

## Install

As a Claude Code plugin:

```bash
/plugin marketplace add https://github.com/adityapratap0077-cloud/aegis
/plugin install aegis
```

Or clone it into your skills directory:

```bash
git clone https://github.com/adityapratap0077-cloud/aegis ~/.claude/skills/aegis
```

## Use

Invoke the `aegis` skill and describe the site you want. You see what was generated, what was found, and what changed.

## Inside

```
SKILL.md                  the orchestrator: the four phases
skills/design/            phase 1: design principles and design QA
skills/audit/             phase 2: scanner-first auditing
skills/report/            phase 3: evidence-backed finding format
skills/fix/               phase 4: propose by default, opt-in auto-fix
scripts/run-scanners.sh   semgrep, npm audit, pa11y against a built site
references/               design principles and the OWASP coverage checklist
demo/                     the videos on this page
```

## The rules it runs on

- Scanners decide what is real. An unconfirmed suspicion is not a finding.
- Fixes are proposed, never silently applied. The human is in the loop by design.
- It does not claim to handle everything on its own. Transparency is the feature.

## Teaser

[![Aegis teaser](demo/aegis-teaser-9x16-preview.gif)](demo/aegis-teaser-9x16.mp4)

*Tap to watch with sound (0:20).*

## License

MIT
