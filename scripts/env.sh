#!/usr/bin/env bash
# Source this file to use the optional, project-local toolchain.
# No tools or caches are written to the user's global installation.
SITE_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
SITE_TOOLS="$SITE_ROOT/.tools"
export PATH="$SITE_TOOLS/bin:$SITE_TOOLS/node/bin:$SITE_TOOLS/go/bin:$SITE_TOOLS/pnpm/node_modules/.bin:$PATH"
export GOPATH="$SITE_TOOLS/gopath"
export GOMODCACHE="$SITE_TOOLS/cache/go-mod"
export GOCACHE="$SITE_TOOLS/cache/go-build"
export GOTOOLCHAIN=local
export HUGO_CACHEDIR="$SITE_TOOLS/cache/hugo"
export XDG_CACHE_HOME="$SITE_TOOLS/cache"
export npm_config_cache="$SITE_TOOLS/cache/npm"
export PNPM_HOME="$SITE_TOOLS/pnpm-home"
export COREPACK_HOME="$SITE_TOOLS/cache/corepack"

