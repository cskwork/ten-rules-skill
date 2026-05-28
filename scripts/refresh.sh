#!/usr/bin/env bash
# Refresh the vendored rule snapshots in ref/ from their upstream cskwork repos.
# Only upstream-sourced files are overwritten; the authored INDEX.md files are left untouched.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REF="$REPO_ROOT/ref"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

clone() { git clone --depth 1 "https://github.com/cskwork/$1.git" "$TMP/$1" >/dev/null 2>&1; }

echo "Refreshing rule snapshots into $REF ..."

clone web-design-10-rules
cp "$TMP/web-design-10-rules/rules/"*.md "$REF/web-design/"

clone communication-10-rules
cp "$TMP/communication-10-rules/rules/"*.md "$REF/communication/"

clone investment-agent-rules
cp "$TMP/investment-agent-rules/rules/common/"*.md       "$REF/investment/common/"
cp "$TMP/investment-agent-rules/rules/kr-equity/"*.md    "$REF/investment/kr-equity/"
cp "$TMP/investment-agent-rules/rules/quant-bot/"*.md    "$REF/investment/quant-bot/"

clone coding-agent-rules
cp "$TMP/coding-agent-rules/AGENTS.md" "$REF/coding/ten-commandments.md"

clone planning-doc-rules
cp "$TMP/planning-doc-rules/AGENTS.md" "$REF/planning/ten-rules.md"

echo "Done. Review changes with: git -C \"$REPO_ROOT\" status"
