#!/usr/bin/env bash
set -euo pipefail

export HEADLESS=false
export TEST_ENV=local

trap './stop-all.sh' EXIT

./start-all.sh || echo "Warning: start-all.sh failed, continuing..."

if [[ $# -eq 0 ]]; then
  npx cucumber-js --config cucumber.json
else
  npx cucumber-js --config cucumber.json --tags "$*"
fi