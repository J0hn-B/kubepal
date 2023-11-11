#!/usr/bin/env bash

# This script is used to hold all testing/linting functions for the project

set -e

# Bash function to run Super-Linter
function gh_super_linter() {
    # Start docker desktop if it's not running
    source "$PWD/.github/scripts/server.sh"

    # Run the docker container
    docker run --rm \
        -e RUN_LOCAL=true \
        --env-file ".github/super-linter.env" \
        -v "$PWD":/tmp/lint github/super-linter:slim-v5
}

# Bash function to  run Checkov
function checkov() {
    # Start docker desktop if it's not running
    source "$PWD/.github/scripts/server.sh"

    # Run the docker container
    docker run --rm \
        -v "$PWD":/tmp/lint --workdir /tmp/lint \
        bridgecrew/checkov \
        --directory /tmp/lint \
        --quiet
}

# Bash function to run Trivy
function trivy() {
    # Start docker desktop if it's not running
    source "$PWD/.github/scripts/server.sh"

    # Run the docker container
    docker run --rm \
        -v "$PWD":/tmp/lint --workdir /tmp/lint \
        aquasec/trivy:latest \
        fs --scanners vuln,config,secret . \
        --severity CRITICAL,HIGH,MEDIUM
}

# Bash function to return the names of all the changed files
function get_changed_files() {
    # Get the list of changed files
    git --no-pager diff --stat
}

# Bash function to run kubescape checks
function kube_scape() {
    # Install Kubescape if it's not installed
    if ! command -v kubescape &>/dev/null; then
        echo "==> Installing Kubescape"
        brew install kubescape
    else
        # Scan running Kubernetes cluster
        echo "==> Scanning running Kubernetes cluster"
        kubescape scan
    fi
}
