#!/usr/bin/env bash

set -e

# # Create a bash function to run super-linter
function gh_super_linter() {
    # Start docker desktop if it's not running
    source "$PWD/.github/scripts/server.sh"

    # Run the docker container
    docker run --rm \
        -e RUN_LOCAL=true \
        --env-file ".github/super-linter.env" \
        -v "$PWD":/tmp/lint github/super-linter:slim-v5
}

# Create a bash function to run checkov
function checkov() {
    # Start docker desktop if it's not running
    source "$PWD/.github/scripts/server.sh"

    # Run the docker container
    docker run -it --rm \
        -v "$PWD":/tmp/lint --workdir /tmp/lint \
        bridgecrew/checkov \
        --directory /tmp/lint \
        --soft-fail \
        --quiet
}

# Create a bash function to run trivy
function trivy() {
    # Start docker desktop if it's not running
    source "$PWD/.github/scripts/server.sh"

    # Run the docker container
    docker run -it --rm \
        -v "$PWD":/tmp/lint --workdir /tmp/lint \
        aquasec/trivy:latest \
        fs --scanners vuln,config,secret .
}
