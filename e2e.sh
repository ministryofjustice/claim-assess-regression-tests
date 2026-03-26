#!/usr/bin/env bash
set -euo pipefail

TEST_ENV=local

docker compose -f docker-compose.yml -f docker-compose.local.yml up -d

if [[ $# -eq 0 ]]; then
  cucumber-js --config cucumber.json
else
  cucumber-js --config cucumber.json --tags "$*"
fi

