#!/usr/bin/env bash

set -euo pipefail

export DOCKER_CONTEXT=default

docker compose ps
