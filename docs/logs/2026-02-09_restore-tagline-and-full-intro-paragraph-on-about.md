---
id: log_20260209_restore-tagline-and-full-intro-paragraph-on-about
type: log
status: active
event_type: about-page-redesign-finalize-and-push
source: cli
branch: main
created: 2026-02-09
---

# restore tagline and full intro paragraph on about 

## Summary

Completed the About-page redesign integration from the provided reference HTML, then iterated based on visual feedback: fixed hero centering/class collisions, removed unstable timeline “impact” effects, restored static timeline readability, corrected stats layout to 6 cells, restored reference-consistent Elsewhere photo melt, and improved editorial hero text contrast.

## Goal

Ship the new About page into Hugo with the requested visual direction while preserving nav/footer/theme toggle behavior, then stabilize readability and interaction quality through review-driven refinements.

## Changes Made

1. Replaced About template content with reference-based structure and page-scoped JS in `layouts/about/single.html`.
2. Reworked About-specific styling in `static/css/custom.css` under `.about-page-v2` with theme-aware tokens for editorial vs terminal.
3. Fixed hero layout issues by isolating About hero class (`about-v2-hero`) to avoid global `.hero` style leakage.
4. Corrected stats grid to a fixed 6-cell layout (3x2 desktop).
5. Removed timeline motion experiments and restored a clean static timeline rail/dot presentation.
6. Restored Elsewhere inline Seoul photo melt to match reference behavior (bottom 50%, right 40%, no extra feather overlay).
7. Improved editorial hero text contrast for readability over faded imagery.
8. Added/used required images in `static/images/about-mountain.jpg`, `static/images/about-hanbok.jpg`, and `static/images/about-seoul.jpg`.

## Key Decisions

1. Keep About styles tightly scoped (`.about-page-v2`) to prevent regressions across other templates.
2. Prefer a stable static timeline over scroll-reactive effects after repeated UX feedback against motion-heavy variants.
3. Keep editorial and terminal as tokenized theme variants rather than hardcoding one aesthetic.

## Alternatives Considered

1. Preserve dynamic timeline progress/active-state animations:
   Rejected because it reduced visual clarity and caused alignment/perceived instability issues.
2. Keep stronger custom melt for Elsewhere photo:
   Rejected in favor of strict reference parity when user requested exact match.

## Impacts

1. About page now aligns with the provided reference structure/content while fitting the site shell.
2. Editorial mode readability is significantly improved in hero and timeline sections.
3. Interaction is calmer and more predictable with less motion complexity.
4. Theme toggle continues to function, with About-specific visual differences handled by tokens.

## Testing
1. Rebuilt site repeatedly with `hugo` after each major adjustment (no build/template errors).
2. Verified generated outputs include updated About template/CSS in `public/about/index.html` and `public/css/custom.css`.
