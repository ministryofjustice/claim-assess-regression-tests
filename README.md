# claim-assess-regression-tests

Automated tests for claim and assess applications.

## Pre-requisites
* [Docker](https://www.docker.com/products/docker-desktop/)
* [Node](https://github.com/nvm-sh/nvm)
* Yarn
  * `corepack enable`
  * `yarn install`
* Playwright
  * `yarn playwright install`
* [pre-commit](https://formulae.brew.sh/formula/pre-commit)
  * `brew install pre-commit`
  * `pre-commit install`

## Tests

### Overview
We use Cucumber and Playwright tests for UI testing.

### Run tests
First, consider running `./restart-all.sh` to do a full rebuild of the different services.

To run all tests, run `./e2e.sh`.

On the first time running the E2E tests you might be prompted for a password. Enter your machine password, this is required to run a sudo command to update hostname mappings in `etc/hosts`.

Alternatively, to run a subset of tests:
* with a specific tag, e.g. @smoke, run `./e2e.sh @smoke`
* with multiple specific tags, e.g. @smoke and @assess, run `./e2e.sh @smoke and @assess`
* with one of several tags, e.g. @assess or @claim, run `./e2e.sh @assess or @claim`

### Add role-based users
Users are mounted to the docker `stub-oidc-server` container at runtime via the [stub.yml](/config/users.yml) file.
Additional users can be added here for use in the tests.
