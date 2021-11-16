# Demo of Snyk IaC Custom Rules

## Overview

A demo for how to write, test and distribute your own custom rules for the Snyk IaC product.

For more details and examples see the [documentation](https://docs.snyk.io/products/snyk-infrastructure-as-code/custom-rules)

## Examples

This repository currently has two example Kubernetes rules which

- [BEN-K8S-1](rules/BEN-K8S-1/main.rego) checks that container images are being pulled from an approved registry
- [BEN-K8S-2](rules/BEN-K8S-2/main.rego) checks that the container image is referencing a specific tag, not `latest`

## Workflow

This repository demonstrates a pull-request based workflow, with commit status checks enabled so that the development workflow needs to pass before the PR can be merged.

Upon merging the Pull Request the release process is kicked off

### Setup

- Create a fork of this repository
- Setup some GitHub secrets
  - `SNYK_TOKEN` this should be your API token - either personal or service token
  - `OCI_REGISTRY_USERNAME` this is the username for your OCI registry, e.g. DockerHub username
  - `OCI_REGISTRY_PASSWORD` this is your password, if you're using DockerHub this should ideally be a token not your personal password

### Making a change

Local Development

- Ensure you are upto date with `git pull`
- Create a new branch locally, this should be named `feat/<name>` e.g. `feat/ben-k8s-3`
- Make your change - e.g. adding a new rule
  - Add your integration tests into the `/integration/spec/snyk_spec.sh`
- Run your unit tests with `snyk-iac-rules test`
- Build your rules with `snyk-iac-rules build`
- Finally if this all passes, run `make int` to run your integration tests
  - You'll need to target a Snyk org which has Custom Rules _disabled_ so that you can pass in a local bundle. You do this with `snyk config set org=orgname`
- If the tests pass go ahead and commit your changes and push

Open a Pull Request

- In GitHub open a new pull request
  - This will kick off a GitHub action which
  - Runs the unit tests, build & integration tests
  - If these all pass then the PR can be merged

### Release process

When the PR has passed all of the checks:

- Merge the Pull Requests into `main`
- This will kick off the release process
  - Runs the unit tests & build
  - Increments the patch on the version
  - Tags the commit and creates a release
  - Uploads the `bundle.tar.gz` file to the release
  - Pushes the artefact to your configured
  - Configures your Snyk Group with the Bundle location & specific tag to be used

.
