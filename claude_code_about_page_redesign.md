# Prompt: Redesign the About Page

## Overview

Replace the current About page with a completely new design. I'm providing:

1. **`about-page-final-reference.html`** — The exact HTML/CSS/JS for the new design. This is a standalone HTML file that serves as the reference implementation. Adapt it into the site's Hugo template system, but preserve the design exactly.
2. **Three new image files** to add to the site's `/images/` directory:
   - `about-mountain.jpg` — mountain summit photo (parallax break)
   - `about-hanbok.jpg` — hanbok at Korean palace wall (parallax break)
   - `about-seoul.jpg` — Seoul night overlook (inline photo)
   - `about-photo.png` already exists on the site (steel mill hero photo)

## What to do

1. Copy the three new image files into the site's images directory
2. Replace the About page template/content with the new design from the reference HTML
3. Integrate the CSS into the site's stylesheet (or a dedicated about.css partial)
4. Integrate the JS into the site's scripts (or inline in the about template)
5. Make sure the existing site nav, footer, and theme toggle still work around the new content

## Critical design details to preserve exactly

- **Hero**: Full-bleed steel mill photo with gradient melts on all four edges, Ken Burns zoom animation, `$ whoami` typing effect, "I'm Johnny. I build things that make systems honest." with green accent on "make systems honest."
- **Photo breaks**: Two parallax photo breaks (mountain between How I Work / The Path, hanbok between The Path / What's Next). Each has melt gradients on all four edges dissolving into the page background.
- **Hanbok photo**: `object-position: center 65%` — this was carefully tuned to show the full body.
- **Mountain photo**: `object-position: center 40%`
- **Seoul inline photo**: In the "Elsewhere" section, 280x380px with melt from bottom and right edge
- **Section labels**: Monospace, green, with `>` prefix (e.g., `> what_drives_me`)
- **Callout block**: "Glass box, not black box." with green left border and green tinted background
- **Punchlines**: Rendered as code comments with `// ` prefix in monospace green
- **Stats grid**: 6 cells ($30B, 8, 6, 40-50, 500+, 3) with stagger-in animation
- **Tags**: YAGNI, KISS, 5-7 AI terminals, ship > recommend, single-feature tools
- **Timeline**: Terminal commands as headers (`$ cd /gov/massachusetts`, `$ ssh mckinsey@technology`, etc.) with green line and dot markers
- **CTA block**: "If you're building something in this space..." with blinking cursor, green accent top border
- **Footer**: `$ next █` with "CONTACT ME" label underneath, then GitHub / LinkedIn / Resume / Email links with underline hover effect
- **Scroll animations**: Sections fade up on scroll, stats stagger in, timeline entries slide from left, footer fades in
- **Fonts**: JetBrains Mono (mono) and Source Serif 4 (body) — load from Google Fonts if not already loaded

## Do NOT change

- The text content — use it exactly as written in the reference HTML
- The photo crop/positioning values
- The animation timings and effects
- The color values (--accent: #3cec6a, --bg: #0a0a0a, etc.)

## Verification

After implementing, confirm:
1. Hero photo loads with Ken Burns zoom and gradient melts
2. `$ whoami` types out on page load
3. "I'm Johnny" is the first line of the title
4. Both photo breaks (mountain and hanbok) appear between the correct sections with parallax melt effects
5. Seoul photo appears inline in the Elsewhere section
6. Stats grid animates on scroll
7. Timeline entries stagger in from left
8. Footer shows `$ next █` with CONTACT ME label
9. Site nav and theme toggle still work
10. Page is responsive on mobile
