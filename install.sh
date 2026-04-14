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
