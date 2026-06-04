# Wooster Street Food Company — Staging Status Board

> **Workflow:** Edit `preview.html` → Say "approve [section]" → Claude merges into `index.html` + bumps version log
>
> **Statuses:** `CLEAN` = matches production · `DRAFT` = changes pending review · `APPROVED` = ready to merge · `MERGED` = in production

---

## Section Registry

| # | Section ID | File | Status | Last Modified | Notes |
|---|------------|------|--------|---------------|-------|
| 01 | `s01-nav` | [s01-nav.html](s01-nav.html) | `MERGED` | 2026-06-02 | Order Now → phone modal · nav-logo anchor tag · v2.14 |
| 02 | `s02-hero` | [s02-hero.html](s02-hero.html) | `MERGED` | 2026-06-02 | Est.2019 removed · videos loop+poster · Order Now modal · iOS fallback · v2.14 |
| 03 | `s03-marquee` | [s03-marquee.html](s03-marquee.html) | `CLEAN` | 2026-05-29 | Red ticker band · ★ separators · seamless loop · gold→red pass |
| 04 | `s04-about` | [s04-about.html](s04-about.html) | `MERGED` | 2026-06-02 | Scroll height 500vh→250vh · faster traversal · v2.14 |
| 05 | `s05-menu-cards` | [s05-menu-cards.html](s05-menu-cards.html) | `MERGED` | 2026-05-29 | Combined with s07 into one Menu section (id="menu") · cards + bridge + tabs · v2.8 |
| 06 | `s06-stats` | [s06-stats.html](s06-stats.html) | `REMOVED` | 2026-05-29 | Stats section removed from production in v2.5 · file kept as archive |
| 07 | `s07-full-menu` | [s07-full-menu.html](s07-full-menu.html) | `MERGED` | 2026-05-29 | Merged into s05 — tabs flow below 3D cards in combined Menu section · v2.8 |
| 08 | `s08-packages` | [s08-packages.html](s08-packages.html) | `REMOVED` | 2026-05-29 | Packages section removed from production in v2.6 · file kept as archive |
| 08b | `s08b-catering` | *(no file)* | `REMOVED` | 2026-05-29 | Was merged into final CTA section in v2.7 — standalone file was never saved |
| 09 | `s09-gallery` | [s09-gallery.html](s09-gallery.html) | `MERGED` | 2026-05-29 | 12 photos · stacked cards · scale-pop hover · GSAP entrance · lightbox · v2.4 deep fix |
| 10 | `s10-cta` | [s10-cta.html](s10-cta.html) | `MERGED` | 2026-06-02 | Direct phone orders only · DoorDash/Uber/Grubhub removed · v2.14 |
| 11 | `s11-footer` | [s11-footer.html](s11-footer.html) | `MERGED` | 2026-06-03 | Gmail + Instagram icons in contact block · no bottom bar social · v2.17 |

---

## How to Use This System

### Making a change
1. Open `preview.html` in your browser — this is the full staging site
2. Tell Claude what you want changed in a specific section (e.g. "change the hero subtitle text")
3. Claude edits `preview.html` and marks the relevant section(s) as `DRAFT` in the toolbar
4. Review the change in your browser

### Approving & merging
- Say **"approve s02"** or **"approve hero"** → Claude merges that section into `index.html`, bumps the version log, and marks it `MERGED` here
- Say **"reject s02"** or **"reject hero"** → Claude revises in `preview.html` and keeps it `DRAFT`

### Previewing a single section
- Open the individual file (e.g. `staging/s02-hero.html`) to see just that section in isolation
- Useful for focused review without the full page scroll

### New features
Any new section or feature should follow this pattern:
1. Add a new row to this table with a new `sXX` ID
2. Create a new `staging/sXX-name.html` standalone file
3. Add the section to `preview.html` with a `<!-- ════ sXX · NAME ════ -->` comment
4. Add a chip to the dev toolbar in `preview.html`
5. After approval, merge into `index.html` and bump the version log

---

## Production Version Log

| Version | Date | Changes |
|---------|------|---------|
| v1.0 | 2026-05-28 | Initial build — Three.js hero · 3D cards · full menu tabs · Packages · Gallery · Footer · Cursor |
| v1.1 | 2026-05-29 | s02 approved — video bg hero · logo · red/navy/white palette · Est.2019 placement |
| v1.2 | 2026-05-29 | s02 fix — swapped Pexels → Mixkit CDN (resolves 403 hotlink block) |
| v1.3 | 2026-05-29 | Full brand color pass — all `var(--gold)` → `var(--red)` across all sections |
| v1.4 | 2026-05-29 | Purge gold rgba values (29 occurrences) · Gallery: 12 photos + lightbox |
| v1.5 | 2026-05-29 | Real food photos wired in — gallery + about section use wooster_street_ shots |
| v1.6 | 2026-05-29 | Curated gallery — 12 unique shots, no duplicates, proper labels |
| v1.7 | 2026-05-29 | Remove pizza box photo (IMG_2710) · replaced with wooster_street_3974 |
| v1.8 | 2026-05-29 | s04 approved — About section 3D animation · clip-path reveal · letter drop · magnetic pillar tilt · digit flip badge · mouse parallax · GSAP |
| v1.9 | 2026-05-29 | Rebrand copy — "Wooster Street Kitchen" → "Wooster Street Food Company" (4 occurrences) |
| v2.0 | 2026-05-29 | s04 redesign — Scroll-driven Our Story · 4 chapters · GSAP · parallax · magnetic cards · SVG icons · count-up stats |
| v2.1 | 2026-05-29 | s07 approved — Real menu: Appetizers, Pizza, Pasta & Breads, Salads & Platters, Desserts · Wings sauces · Catering platters |
| v2.2 | 2026-05-29 | s09 approved — Gallery stacked cards · 3D hover pop · perspective depth · GSAP entrance · lightbox |
| v2.3 | 2026-05-29 | Gallery fix — mousemove on deck · remove overflow clip · pointer-events patch |
| v2.4 | 2026-05-29 | Gallery deep fix — remove preserve-3d · scale-based pop · latest-coord rAF · all hover reliable |
| v2.5 | 2026-05-29 | Remove stats section · s05 cards updated: White Apizza · Caesar Salad · Chicken Alfredo · Nav Menu → Finest Creations + full menu adjacent |
| v2.6 | 2026-05-29 | Remove Packages section · New Catering Call band — 860-649-1166 · platters/pizza/bar pills · Call-to-book CTA |
| v2.7 | 2026-05-29 | Merge CTA + Catering → one final section after gallery · split Order/Catering panels · new copy · nav + hero updated |
| v2.8 | 2026-05-29 | Merge Menu + Full Menu → single section (id="menu") · 3D cards + bridge divider + tabs · nav & footer deduped |
| v2.9 | 2026-05-29 | Footer: remove IG/TK/FB/TW · add Slice to Order list · fix © 2024 → 2026 · Instagram & Facebook TBD |
| v2.10 | 2026-05-29 | Mobile responsiveness · hamburger nav + overlay · 4-tier breakpoints (1024/768/480/375px) · iOS dvh fix · gallery lazy load + touch events · QA test plan (tests/test-plan.html) |
| v2.11 | 2026-05-29 | Logo click fix — nav-logo div → anchor tag · scrolls to top on click |
| v2.12 | 2026-06-02 | Remove Est. 2019 · Pizza cursor replaces circle · About scroll 500vh→250vh · Videos loop + play on scroll/touch |
| v2.13 | 2026-06-02 | Phone order modal (js-order-modal) · Remove DoorDash/Uber/Grubhub/Slice · Direct phone orders only |
| v2.14 | 2026-06-02 | Logo reverted to text headline · iOS video fallback + webkit-playsinline · All staging files synced |
| v2.15 | 2026-06-02 | Footer: Instagram @woosterfoodcatering · circle icon with gradient hover |
| v2.16 | 2026-06-03 | Scroll reveal fix — scroll fallback + threshold 0.05 · iOS Apple Pay meta suppressed |
| v2.17 | 2026-06-03 | Order Now → full order page modal (phone + menu highlights) · smooth scroll href=# fix · DOMContentLoaded modal init · Footer Gmail + Instagram contact icons |
| v2.18 | 2026-06-04 | Remove pizza cursor → normal browser cursor · Remove announcement bar · SEO + OG meta tags kept |

---

## Design Tokens (shared across all sections)

```css
--white:    #ffffff   /* primary text */
--red:      #CC1318   /* brand red — accents, CTA, dividers */
--red-dark: #9e0f13   /* deeper red for hover states */
--navy:     #252A62   /* brand navy — stats bar, subtle UI */
--dark:     #08090f   /* primary background (navy-tinted near-black) */
--char:     #0d0e18   /* charcoal — alternating sections */
```

Fonts: `Playfair Display` (headings) · `Inter` (body)
