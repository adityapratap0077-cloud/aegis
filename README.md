<p align="center">
  <h1 align="center">Aegis</h1>
  <p align="center">One installable skill that takes a website from idea to audited, fixed, and shippable.</p>
  <p align="center">
    <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-green.svg" alt="MIT license"></a>
    <img src="https://img.shields.io/badge/version-0.1.0-blue.svg" alt="version 0.1.0">
    <img src="https://img.shields.io/badge/works%20with-Claude%20Code-orange.svg" alt="works with Claude Code">
  </p>
</p>

<p align="center">
  <a href="demo/aegis-pipeline-16x9.mp4"><img src="demo/aegis-pipeline-16x9-preview.gif" alt="Watch the Aegis pipeline" width="720"></a>
  <br><em>Tap to watch with sound (0:41). A 20-second vertical cut is <a href="#teaser">below</a>.</em>
</p>

## Why it exists

Two things ship with every AI-built website: generated looks and unpatched holes. Design tools produce slop. Security tools find issues nobody fixes. Aegis closes the loop in one visible pipeline: design, audit, report, fix. Nothing happens silently.

## See it catch something real

A fixture site with a DOM XSS sink, scanned with the bundled runner:

```
$ scripts/run-scanners.sh ./acme-store
=== aegis scanners: ./acme-store ===
--- semgrep ---
  rules.dom-xss-innerhtml  WARNING  app.js:2
  User-controlled data flows into innerHTML (DOM XSS risk)
  OWASP A03:2021 · CWE-79
```

That finding becomes a report entry with evidence, not just a warning line:

> **Finding 1, DOM XSS via innerHTML (WARNING)**
> - **Where:** `app.js:2`
> - **Evidence:** semgrep rule `dom-xss-innerhtml` matched; `name` comes from `location.search` and flows into `.innerHTML`
> - **Why it matters:** an attacker-controlled query parameter executes as HTML/JS in the visitor's browser (OWASP A03:2021, CWE-79)
> - **Fix:** use `textContent` instead of `innerHTML`; sanitize first if HTML is required
> - **Status:** proposed, awaiting your approval

## How to use it

### 1. Install

As a Claude Code plugin:

```bash
/plugin marketplace add https://github.com/adityapratap0077-cloud/aegis
/plugin install aegis
```

Or clone it straight into your skills folder:

```bash
git clone https://github.com/adityapratap0077-cloud/aegis ~/.claude/skills/aegis
```

### 2. Check the prerequisites

| Need | Why | Install |
|---|---|---|
| Node 18+ | builds the site | [nodejs.org](https://nodejs.org) |
| semgrep | code-pattern scanning | `pip install semgrep` |
| pa11y | accessibility audit | `npm install -g pa11y` |

`npm audit` needs no install. If a scanner is missing, the audit phase reports **incomplete** instead of pretending everything passed.

### 3. Invoke it

In Claude Code, with the skill installed:

```
/aegis build me a landing page for a neighborhood bakery
```

Or describe the site in your own words and mention Aegis. It works for new builds and for auditing a site you already have: point it at the folder.

### 4. Watch the four phases

**Design.** It builds the site against real principles: hierarchy, type scale, restrained color. Template tells are refused by default: gradient headlines, glowing cards, tech-chip walls, purple-blue dark mode soup. Motion only when it serves the content. You see the result before anything else happens.

**Audit.** It runs the real scanners over the built output: semgrep for code patterns, `npm audit` for dependencies, pa11y for accessibility. LLM review may suggest extra findings, but only scanner-confirmed ones count as findings.

**Report.** Every finding arrives with evidence (file, line, scanner output), why it matters, and the smallest fix that resolves it. No finding without evidence. No inflated severity.

**Fix.** Human-gated by default. You get diffs and approve each one. Nothing is applied silently.

### 5. Approve fixes

Reply with which fixes to apply, or set `AEGIS_AUTOFIX=1` to let it apply the safe ones on its own: security headers, dependency bumps, output escaping. Every fix re-runs the scanners afterward. A fix that breaks the build gets reverted.

## What it catches, honestly

It catches: XSS sinks, dangerous sinks and sources, known-vulnerable dependencies, missing security headers, WCAG AA violations, and template-slop design.

It does not catch: business-logic flaws, auth design mistakes, or anything that needs a human threat model. Scanners are ground truth for what they cover, not a guarantee. Aegis says what ran and what did not.

## Inside the repo

```
SKILL.md                  the orchestrator: the four phases
skills/design/            phase 1, design principles and design QA
skills/audit/             phase 2, scanner-first auditing
skills/report/            phase 3, the evidence-backed finding format
skills/fix/               phase 4, propose by default, opt-in auto-fix
scripts/run-scanners.sh   semgrep, npm audit, pa11y against a built site
references/               design principles, OWASP coverage checklist
demo/                     the videos on this page
```

## Teaser

<p align="center">
  <a href="demo/aegis-teaser-9x16.mp4"><img src="demo/aegis-teaser-9x16-preview.gif" alt="Aegis teaser" width="270"></a>
  <br><em>Tap to watch with sound (0:20).</em>
</p>

## License

MIT. Use it, fork it, ship with it.
