docker--container = dev
ifeq ($(shell type "docker compose" 2> /dev/null; echo $?), 0)
	docker--compose := docker compose
else
	docker--compose := docker-compose
endif
docker--command = $(docker--compose) run $1 --rm $(docker--container) $2

all: build shell

.PHONY: install
install:
	@echo Docker compose command detected as: $(docker--compose)
	@mkdir -p ~/.local/bin
	@cp local/bin/unidev.sh ~/.local/bin/unidev
	@git submodule init
	@git submodule update

.PHONY: .env
.env:
	@echo '# Generated file, do not edit' > $@
	@echo UID=$(shell id -u) >> $@
	@echo USER=$(shell whoami) >> $@
	@echo HOME=$(HOME) >> $@

.PHONY: build
build: .env
	@$(docker--compose) build

.PHONY: shell
shell: build install
	@$(call docker--command,-w ~/host/$(cwd),sh)

.PHONY: clean
clean:
	@-rm .env
