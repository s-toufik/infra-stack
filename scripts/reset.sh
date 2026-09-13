#!/usr/bin/env bash

set -euo pipefail

export DOCKER_CONTEXT=default

echo "WARNING:"
echo "This will stop the stack and DELETE all persistent data."
echo
echo "The following will be deleted:"
echo "  - PostgreSQL data"
echo "  - MongoDB data"
echo "  - Loki data"
echo "  - Grafana data"
echo

read -r -p "Continue? [y/N] " answer

if [[ "${answer}" != "y" && "${answer}" != "Y" ]]; then
    echo "Reset cancelled."
    exit 0
fi

docker compose down -v --remove-orphans

echo
echo "Infrastructure reset."
