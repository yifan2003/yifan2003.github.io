#!/usr/bin/env bash
set -euo pipefail
source "$(dirname -- "$0")/env.sh"
cd "$SITE_ROOT"

for tool in hugo go node pnpm; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    printf 'Missing %s. Install the documented tools, or run ./scripts/setup-local.sh on an Apple Silicon Mac.\n' "$tool" >&2
    exit 1
  fi
done

command="${1:-serve}"
if [ "$#" -gt 0 ]; then shift; fi
case "$command" in
  serve|dev)
    exec hugo server --disableFastRender --bind 127.0.0.1 "$@"
    ;;
  build)
    hugo --minify "$@"
    exec pnpm run pagefind
    ;;
  install)
    exec pnpm install --frozen-lockfile --store-dir "$SITE_TOOLS/pnpm-store" "$@"
    ;;
  versions)
    hugo version
    go version
    node --version
    pnpm --version
    ;;
  *)
    printf 'Usage: %s {serve|build|install|versions} [arguments]\n' "$0" >&2
    exit 2
    ;;
esac

