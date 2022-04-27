#!/usr/bin/env bash
set -euo pipefail

ead() {
  printf "%s\n" "$*"
  "$@"
}

scriptDir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "$scriptDir"

imageName=ghcr.io/floj/bibliogram

declare -a dockerOpts=(-t "$imageName")

if [[ -n "${FORCE_BUILD:-}" ]]; then
  dockerOpts+=("--no-cache")
fi

ead docker build "${dockerOpts[@]}" "$scriptDir"
if [[ -n "${PUSH:-}" ]]; then
  docker push "$imageName"
fi
