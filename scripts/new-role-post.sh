#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ROLES_DIR="$ROOT_DIR/content/roles"

if [[ $# -lt 1 ]]; then
  echo "Usage: scripts/new-role-post.sh \"Role Title\" [slug]" >&2
  exit 1
fi

TITLE="$1"
SLUG="${2:-}"
TITLE_ESCAPED="${TITLE//\"/\\\"}"

if [[ -z "$SLUG" ]]; then
  SLUG="$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+|-+$//g')"
fi

if [[ -z "$SLUG" ]]; then
  echo "Unable to derive a valid slug. Provide slug as second argument." >&2
  exit 1
fi

mkdir -p "$ROLES_DIR"
ROLE_ID="$("$ROOT_DIR/scripts/next-role-id.sh")"
OUT_FILE="$ROLES_DIR/$SLUG.md"
TODAY="$(date +%F)"

if [[ -f "$OUT_FILE" ]]; then
  echo "File already exists: $OUT_FILE" >&2
  exit 1
fi

cat > "$OUT_FILE" <<EOF
---
title: "$TITLE_ESCAPED"
date: $TODAY
draft: true
role_id: "$ROLE_ID"
status: "open"
update_of_role_id: ""
duplicate_of_role_id: ""
---

## Summary

## Details
EOF

echo "Created: ${OUT_FILE#$ROOT_DIR/}"
echo "Role ID: $ROLE_ID"
