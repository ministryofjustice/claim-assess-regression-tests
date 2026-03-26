#!/usr/bin/env bash
set -euo pipefail

# Additionally add --build --force-recreate to restart the containers with fresh images
docker compose -f docker-compose.yml -f docker-compose.local.yml up -d