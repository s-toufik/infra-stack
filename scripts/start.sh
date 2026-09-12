#!/usr/bin/env bash

set -euo pipefail

echo "Starting development infrastructure..."

docker compose up -d

echo
echo "Infrastructure started."
echo
echo "Services:"
echo
echo "  PostgreSQL       localhost:5432"
echo "  MongoDB          localhost:27017"
echo "  Grafana          http://localhost:3000"
echo "  Loki             http://localhost:3100"
echo "  OTLP gRPC        localhost:4317"
echo "  OTLP HTTP        http://localhost:4318"
echo
echo "Run 'make status' to check service health."
