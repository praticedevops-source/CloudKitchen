# Wooster Street Kitchen — Staging Status Board

> **Workflow:** Edit `preview.html` → Say "approve [section]" → Claude merges into `index.html` + bumps version log
>
> **Statuses:** `CLEAN` = matches production · `DRAFT` = changes pending review · `APPROVED` = ready to merge · `MERGED` = in production

---

## Section Registry

| # | Section ID | File | Status | Last Modified | Notes |
|---|------------|------|--------|---------------|-------|
| 01 | `s01-nav` | [s01-nav.html](s01-nav.html) | `CLEAN` | 2026-05-28 | Fixed top nav, logo, links, Order Now button |
| 02 | `s02-hero` | [s02-hero.html](s02-hero.html) | `CLEAN` | 2026-05-28 | Three.js canvas, fire particles, mouse parallax, stats |
| 03 | `s03-marquee` | [s03-marquee.html](s03-marquee.html) | `CLEAN` | 2026-05-28 | Scrolling gold ticker band |
| 04 | `s04-about` | [s04-about.html](s04-about.html) | `CLEAN` | 2026-05-28 | Split image + pillars (Fire-Crafted, Delivery, Sourced, Zero Waste) |
| 05 | `s05-menu-cards` | [s05-menu-cards.html](s05-menu-cards.html) | `CLEAN` | 2026-05-28 | 3 × 3D tilt cards (Flatbreads, Grain Bowls, Smoked Provisions) |
| 06 | `s06-stats` | [s06-stats.html](s06-stats.html) | `CLEAN` | 2026-05-28 | 4 large numbers (2K+ orders, 48+ items, 4.9★, <35 min) |
| 07 | `s07-full-menu` | [s07-full-menu.html](s07-full-menu.html) | `CLEAN` | 2026-05-28 | Tabbed menu: Starters, Mains, Bowls, Desserts, Beverages |
| 08 | `s08-packages` | [s08-packages.html](s08-packages.html) | `CLEAN` | 2026-05-28 | Ember $18 · Blaze $32 (featured) · Inferno $55 |
| 09 | `s09-gallery` | [s09-gallery.html](s09-gallery.html) | `CLEAN` | 2026-05-28 | 8-item masonry grid (4 columns) |
| 10 | `s10-cta` | [s10-cta.html](s10-cta.html) | `CLEAN` | 2026-05-28 | Call to action — Place an Order / View Packages |
| 11 | `s11-footer` | [s11-footer.html](s11-footer.html) | `CLEAN` | 2026-05-28 | Links, hours, contact, social icons |

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

---

## Design Tokens (shared across all sections)

```css
--cream:  #f5e6d0   /* primary text, backgrounds */
--gold:   #c8954a   /* accents, borders, highlights */
--red:    #c0392b   /* fire accent */
--dark:   #080604   /* primary background */
--char:   #120d09   /* charcoal — alternating sections */
--orange: #d4521a   /* CTA buttons, fire elements */
```

Fonts: `Playfair Display` (headings) · `Inter` (body)
