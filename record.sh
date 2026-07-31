#!/usr/bin/env bash
set -euo pipefail

PORT="${1:-3000}"

trap './stop-all.sh' EXIT

./start-all.sh || echo "Warning: start-all.sh failed, continuing..."

npx playwright codegen "http://localhost:${PORT}"