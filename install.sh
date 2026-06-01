#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="$(cd "$(dirname "$0")/bin" && pwd)"
DEST_DIR="$HOME/.local/bin"

mkdir -p "$DEST_DIR"

for f in "$SRC_DIR"/*; do
  name="$(basename "$f")"
  cp "$f" "$DEST_DIR/$name"
  chmod +x "$DEST_DIR/$name"
  echo "installed: $name"
done

echo "done → $DEST_DIR"

echo

if [[ ":$PATH:" != *":$DEST_DIR:"* ]]; then
  echo "WARNING: $DEST_DIR is not in PATH"
  echo "Tools installed but may not be callable by name."
fi
