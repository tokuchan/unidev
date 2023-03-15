docker--container = dev
ifeq ($(shell type "docker compose" 2> /dev/null; echo $?), 0)
	docker--compose := docker compose
else
	docker--compose := docker-compose
endif
docker--command = $(docker--compose) run $1 --rm $(docker--container) $2

#all: build shell
all: breakbulk stow-all install-utility-packages

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
clean: DockerShell/dist-clean
	@-rm .env

.PHONY: breakbulk
breakbulk: DockerShell/dist breakbulk/neovim breakbulk/emacs

.PHONY: DockerShell/dist-clean
DockerShell/dist-clean:
	rm -rf submodules/DockerShell/dist

DockerShell/dist:
	pip install -U poetry
	cd submodules/DockerShell && poetry build && pip install dist/dockershell-*.tar.gz

breakbulk/neovim: DockerShell/dist
	cd submodules/vim/ && ds -v

breakbulk/emacs: DockerShell/dist
	cd submodules/emacs && ds -v

.PHONY: stow-all
stow-all: stow-dotfiles stow-emacs stow-emacs-config stow-neovim stow-neovim-config stow-git stow-fish

.PHONY: stow-%
stow-%:
	stow -t $(HOME) -d $(shell realpath ./breakbulk) $*

.PHONY: stow-emacs-libs
stow-emacs-libs:
	sudo apt-get -y install g++-12
	sudo apt-get -y install libgccjit-12-dev
	sudo apt-get -y install libgccjit0
	sudo apt-get -y install ccls
	sudo apt-get -y install fonts-firacode

stow-emacs: stow-emacs-libs

.PHONY: install-utility-packages
install-utility-packages:
	sudo apt-get update
	#sudo apt-get -y install autoconf
	#sudo apt-get -y install automake
	#sudo apt-get -y install autopoint
	#sudo apt-get -y install bash
	sudo apt-get -y install bat
	#sudo apt-get -y install bison
	#sudo apt-get -y install ccache
	sudo apt-get -y install ccls
	#sudo apt-get -y install cl-clx-sbcl
	#sudo apt-get -y install clang
	#sudo apt-get -y install clang-format
	#sudo apt-get -y install clang-tidy
	#sudo apt-get -y install cmake
	sudo apt-get -y install curl
	sudo apt-get -y install doxygen
	sudo apt-get -y install figlet
	sudo apt-get -y install fish
	#sudo apt-get -y install flex
	#sudo apt-get -y install fonts-firacode
	#sudo apt-get -y install fossil
	sudo apt-get -y install fzf
	sudo apt-get -y install g++-12
	sudo apt-get -y install gdb
	#sudo apt-get -y install gettext
	sudo apt-get -y install git-gui
	sudo apt-get -y install gitk
	#sudo apt-get -y install golang
	#sudo apt-get -y install ispell
	sudo apt-get -y install jq
	sudo apt-get -y install keychain
	#sudo apt-get -y install libboost-all-dev
	#sudo apt-get -y install libboost-python-dev
	#sudo apt-get -y install libbz2-dev
	#sudo apt-get -y install libcanberra-gtk-module
	#sudo apt-get -y install libcanberra-gtk3-module
	#sudo apt-get -y install libffi-dev
	#sudo apt-get -y install libgccjit-12-dev
	#sudo apt-get -y install libgccjit0
	#sudo apt-get -y install libjansson-dev
	#sudo apt-get -y install libjansson4
	#sudo apt-get -y install liblzma-dev
	#sudo apt-get -y install libncurses5-dev
	#sudo apt-get -y install libncursesw5-dev
	#sudo apt-get -y install libreadline-dev
	#sudo apt-get -y install libsqlite3-dev
	#sudo apt-get -y install libssl-dev
	#sudo apt-get -y install llvm
	#sudo apt-get -y install locales
	#sudo apt-get -y install make
	#sudo apt-get -y install man
	sudo apt-get -y install meld
	#sudo apt-get -y install ninja-build
	#sudo apt-get -y install nodejs
	#sudo apt-get -y install npm
	#sudo apt-get -y install pkg-config
	sudo apt-get -y install qpdf
	sudo apt-get -y install ripgrep
	#sudo apt-get -y install sbcl
	#sudo apt-get -y install sbcl-doc
	#sudo apt-get -y install sbcl-source
	sudo apt-get -y install sqlite3
	sudo apt-get -y install sshfs
	#sudo apt-get -y install stow
	#sudo apt-get -y install sudo
	#sudo apt-get -y install tcsh
	#sudo apt-get -y install tk-dev
	#sudo apt-get -y install unzip
	#sudo apt-get -y install wget
	sudo apt-get -y install xclip
	#sudo apt-get -y install xz-utils
	#sudo apt-get -y install zlib1g-dev
	#sudo apt-get -y install zsh
	#sudo apt-get -y install zstd
	sudo apt -y autoremove
