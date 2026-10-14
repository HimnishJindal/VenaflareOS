#!/usr/bin/env bash
set -e
npm ci
# creds live in gitignored .env.local; reuse the root checkout's copy
if [ -f "$SUPERSET_ROOT_PATH/.env.local" ] && [ ! -f .env.local ]; then
  cp "$SUPERSET_ROOT_PATH/.env.local" .env.local
fi
