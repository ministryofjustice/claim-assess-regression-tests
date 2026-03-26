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
To run all tests, run `./e2e.sh`.

Alternatively, to run a subset of tests:
* with a specific tag, e.g. @smoke, run `./e2e.sh @smoke`
* with multiple specific tags, e.g. @smoke and @assess, run `./e2e.sh @smoke and @assess`
* with one of several tags, e.g. @assess or @claim, run `./e2e.sh @assess or @claim`

### Add role-based users
Users are mounted to the docker `stub-oidc-server` container at runtime via the [stub.yml](/stub.yml) file.
Additional users can be added here for use in the tests.
