#!/usr/bin/env bash
set -euo pipefail

./ensure-hosts.sh

docker compose -f docker-compose.yml -f docker-compose.local.yml up -d