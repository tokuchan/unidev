docker--container = dev
docker--compose = $(shell if type "docker compose" 2> /dev/null; then echo "$$(which docker) compose"; else which "docker-compose"; fi)
docker--command = $(docker--compose) run $1 --rm $(docker--container) $2
export BELLPORT = ../bellport/

all: build shell

.env:
	@echo BELLPORT=../bellport/ >> $@
	@echo UID=$(shell id -u) >> $@

.PHONY: build
build: .env
	echo $(docker--compose)
	$(docker--compose) build --build-arg uid=$(shell id -u)

.PHONY: shell
shell: build
	$(call docker--command,,sh)

.PHONY: clean
clean:
	@-rm .env

.PHONY: refresh-3p
refresh-3p:
	cd $(BELLPORT) \
		&& rm -rf thirdparty \
		&& git checkout thirdparty \
		&& git submodule init \
		&& git submodule update
