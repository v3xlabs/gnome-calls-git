#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: $0 /path/to/aur/checkout" >&2
  exit 1
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "${script_dir}/.." && pwd)"
package_dir="${repo_root}/aur/gnome-calls-git"
destination_dir="$1"

if [[ ! -d "${destination_dir}" ]]; then
  echo "destination does not exist: ${destination_dir}" >&2
  exit 1
fi

rsync \
  --archive \
  --delete \
  --exclude '.git' \
  "${package_dir}/" \
  "${destination_dir}/"

echo "Synced ${package_dir} -> ${destination_dir}"
