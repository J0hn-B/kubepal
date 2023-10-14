#!/usr/bin/env bash

set -e

# # #  WSL  # # #

# Start Docker Desktop if it's not running
if ! docker ps; then
    powershell.exe "Start-Process -FilePath 'C:\Program Files\Docker\Docker\Docker Desktop.exe'"
    while ! docker ps; do # Wait for Docker to start
        echo "==> Docker is starting"
        sleep 3
    done
else
    echo "==> Docker is running"
fi

# # #  WSL  # # #
