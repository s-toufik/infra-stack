#!/usr/bin/env bash

set -euo pipefail

export DOCKER_CONTEXT=default

echo "Stopping development infrastructure..."

docker compose down

echo "Infrastructure stopped."
echo
echo "Persistent volumes were preserved."
