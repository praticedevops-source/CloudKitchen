#!/bin/bash
# ╔══════════════════════════════════════════════════════════╗
# ║   Wooster Street Kitchen — Git Setup & Push to GitHub   ║
# ║   Run this once from Terminal to push your project       ║
# ╚══════════════════════════════════════════════════════════╝

set -e  # Exit on any error

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
REMOTE_URL="https://github.com/praticedevops-source/CloudKitchen.git"
GITHUB_USERNAME="praticedevops-source"

echo ""
echo "🔥 Wooster Street Kitchen — Git Push Setup"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📁 Project folder: $REPO_DIR"
echo "🌐 Remote:         $REMOTE_URL"
echo ""

# ─── STEP 1: GitHub Personal Access Token ─────────────────────────────────────
echo "STEP 1 — GitHub Personal Access Token"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  1. Open this URL in your browser:"
echo "     https://github.com/settings/tokens/new"
echo ""
echo "  2. Settings:"
echo "     • Note:       CloudKitchen deploy"
echo "     • Expiration: 90 days (or No expiration)"
echo "     • Scopes:     ✅ repo  (check the top-level 'repo' box)"
echo ""
echo "  3. Click 'Generate token' → Copy the token (starts with ghp_...)"
echo ""
echo "  Press ENTER when ready to paste your token ↓"
read -r -p "  GitHub PAT: " PAT

if [ -z "$PAT" ]; then
  echo "❌ No token entered. Exiting."
  exit 1
fi

echo ""
echo "✅ Token received."
echo ""

# Build authenticated remote URL
AUTH_URL="https://${GITHUB_USERNAME}:${PAT}@github.com/praticedevops-source/CloudKitchen.git"

# ─── STEP 2: Initialize git repo ──────────────────────────────────────────────
echo "STEP 2 — Initializing git repository"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
cd "$REPO_DIR"

# Remove any stale lock files
rm -f .git/index.lock 2>/dev/null || true

if [ -d ".git" ]; then
  echo "  ✅ Git repo already exists — skipping init"
else
  git init
  echo "  ✅ Git initialized"
fi

git config user.name  "Nikhil"
git config user.email "nikhilkrishnareddy2@gmail.com"
echo "  ✅ Git user configured"
echo ""

# ─── STEP 3: First commit on main ─────────────────────────────────────────────
echo "STEP 3 — Creating initial commit on main"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Remove the setup script itself from tracking
echo "setup-git-push.sh" >> .gitignore

git add -A

# Check if there's already a commit
if git rev-parse HEAD &>/dev/null 2>&1; then
  echo "  ✅ Commits already exist — skipping initial commit"
else
  git commit -m "feat: initial production build v1.0

Wooster Street Kitchen — Cloud Kitchen website

Sections (s01–s11):
- s01: Fixed top navigation with scroll state
- s02: Three.js hero (particles, fire orbs, mouse parallax)
- s03: Scrolling gold marquee ticker
- s04: About / Our Story split layout + 4 pillars
- s05: 3x 3D tilt menu showcase cards
- s06: 4 key stats (orders, items, rating, delivery)
- s07: Full tabbed menu (Starters, Mains, Bowls, Desserts, Beverages)
- s08: 3-tier catering packages (Ember/Blaze/Inferno)
- s09: 4-column masonry gallery
- s10: CTA section
- s11: Footer with links, hours, contact, social

Tooling:
- preview.html: staging branch with dev toolbar
- staging/: 11 standalone section preview files
- staging/STAGING.md: section status board
- .github/: PR template + issue templates

Tech: Three.js r128 · CSS custom properties · IntersectionObserver"

  git tag -a v1.0 -m "v1.0: Initial production build"
  echo "  ✅ Initial commit created + tagged v1.0"
fi
echo ""

# ─── STEP 4: Create develop branch ────────────────────────────────────────────
echo "STEP 4 — Setting up develop branch"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

CURRENT_BRANCH=$(git branch --show-current)

# Ensure we're on main
if [ "$CURRENT_BRANCH" != "main" ]; then
  git branch -M main 2>/dev/null || git checkout -b main 2>/dev/null || true
fi

# Create develop from main if it doesn't exist
if git show-ref --verify --quiet refs/heads/develop; then
  echo "  ✅ develop branch already exists"
else
  git checkout -b develop
  echo "  ✅ develop branch created from main"
  git checkout main
fi

echo ""

# ─── STEP 5: Set remote ───────────────────────────────────────────────────────
echo "STEP 5 — Configuring remote"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if git remote get-url origin &>/dev/null 2>&1; then
  git remote set-url origin "$AUTH_URL"
  echo "  ✅ Remote 'origin' updated"
else
  git remote add origin "$AUTH_URL"
  echo "  ✅ Remote 'origin' added"
fi
echo ""

# ─── STEP 6: Push main → GitHub ───────────────────────────────────────────────
echo "STEP 6 — Pushing main to GitHub"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
git checkout main
git push -u origin main --tags
echo "  ✅ main pushed to GitHub"
echo ""

# ─── STEP 7: Push develop → GitHub ────────────────────────────────────────────
echo "STEP 7 — Pushing develop to GitHub"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
git checkout develop
git push -u origin develop
echo "  ✅ develop pushed to GitHub"
echo ""

# ─── Strip PAT from remote URL (security) ────────────────────────────────────
git remote set-url origin "$REMOTE_URL"
echo "  🔒 PAT removed from remote URL (security)"
echo ""

# ─── Done ─────────────────────────────────────────────────────────────────────
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎉  ALL DONE!"
echo ""
echo "  🌐 GitHub:   https://github.com/praticedevops-source/CloudKitchen"
echo "  🌿 Branches: main (production) · develop (staging)"
echo "  🏷️  Tag:      v1.0"
echo ""
echo "Branch strategy:"
echo "  main    ← production  (index.html = source of truth)"
echo "  develop ← staging     (preview.html + staging/ files)"
echo ""
echo "Next: open GitHub → Settings → Branches → add protection rules:"
echo "  • Require PR for main"
echo "  • Require PR for develop"
echo ""
git log --oneline --all --decorate
echo ""
