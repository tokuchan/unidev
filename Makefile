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
	@cp unidev.sh ~/.local/bin/unidev
	@git submodule init
	@git submodule update

.PHONY: .env
.env: profiles/$(profile)/config.env
	@echo '# Generated file, do not edit' > $@
	@echo CCACHE_DIR=$(HOME)/.ccache >> $@
	@echo CCACHE_TEMPDIR=$(HOME)/.ccache >> $@
	@echo DISPLAY=$(DISPLAY) >> $@
	@echo UID=$(shell id -u) >> $@
	@echo USER=$(shell whoami) >> $@
	@echo HOME=$(HOME) >> $@
	@echo HHOME=/home/$(USER)/host/$(HOME) >> $@
	@echo SSH_AUTH_SOCK=$(SSH_AUTH_SOCK) >> $@
	@echo SSH_AUTH_SOCK_DIR=$(shell dirname $(SSH_AUTH_SOCK)) >> $@
	@cat $^ >> $@

.PHONY: build
build: .env
	@echo "Profile: $(profile)"
	@$(docker--compose) build

.PHONY: shell
shell: build install
	@echo "Profile: $(profile)"
	@$(call docker--command,-w /home/$(USER)/host/$(HOME),sh)

.PHONY: clean
clean:
	@-rm .env

.PHONY: neovim-clean
neovim-clean:
	cd submodules/vim/ && ds -v 'bash -c "cd neovim && make clean"'

.PHONY: neovim
neovim:
	cd submodules/vim/ && ds -v
	mv submodules/vim/breakbulk/* breakbulk/
