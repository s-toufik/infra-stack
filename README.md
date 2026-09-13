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

This project targets the **native Docker Engine** (`default` context), not Docker Desktop's VM. 

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