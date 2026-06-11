# Wooster Street Food Company

Live site: [woosterstreetcatering.com](https://woosterstreetcatering.com)
Admin CMS: [woosterstreetcatering.com/admin](https://woosterstreetcatering.com/admin)

## What's here

| File / Folder | Purpose |
|---|---|
| `index.html` | The entire website (single page) |
| `content.json` | All editable content — menu, hours, phone, ratings |
| `admin/` | Decap CMS admin panel — edit content without code |
| `netlify.toml` | Netlify configuration — headers, cache rules |
| `images/` | Food photography and logos |

## Editing content

Log in at `/admin` to change menu items, prices, hours, phone number, or ratings.
Changes publish automatically in ~30 seconds via Netlify.

## Stack

- Static HTML/CSS/JS — no framework, no build step
- Hosted on [Netlify](https://netlify.com) — auto-deploys on every GitHub push
- CMS: [Decap CMS](https://decapcms.org) with Netlify Identity + Git Gateway
- Domain: GoDaddy → Netlify via CNAME
