#!/usr/bin/env bash
set -euo pipefail

PORT="${1:-3000}"

trap './stop-all.sh' EXIT

./start-all.sh

npx playwright codegen "http://localhost:${PORT}"