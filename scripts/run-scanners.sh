#!/usr/bin/env bash
# Aegis scanner runner. Runs the real scanners against a built site directory.
# Usage: run-scanners.sh <site-dir>
# Exit 0: all scanners passed. Exit 1: findings. Exit 2: usage error.
# Exit 3: incomplete audit, one or more scanners not installed.
set -u

TARGET="${1:-}"
if [ -z "$TARGET" ] || [ ! -d "$TARGET" ]; then
  echo "usage: run-scanners.sh <site-dir>" >&2
  exit 2
fi

FAIL=0
INCOMPLETE=0
echo "=== aegis scanners: $TARGET ==="

if command -v semgrep >/dev/null 2>&1; then
  echo "--- semgrep ---"
  semgrep --config auto --quiet --error "$TARGET" || FAIL=1
else
  echo "--- semgrep: NOT INSTALLED (pip install semgrep) ---"
  INCOMPLETE=1
fi

if [ -f "$TARGET/package.json" ] && command -v npm >/dev/null 2>&1; then
  echo "--- npm audit ---"
  (cd "$TARGET" && npm audit --audit-level=moderate) || FAIL=1
else
  echo "--- npm audit: no package.json or npm missing, skipping ---"
  INCOMPLETE=1
fi

if command -v pa11y >/dev/null 2>&1; then
  echo "--- pa11y ---"
  for f in "$TARGET"/index.html "$TARGET"/**/index.html; do
    [ -f "$f" ] || continue
    echo "page: $f"
    pa11y --standard WCAG2AA "file://$f" || FAIL=1
  done
else
  echo "--- pa11y: NOT INSTALLED (npm i -g pa11y) ---"
  INCOMPLETE=1
fi

if [ "$INCOMPLETE" -eq 1 ]; then
  echo "=== aegis: INCOMPLETE audit, one or more scanners missing ==="
  exit 3
fi
if [ "$FAIL" -eq 0 ]; then
  echo "=== aegis: all scanners passed ==="
else
  echo "=== aegis: findings above ==="
fi
exit "$FAIL"
