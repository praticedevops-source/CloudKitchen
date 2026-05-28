#!/bin/bash
# ╔══════════════════════════════════════════════════════════════╗
# ║   Wooster Street Kitchen — SSH Push to GitHub               ║
# ║   Run once from Terminal: bash push-to-github-ssh.sh        ║
# ╚══════════════════════════════════════════════════════════════╝

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
SSH_KEY="$HOME/.ssh/id_ed25519_ck"
REMOTE_SSH="git@github.com:praticedevops-source/CloudKitchen.git"

echo ""
echo "🔥 Wooster Street Kitchen — SSH Push to GitHub"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# ─── STEP 1: Write SSH private key ────────────────────────────────────────────
echo "STEP 1 — Installing SSH key"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━"
mkdir -p "$HOME/.ssh"
cat > "$SSH_KEY" << 'SSHKEY'
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
QyNTUxOQAAACDGW9N73OROFvHdmjH45aLNWz4dZ/k7iE+r6rI9Y4yk2QAAALjoC7YO6Au2
DgAAAAtzc2gtZWQyNTUxOQAAACDGW9N73OROFvHdmjH45aLNWz4dZ/k7iE+r6rI9Y4yk2Q
AAAEBIAu8TnjGsz6tn1C5DObfsWazJEbY6mvKGFXWIstpBEsZb03vc5E4W8d2aMfjlos1b
Ph1n+TuIT6vqsj1jjKTZAAAAMUNsb3VkS2l0Y2hlbi1kZXBsb3ktbmlraGlsa3Jpc2huYX
JlZGR5MkBnbWFpbC5jb20BAgME
-----END OPENSSH PRIVATE KEY-----
SSHKEY
chmod 600 "$SSH_KEY"
echo "  ✅ SSH key saved to $SSH_KEY"
echo ""

# ─── STEP 2: Configure SSH for GitHub ─────────────────────────────────────────
echo "STEP 2 — Configuring SSH"
echo "━━━━━━━━━━━━━━━━━━━━━━━━"
SSH_CONFIG="$HOME/.ssh/config"
if ! grep -q "Host github.com" "$SSH_CONFIG" 2>/dev/null; then
  cat >> "$SSH_CONFIG" << 'SSHCONF'

Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519_ck
  IdentitiesOnly yes
SSHCONF
  chmod 600 "$SSH_CONFIG"
  echo "  ✅ SSH config updated"
else
  echo "  ✅ SSH config already has github.com entry"
fi
echo ""

# ─── STEP 3: Test SSH connection ──────────────────────────────────────────────
echo "STEP 3 — Testing GitHub SSH connection"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
SSH_RESULT=$(ssh -i "$SSH_KEY" -o StrictHostKeyChecking=no -T git@github.com 2>&1 || true)
if echo "$SSH_RESULT" | grep -q "successfully authenticated"; then
  echo "  ✅ GitHub SSH auth: OK"
else
  echo "  ℹ️  SSH response: $SSH_RESULT"
fi
echo ""

# ─── STEP 4: Set up git repo ──────────────────────────────────────────────────
echo "STEP 4 — Setting up git repository"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
cd "$REPO_DIR"

# Remove stale lock files
rm -f .git/index.lock 2>/dev/null || true

if [ ! -d ".git" ]; then
  git init
  git config init.defaultBranch main
  echo "  ✅ Git initialized"
else
  echo "  ✅ Git repo already exists"
fi

git config user.name  "Nikhil"
git config user.email "nikhilkrishnareddy2@gmail.com"

# Add all files
echo "push-to-github-ssh.sh" >> .gitignore 2>/dev/null || true
sort -u .gitignore -o .gitignore 2>/dev/null || true
git add -A

# Initial commit if needed
if ! git rev-parse HEAD &>/dev/null 2>&1; then
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

Tech: Three.js r128 · CSS custom properties · IntersectionObserver"
  git tag -a v1.0 -m "v1.0: Initial production build" 2>/dev/null || true
  echo "  ✅ Initial commit + v1.0 tag created"
else
  echo "  ✅ Commits already exist"
  # Tag v1.0 if not tagged
  git tag -a v1.0 -m "v1.0: Initial production build" 2>/dev/null || echo "  ✅ v1.0 tag already exists"
fi

# Ensure main branch
CURRENT=$(git branch --show-current)
if [ "$CURRENT" != "main" ]; then
  git branch -M main 2>/dev/null || true
fi
echo ""

# ─── STEP 5: Create develop branch ────────────────────────────────────────────
echo "STEP 5 — Setting up develop branch"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if git show-ref --verify --quiet refs/heads/develop; then
  echo "  ✅ develop branch already exists"
else
  git checkout -b develop
  git checkout main
  echo "  ✅ develop branch created"
fi
echo ""

# ─── STEP 6: Set remote to SSH ────────────────────────────────────────────────
echo "STEP 6 — Configuring remote (SSH)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if git remote get-url origin &>/dev/null 2>&1; then
  git remote set-url origin "$REMOTE_SSH"
  echo "  ✅ Remote updated to SSH URL"
else
  git remote add origin "$REMOTE_SSH"
  echo "  ✅ Remote added"
fi
echo ""

# ─── STEP 7: Push main → GitHub ───────────────────────────────────────────────
echo "STEP 7 — Pushing main to GitHub"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
git checkout main
GIT_SSH_COMMAND="ssh -i $SSH_KEY -o StrictHostKeyChecking=no" git push -u origin main --tags --force
echo "  ✅ main + v1.0 tag pushed"
echo ""

# ─── STEP 8: Push develop → GitHub ────────────────────────────────────────────
echo "STEP 8 — Pushing develop to GitHub"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
git checkout develop
GIT_SSH_COMMAND="ssh -i $SSH_KEY -o StrictHostKeyChecking=no" git push -u origin develop --force
echo "  ✅ develop pushed"
git checkout main
echo ""

# ─── Done ─────────────────────────────────────────────────────────────────────
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎉  ALL DONE!"
echo ""
echo "  🌐 GitHub:   https://github.com/praticedevops-source/CloudKitchen"
echo "  🌿 Branches: main (production) · develop (staging)"
echo "  🏷️  Tag:      v1.0"
echo "  🔑 SSH key:  $SSH_KEY"
echo ""
git log --oneline --all --decorate
echo ""
