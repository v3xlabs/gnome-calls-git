#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "${script_dir}/.." && pwd)"
package_dir="${repo_root}/aur/gnome-calls-git"

if [[ "$(id -u)" -eq 0 ]]; then
  su nobody -s /bin/bash -c "cd \"${package_dir}\" && HOME=/tmp makepkg --printsrcinfo" > "${package_dir}/.SRCINFO"
else
  cd "${package_dir}"
  makepkg --printsrcinfo > .SRCINFO
fi
