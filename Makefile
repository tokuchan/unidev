docker--container = dev
docker--compose = $(shell if type "docker compose" 2> /dev/null; then echo "$$(which docker) compose"; else which "docker-compose"; fi)
docker--command = $(docker--compose) run $1 --rm $(docker--container) $2

all: build shell

.PHONY: .env
.env:
	@echo '# Generated file, do not edit' > $@
	@echo UID=$(shell id -u) >> $@
	@echo USER=$(shell whoami) >> $@

.PHONY: build
build: .env
	@$(docker--compose) build

.PHONY: shell
shell: build
	@$(call docker--command,,sh)

.PHONY: clean
clean:
	@-rm .env
