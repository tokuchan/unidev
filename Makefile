docker--container = dev
docker--command = docker compose run $1 --rm $(docker--container) $2
export BELLPORT = ../bellport/

all: build shell

.env:
	@echo BELLPORT=../bellport/ >> $@

.PHONY: build
build: .env
	docker compose build

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
