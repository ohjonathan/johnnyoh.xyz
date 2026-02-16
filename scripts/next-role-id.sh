#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ROLES_DIR="$ROOT_DIR/content/roles"
YEAR="${1:-$(date +%Y)}"
MAX_SEQ=0

if [[ -d "$ROLES_DIR" ]]; then
  while IFS= read -r line; do
    id="$(echo "$line" | rg -o "ROLE-$YEAR-[0-9]{4}" || true)"
    [[ -z "$id" ]] && continue
    seq="${id##ROLE-$YEAR-}"
    if [[ "$seq" =~ ^[0-9]{4}$ ]]; then
      seq_num=$((10#$seq))
      if (( seq_num > MAX_SEQ )); then
        MAX_SEQ=$seq_num
      fi
    fi
  done < <(rg -N --glob '*.md' "role_id:[[:space:]]*\"?ROLE-$YEAR-[0-9]{4}\"?" "$ROLES_DIR" 2>/dev/null | sort -u || true)
fi

NEXT_SEQ=$((MAX_SEQ + 1))
printf "ROLE-%s-%04d\n" "$YEAR" "$NEXT_SEQ"
