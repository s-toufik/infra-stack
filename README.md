# Local Development Infrastructure

Local infrastructure for development.

## Included

- PostgreSQL
- MongoDB
- Grafana
- Loki
- OpenTelemetry Collector
- Qwen3 and Llama 3.1 (Docker Model Runner)

## Layout

`compose.yaml` is the entrypoint (networks, volumes, and `include:` of the files below). Each service has its own file:

- `compose/postgres.yaml`
- `compose/mongodb.yaml`
- `compose/loki.yaml`
- `compose/otel-collector.yaml`
- `compose/grafana.yaml`
- `compose/qwen3.yaml`
- `compose/llama3.1.yaml`

## Docker context

This project targets the **native Docker Engine** (`default` context), not Docker Desktop's VM — Docker Model Runner needs real access to the host's GPU device (`/dev/dri`), which Desktop's Linux VM can't pass through. `Makefile` and every `scripts/*.sh` set `DOCKER_CONTEXT=default`, so `make start` / `docker compose` from this repo always target the native engine regardless of whatever context is active elsewhere on your machine.

If you had containers/volumes previously running under `desktop-linux`, they're untouched but orphaned — clean them up with `docker --context desktop-linux compose -f compose.yaml down` if needed, or just leave them.

## Start

```bash
make start

Or:

docker compose up -d
Stop
make stop
Status
make status
Logs
make logs
Reset

WARNING: deletes all persistent data.

make reset
Services
Service	Host
PostgreSQL	localhost:5432
MongoDB	localhost:27017
Grafana	http://localhost:3000
Loki	http://localhost:3100
OTLP gRPC	localhost:4317
OTLP HTTP	http://localhost:4318

## Models

Qwen3 and Llama 3.1 run via Docker Model Runner (`provider: type: model` services, not regular containers — they won't show a port in `docker ps`/`make status`). Interact with them directly:

```bash
docker --context default model run ai/qwen3:4b-instruct-2507-q4_K_M
docker --context default model run ai/llama3.1
```

Or via the OpenAI-compatible endpoint, e.g. from another container on `dev_network`: `http://model-runner.docker.internal/engines/llama.cpp/v1`.

## Docker network

All services are connected to:

dev_network

Container-to-container communication should use service names.

Examples:

postgres:5432
mongodb:27017
grafana:3000
loki:3100
otel-collector:4317
otel-collector:4318

The OpenTelemetry Collector currently accepts OTLP
and exports to the debug exporter.

Application-specific wiring can be added later.
