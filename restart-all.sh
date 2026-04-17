#!/usr/bin/env bash
set -euo pipefail

./ensure-hosts.sh

echo "Building laa-claim-for-payment-stubs"
(cd ../laa-claim-for-payment-stubs && ./gradlew clean build)

echo "Building laa-claim-for-payment"
(cd ../laa-claim-for-payment && ./gradlew clean build)

echo "Building laa-claim-for-payment-frontend"
(cd ../laa-claim-for-payment-frontend && yarn install && yarn build)

echo "Building laa-assess-a-claim-frontend"
(cd ../laa-assess-a-claim-frontend && yarn install && yarn build)

docker compose -f docker-compose.yml -f docker-compose.local.yml build --no-cache
docker compose -f docker-compose.yml -f docker-compose.local.yml up --force-recreate -d