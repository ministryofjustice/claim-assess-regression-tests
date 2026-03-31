#!/usr/bin/env bash
set -euo pipefail

# Update hostname mappings if not already done
ENTRY="127.0.0.1 stub-oidc-server"
HOSTS_FILE="/etc/hosts"
if ! grep -qxF "$ENTRY" "$HOSTS_FILE"; then
  echo "$ENTRY" | sudo tee -a "$HOSTS_FILE" > /dev/null
fi

# Additionally add --build --force-recreate to restart the containers with fresh images
docker compose -f docker-compose.yml -f docker-compose.local.yml up --build --force-recreate -d