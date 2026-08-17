#!/bin/bash
# Veritas Wiki RMI Auto-Update — runs the RMI service and commits/pushes new reports
# Triggered by cron weekly (default Monday 07:00 UTC) or on-demand.
# Uses SSH for git push (no PAT required).

set -e
REPO="/workspace/veritasdevelopment-wiki"
SRC="/workspace/hermes-personal-os/clients/veritas"
LOG="/workspace/hermes-personal-os/clients/veritas/wiki/log.md"
TS=$(date -u +%Y-%m-%d)
TS_LOG=$(date -u +%Y-%m-%dT%H:%M:%SZ)

echo "[$TS_LOG] Veritas wiki auto-update starting"

cd "$REPO" || { echo "FATAL: repo not found at $REPO"; exit 1; }

# 1. Pull latest wiki state from remote (in case manual edits happened)
git pull --rebase origin main 2>&1 | tail -3

# 2. Copy fresh RMI reports from the source-of-truth client folder
mkdir -p reports
for f in "$SRC"/rmi/reports/*; do
    [ -e "$f" ] || continue
    name=$(basename "$f")
    cp -u "$f" "reports/$name"
done

# 3. Sync full Jackson County intelligence structure + SEO + Lee's Summit market
# Replaces old single BTR subdirectory sync with the full organized tree
mkdir -p market/jackson-county market/lees-summit/btr market/seo
for src_dir in market/jackson-county market/lees-summit market/seo; do
    [ -d "$SRC/$src_dir" ] || continue
    cp -ru "$SRC/$src_dir/." "$REPO/$src_dir/" 2>/dev/null || true
done

# 4. Sync investor profiles
mkdir -p investors/clarity-equity-fund
[ -d "$SRC/investors/clarity-equity-fund" ] && cp -ru "$SRC/investors/clarity-equity-fund/." "investors/clarity-equity-fund/" 2>/dev/null || true

# 5. Sync raw wiki articles
mkdir -p wiki-raw
[ -d "$SRC/wiki/raw/articles" ] && cp -ru "$SRC/wiki/raw/articles/." "wiki-raw/" 2>/dev/null || true

# 6. Stage + commit only if there are real changes
git add -A
if git diff --cached --quiet; then
    echo "[$TS_LOG] No changes to commit."
    exit 0
fi

git commit -m "RMI auto-update $TS

- Refreshed reports (RMI baseline + trend runs)
- Synced market intelligence from clients/veritas
- Synced investor profiles
- Synced raw wiki articles

Source: hermes-personal-os/clients/veritas/" 2>&1 | tail -3

# 7. Push via SSH (works with the deployed SSH key)
git push origin main 2>&1 | tail -5

echo "[$TS_LOG] Veritas wiki auto-update complete"

# 8. Append a log entry
cat >> "$LOG" <<EOF

## [$TS] auto-update | Veritas wiki refreshed via SSH
- Pulled latest from origin, copied fresh RMI reports + market + investor + raw wiki content
- Committed and pushed via SSH
EOF
