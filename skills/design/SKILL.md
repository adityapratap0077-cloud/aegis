---
name: aegis-design
description: Generate websites with real design principles. Part of the Aegis pipeline (phase 1). Use when Aegis is designing or building a site.
---

# Aegis design phase

## Principles

Read `../../references/design-principles.md` before generating anything. The short version:

- One clear hierarchy per page. If everything is emphasized, nothing is.
- A real type scale (no more than 4 sizes). Body text never below 16px on web.
- Restrained color: one primary, one accent, neutrals. Gradients only when they serve the brand, never as the design.
- No template tells: gradient headlines, glowing cards, and tech-chip walls are banned unless the user asks for them.
- Whitespace is a design decision, not empty space to fill.

## Process

1. State the design direction in two sentences before writing code. If you cannot, you are not ready.
2. Build with semantic HTML and one coherent CSS approach. No mixing frameworks per page.
3. Use animation skills only when motion serves the content: `animate` for UI motion timing, `gsap-skills` for scroll and complex sequences, `rive-skills` for interactive elements, `wiggle` for logo animation, `threejs-skills` for 3D. Decorative motion that adds load time without meaning gets cut.

## Design QA (run before leaving this phase)

- Screenshot every page at desktop and mobile widths. Review each one yourself.
- Contrast: body text must clear WCAG AA (4.5:1). Check, do not assume.
- Legibility floor: no functional text below 11px, body at 16px or above.
- Read all rendered text against the brief. Typos and placeholder text fail the phase.
- If any check fails, fix it here. Do not carry design debt into the audit phase.
