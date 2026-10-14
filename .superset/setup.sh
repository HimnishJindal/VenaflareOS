#!/usr/bin/env bash
set -e
# gitignored local config: reuse the root checkout's copies (dev-local.sh regenerates .env.dev if absent)
for f in .env.dev desktop/backend-go/.env frontend/.env.development.local; do
  if [ -f "$SUPERSET_ROOT_PATH/$f" ] && [ ! -f "$f" ]; then
    cp "$SUPERSET_ROOT_PATH/$f" "$f"
  fi
done
(cd frontend && pnpm install --frozen-lockfile)
(cd desktop/backend-go && go mod download)
