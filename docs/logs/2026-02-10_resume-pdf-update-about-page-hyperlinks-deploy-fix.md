---
id: log_20260210_resume-pdf-update-about-page-hyperlinks-deploy-fix
type: log
status: active
event_type: session
source: Antigravity
branch: main
created: 2026-02-10
---

# Resume PDF update, about page hyperlinks, deploy fix

## Summary

Published updated resume PDF, added hyperlinks for Michelle (LinkedIn) and Sierra AI (website) in the about page whats_next section, and diagnosed/fixed a Cloudflare Pages deploy failure caused by a project name mismatch after domain migration.

## Changes Made

- `static/resume/Jonathan_Oh_Resume.pdf` — Updated resume PDF
- `layouts/about/single.html` — Added `<a>` tags for Michelle → linkedin.com/in/michelleppham and Sierra AI → sierra.ai in the whats_next section
- Cloudflare Pages project name corrected from `johnnyoh-xyz` to `ohjonathan-com` (user-side fix in Cloudflare dashboard)

## Verification

- Two failed GitHub Actions runs (21871300416, 21871765750) traced to `Project not found [code: 8000007]`
- Re-ran deploy after Cloudflare project rename — passed in 30s
- Site live at ohjonathan.com