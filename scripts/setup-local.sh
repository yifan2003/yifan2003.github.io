#!/usr/bin/env bash
# Optional bootstrap for Apple Silicon macOS. All downloads, tools, and caches
# stay in .tools; this never runs a system package installer.
set -euo pipefail
source "$(dirname -- "$0")/env.sh"
cd "$SITE_ROOT"

if [ "$(uname -s)" != Darwin ] || [ "$(uname -m)" != arm64 ]; then
  printf 'This bootstrap supports Apple Silicon macOS. On other platforms, install Hugo extended 0.157.0, Go, Node 22, and pnpm 10.14.0, then run ./scripts/site.sh install.\n' >&2
  exit 1
fi

mkdir -p "$SITE_TOOLS/downloads" "$SITE_TOOLS/bin"
download() {
  local url="$1" checksum="$2" destination="$SITE_TOOLS/downloads/$3"
  if [ ! -f "$destination" ]; then
    curl --fail --location --retry 3 --output "$destination.part" "$url"
    mv "$destination.part" "$destination"
  fi
  local actual
  actual="$(shasum -a 256 "$destination")"
  actual="${actual%% *}"
  if [ "$actual" != "$checksum" ]; then
    printf 'Checksum mismatch: %s\nExpected: %s\nActual: %s\n' "$destination" "$checksum" "$actual" >&2
    exit 1
  fi
  printf 'Verified %s\n' "$3"
}

download 'https://nodejs.org/dist/v22.23.4/node-v22.23.4-darwin-arm64.tar.gz' \
  c9e1dbc748b33ed2d14f42445191ecaf14c56259c7a9a26d0042c49ec2b66428 \
  node-v22.23.4-darwin-arm64.tar.gz
download 'https://go.dev/dl/go1.27.3.darwin-arm64.tar.gz' \
  dd3908cf20959d798c1e06ebe5b72213f0505ce01373b40ce3110975a6cd99c2 \
  go1.27.3.darwin-arm64.tar.gz
download 'https://github.com/gohugoio/hugo/releases/download/v0.157.0/hugo_extended_0.157.0_darwin-universal.pkg' \
  4118c3218f362d9e8be28d8c66fb35ead1b0bfc2f79e297cafa1dfafd7d52a91 \
  hugo_extended_0.157.0_darwin-universal.pkg

if [ ! -x "$SITE_TOOLS/node/bin/node" ]; then
  mkdir -p "$SITE_TOOLS/node"
  tar -xzf "$SITE_TOOLS/downloads/node-v22.23.4-darwin-arm64.tar.gz" \
    --strip-components=1 -C "$SITE_TOOLS/node"
fi
if [ ! -x "$SITE_TOOLS/go/bin/go" ]; then
  tar -xzf "$SITE_TOOLS/downloads/go1.27.3.darwin-arm64.tar.gz" -C "$SITE_TOOLS"
fi
if [ ! -x "$SITE_TOOLS/bin/hugo" ]; then
  if [ ! -d "$SITE_TOOLS/hugo-package" ]; then
    pkgutil --expand-full "$SITE_TOOLS/downloads/hugo_extended_0.157.0_darwin-universal.pkg" \
      "$SITE_TOOLS/hugo-package"
  fi
  hugo_binary="$(find "$SITE_TOOLS/hugo-package" -type f -name hugo -print -quit)"
  if [ -z "$hugo_binary" ]; then
    printf 'Could not locate the Hugo executable in the verified package.\n' >&2
    exit 1
  fi
  cp "$hugo_binary" "$SITE_TOOLS/bin/hugo"
  chmod +x "$SITE_TOOLS/bin/hugo"
fi

if [ ! -x "$SITE_TOOLS/pnpm/node_modules/.bin/pnpm" ]; then
  npm install --prefix "$SITE_TOOLS/pnpm" --no-package-lock --ignore-scripts pnpm@10.14.0
fi
"$SITE_ROOT/scripts/site.sh" versions
"$SITE_ROOT/scripts/site.sh" install
