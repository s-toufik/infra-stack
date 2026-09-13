export DOCKER_CONTEXT := default

.PHONY: start stop restart status logs pull config reset clean

start:
	@./scripts/start.sh

stop:
	@./scripts/stop.sh

restart:
	@docker compose restart

status:
	@./scripts/status.sh

logs:
	@docker compose logs -f

pull:
	@docker compose pull

config:
	@docker compose config

reset:
	@./scripts/reset.sh

clean:
	@docker compose down -v --remove-orphans
