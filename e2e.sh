#!/usr/bin/env bash
set -euo pipefail

TEST_ENV=local

./start-all.sh

if [[ $# -eq 0 ]]; then
  npx cucumber-js --config cucumber.json
else
  npx cucumber-js --config cucumber.json --tags "$*"
fi

./stop-all.sh