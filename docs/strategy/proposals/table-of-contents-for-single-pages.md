# Proposal: Table of Contents for Long Single Pages (Final)

## Problem
Long posts and project pages are hard to scan quickly. Readers currently cannot see page structure at a glance or jump to sections.

## Decision
Add an auto-generated, clickable Table of Contents (TOC) to long single pages rendered by the default single-page template.

## Goals
1. Improve scanability for long-form content.
2. Reduce scroll friction with jump links.
3. Keep short pages visually clean.
4. Preserve the existing design language in both themes.

## Non-Goals
1. No TOC on list pages, homepage, or nav.
2. No manual TOC markup in markdown files.
3. No TOC on custom About layout (`layouts/about/single.html`).
4. No JavaScript dependency for core TOC behavior.

## Scope
1. Template target: `layouts/_default/single.html`.
2. Styling target: `static/css/custom.css`.
3. Content covered: single pages using the default template (currently posts and projects).
4. Excluded layouts: section-specific overrides unless explicitly added later.

## Behavior Spec (v1)
1. Render TOC only when `toc` is not disabled in frontmatter.
2. Support explicit opt-out with `toc: false`.
3. Show TOC only when the page has at least 3 `h2` headings.
4. Include `h2` headings only (no nested `h3` tree in v1).
5. Place TOC between `.page-header` and `.page-content`.
6. Wrap TOC in semantic `<details><summary>`.
7. Default state: collapsed.
8. Summary label: `On this page`.
9. Use Hugo-generated heading anchors.

## Styling Direction
1. Typography: JetBrains Mono (structural/navigation role).
2. Tone: small text around `0.78rem`, base `--text-tertiary`.
3. Container: light border and spacing consistent with section-header rhythm.
4. Editorial theme: subtle, low-contrast utility panel.
5. Terminal theme: dashed border, accent hover, consistent with terminal motif.

## Accessibility Requirements
1. `summary` must be clearly focus-visible and keyboard operable.
2. TOC links must maintain readable contrast in both themes.
3. Spacing and hit targets must remain usable on mobile.
4. TOC must still work without JavaScript.

## Acceptance Criteria
1. `content/posts/seven-dollars-and-a-clear-vision.md` displays TOC and jump links correctly.
2. Project pages with >=3 `h2` headings display TOC.
3. Pages below threshold do not show TOC.
4. `toc: false` suppresses TOC regardless of heading count.
5. `layouts/about/single.html` remains unchanged.
6. Editorial and terminal themes both render cleanly on desktop and mobile.

## Out of Scope
1. Sticky TOC behavior.
2. `h3` nesting in TOC.
3. Per-page "always open" toggle behavior.

## Implementation Notes
1. If Hugo TOC depth is broader than `h2`, constrain TOC depth for this feature before shipping.
2. Validate behavior on at least one long post and one project page.
