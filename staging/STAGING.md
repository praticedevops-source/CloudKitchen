# Wooster Street Food Company — Staging Status Board

> **Workflow:** Edit `preview.html` → Say "approve [section]" → Claude merges into `index.html` + bumps version log
>
> **Statuses:** `CLEAN` = matches production · `DRAFT` = changes pending review · `APPROVED` = ready to merge · `MERGED` = in production

---

## Section Registry

| # | Section ID | File | Status | Last Modified | Notes |
|---|------------|------|--------|---------------|-------|
| 01 | `s01-nav` | [s01-nav.html](s01-nav.html) | `CLEAN` | 2026-05-29 | Fixed top nav, logo, links, Order Now button · gold→red pass |
| 02 | `s02-hero` | [s02-hero.html](s02-hero.html) | `CLEAN` | 2026-05-29 | Video bg · logo · red/navy/white · Mixkit CDN carousel (5 scenes) |
| 03 | `s03-marquee` | [s03-marquee.html](s03-marquee.html) | `CLEAN` | 2026-05-29 | Red ticker band · ★ separators · seamless loop · gold→red pass |
| 04 | `s04-about` | [s04-about.html](s04-about.html) | `CLEAN` | 2026-05-29 | Split image + pillars · gold→red pass |
| 05 | `s05-menu-cards` | [s05-menu-cards.html](s05-menu-cards.html) | `CLEAN` | 2026-05-29 | 3 × 3D tilt cards · gold→red pass |
| 06 | `s06-stats` | [s06-stats.html](s06-stats.html) | `CLEAN` | 2026-05-29 | 4 large numbers (2K+ orders, 48+ items, 4.9★, <35 min) · gold→red pass |
| 07 | `s07-full-menu` | [s07-full-menu.html](s07-full-menu.html) | `CLEAN` | 2026-05-29 | Tabbed menu: Starters, Mains, Bowls, Desserts, Beverages · gold→red pass |
| 08 | `s08-packages` | [s08-packages.html](s08-packages.html) | `CLEAN` | 2026-05-29 | Ember $18 · Blaze $32 (featured) · Inferno $55 · gold→red pass |
| 09 | `s09-gallery` | [s09-gallery.html](s09-gallery.html) | `CLEAN` | 2026-05-29 | 12-photo masonry grid · click-to-expand lightbox · gold→red pass |
| 10 | `s10-cta` | [s10-cta.html](s10-cta.html) | `CLEAN` | 2026-05-29 | Call to action — Place an Order / View Packages · gold→red pass |
| 11 | `s11-footer` | [s11-footer.html](s11-footer.html) | `CLEAN` | 2026-05-29 | Links, hours, contact, social icons · gold→red pass |

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
