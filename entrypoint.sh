#!/bin/sh
set -e

if [ -f ".gomarklint.json" ]; then
  echo "✅ Found .gomarklint.json"
else
  echo "⚠️  .gomarklint.json not found. Proceeding with default config."
fi

exec gomarklint "$@"
