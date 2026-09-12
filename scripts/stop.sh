#!/usr/bin/env bash

set -euo pipefail

echo "Stopping development infrastructure..."

docker compose down

echo "Infrastructure stopped."
echo
echo "Persistent volumes were preserved."
