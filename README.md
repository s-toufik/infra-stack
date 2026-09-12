# Local Development Infrastructure

Local infrastructure for development.

## Included

- PostgreSQL
- MongoDB
- Grafana
- Loki
- OpenTelemetry Collector

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
Docker network

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
