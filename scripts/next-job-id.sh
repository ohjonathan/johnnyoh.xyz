#!/usr/bin/env bash
set -euo pipefail

echo "Deprecated: use scripts/next-role-id.sh" >&2
exec "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/next-role-id.sh" "$@"
