# 🔥 Wooster Street Kitchen — Cloud Kitchen Website

> A premium, single-page cloud kitchen website with Three.js hero, 3D card interactions, tabbed menu, catering packages, and masonry gallery.

---

## 📁 Project Structure

```
CloudKitchen/
├── index.html           ← PRODUCTION  — approved content only, never edited directly
├── preview.html         ← STAGING     — full site with dev toolbar, all pending changes
├── staging/
│   ├── STAGING.md       ← Section status board (CLEAN / DRAFT / APPROVED / MERGED)
│   ├── s01-nav.html     ← Standalone: Navigation
│   ├── s02-hero.html    ← Standalone: Three.js Hero
│   ├── s03-marquee.html ← Standalone: Scrolling Ticker
│   ├── s04-about.html   ← Standalone: Our Story / Pillars
│   ├── s05-menu-cards.html ← Standalone: 3D Signature Cards
│   ├── s06-stats.html   ← Standalone: Key Statistics
│   ├── s07-full-menu.html ← Standalone: Tabbed Full Menu
│   ├── s08-packages.html ← Standalone: Catering Packages
│   ├── s09-gallery.html ← Standalone: Masonry Gallery
│   ├── s10-cta.html     ← Standalone: Call to Action
│   └── s11-footer.html  ← Standalone: Footer
└── README.md
```

---

## 🌿 Branch Strategy (GitFlow)

```
main ─────────────────────────────────────── PRODUCTION
  │
  └── develop ──────────────────────────────── STAGING / INTEGRATION
        │
        ├── feature/s01-nav-update
        ├── feature/s02-hero-redesign
        ├── feature/s07-add-brunch-menu
        └── hotfix/s11-phone-number
```

| Branch | Purpose | Who merges |
|--------|---------|-----------|
| `main` | Live production site — `index.html` is the source of truth | Approved PRs only |
| `develop` | Staging integration — `preview.html` + all staging files | Feature branch PRs |
| `feature/sXX-*` | One branch per section change | Developer → PR → develop |
| `hotfix/*` | Urgent production fixes | Developer → PR → main + develop |

---

## 🔄 Development Workflow

### Starting a new section change

```bash
# Always branch from develop, never from main
git checkout develop
git pull origin develop
git checkout -b feature/s05-update-menu-cards
```

### Making changes

1. Edit the relevant `staging/sXX-name.html` file first (isolated preview)
2. Apply the same change to `preview.html` (full site preview)
3. Mark the section as `DRAFT` in the dev toolbar of `preview.html`
4. Update `staging/STAGING.md` status table

```bash
git add staging/s05-menu-cards.html preview.html staging/STAGING.md
git commit -m "feat(s05): add new wood-fired pizza card"
git push origin feature/s05-update-menu-cards
```

### Opening a Pull Request

- PR **target**: `develop` (never `main` directly)
- Title format: `feat(s05): description` or `fix(s11): description`
- Fill out the PR template — include before/after screenshots
- Requires 1 approval before merge

### Approving into production

Once a section is approved in `preview.html`:
1. The `index.html` section is updated to match
2. Version log is bumped (e.g., `v1.1`)
3. A PR is opened from `develop` → `main`
4. `staging/STAGING.md` is updated to `MERGED`

```bash
# Merge develop → main (production release)
git checkout main
git merge --no-ff develop -m "release: v1.1 — approved s05 menu cards update"
git tag -a v1.1 -m "v1.1: Updated menu cards section"
git push origin main --tags
```

---

## 🏷️ Commit Message Convention

```
type(scope): short description

Types:  feat | fix | style | refactor | content | release | hotfix
Scope:  s01–s11 | global | deps

Examples:
  feat(s07): add brunch tab to full menu
  fix(s02): hero canvas not resizing on mobile
  style(global): darken gold accent from #c8954a to #b8842a
  content(s08): update Inferno package price to $60
  release: v1.2 — merged s07 brunch tab + s08 price update
  hotfix(s11): correct phone number area code
```

---

## 🎨 Design Tokens

| Token | Value | Usage |
|-------|-------|-------|
| `--cream` | `#f5e6d0` | Primary text, light backgrounds |
| `--gold` | `#c8954a` | Accents, borders, highlights |
| `--red` | `#c0392b` | Fire accent |
| `--dark` | `#080604` | Primary background |
| `--char` | `#120d09` | Charcoal — alternating sections |
| `--orange` | `#d4521a` | CTA buttons, fire elements |

Fonts: **Playfair Display** (headings) · **Inter** (body)

---

## 🚀 Tech Stack

- Vanilla HTML / CSS / JavaScript — zero build step, zero dependencies
- [Three.js r128](https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js) — hero WebGL canvas
- [Google Fonts](https://fonts.google.com/) — Playfair Display + Inter
- CSS Custom Properties (design tokens)
- IntersectionObserver API (scroll reveals)
- CSS `columns` (masonry gallery)

---

## 📋 Section Registry

| # | ID | Section | Status |
|---|----|---------|--------|
| 01 | `s01-nav` | Fixed navigation bar | ✅ CLEAN |
| 02 | `s02-hero` | Three.js animated hero | ✅ CLEAN |
| 03 | `s03-marquee` | Scrolling gold ticker | ✅ CLEAN |
| 04 | `s04-about` | Our story + pillars | ✅ CLEAN |
| 05 | `s05-menu-cards` | 3 × 3D signature cards | ✅ CLEAN |
| 06 | `s06-stats` | 4 key statistics | ✅ CLEAN |
| 07 | `s07-full-menu` | Tabbed menu (5 tabs) | ✅ CLEAN |
| 08 | `s08-packages` | Catering packages (3 tiers) | ✅ CLEAN |
| 09 | `s09-gallery` | Masonry photo gallery | ✅ CLEAN |
| 10 | `s10-cta` | Call to action | ✅ CLEAN |
| 11 | `s11-footer` | Footer | ✅ CLEAN |

See [`staging/STAGING.md`](staging/STAGING.md) for the live status board.

---

## 🔖 Version History

| Version | Date | Changes |
|---------|------|---------|
| v1.0 | 2026-05-28 | Initial build — Three.js hero · 3D cards · tabbed menu · packages · gallery · footer · cursor |

---

*Wooster Street Kitchen — Crafted from fire, delivered with intention.*
