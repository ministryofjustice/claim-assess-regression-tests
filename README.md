# claim-assess-regression-tests

Automated tests for claim and assess applications.

## Pre-requisites
* Docker
* Node
* Yarn
  * `corepack enable`
  * `yarn install`
* Playwright
  * `yarn playwright install`

## Tests

### Overview
We use Cucumber and Playwright tests for UI testing.

### Run tests
1. `docker compose -f docker-compose.local.yml up -d` (additionally you can pass in `--build --force-recreate` to restart the containers with fresh images)
2. `yarn run test:local`

### Add role-based users
Users are mounted to the docker `stub-oidc-server` container at runtime via the [stub.yml](/stub.yml) file.
Additional users can be added here for use in the tests.
