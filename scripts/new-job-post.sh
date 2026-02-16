#!/usr/bin/env bash
set -euo pipefail

echo "Deprecated: use scripts/new-role-post.sh" >&2
exec "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/new-role-post.sh" "$@"
