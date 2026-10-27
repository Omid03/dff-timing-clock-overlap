#!/usr/bin/env bash
set -euo pipefail
repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
command -v hspice >/dev/null || { echo "hspice is not on PATH" >&2; exit 1; }
for model in mm018.l 32nm_bulk.pm; do
  [[ -f "$repo_dir/models/$model" ]] || { echo "Missing models/$model" >&2; exit 1; }
done
mkdir -p "$repo_dir/runs"
cd "$repo_dir/netlists"
for deck in *.sp; do
  hspice -i "$deck" -o "$repo_dir/runs/${deck%.sp}"
done
