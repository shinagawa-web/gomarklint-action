#!/bin/sh
set -e

CONFIG_FILE=".gomarklint.json"

if [ -f "$CONFIG_FILE" ]; then
  echo "✅ Found $CONFIG_FILE"
else
  echo "❌ $CONFIG_FILE not found. This action requires a config file."
  exit 1
fi

exec gomarklint "$@"
