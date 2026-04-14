#!/usr/bin/env bash
set -euo pipefail

# Update hostname mappings if not already done
ENTRY="127.0.0.1 stub-oidc-server"
HOSTS_FILE="/etc/hosts"
if ! grep -qxF "$ENTRY" "$HOSTS_FILE"; then
  echo "$ENTRY" | sudo tee -a "$HOSTS_FILE" > /dev/null
fi

#cd ..
#cd laa-claim-for-payment-stubs
#./gradlew clean build
#
#cd ..
#cd laa-claim-for-payment
#./gradlew clean build
#
#cd ..
#cd laa-claim-for-payment-frontend
#yarn install
#yarn build
#
#cd ..
#cd laa-assess-a-claim-frontend
#yarn install
#yarn build
#
#cd ..
#cd claim-assess-regression-tests

# Additionally add --build --force-recreate to restart the containers with fresh images
docker compose -f docker-compose.yml -f docker-compose.local.yml up --build --force-recreate -d 