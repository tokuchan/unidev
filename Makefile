all: stow-all

.PHONY: stow-all
stow-all: stow-dotfiles stow-emacs-config stow-neovim-config stow-git stow-fish

.PHONY: stow-%
stow-%:
	stow -t $(HOME) -d $(shell realpath ./breakbulk) $*

#.PHONY: stow-emacs-libs
#stow-emacs-libs:
#	sudo apt-get -y install g++-12
#	sudo apt-get -y install libgccjit-12-dev
#	sudo apt-get -y install libgccjit0
#	sudo apt-get -y install ccls
#	sudo apt-get -y install fonts-firacode
#
#stow-emacs: stow-emacs-libs
#
#.PHONY: install-utility-packages
#install-utility-packages:
#	sudo apt-get update
#	#sudo apt-get -y install autoconf
#	#sudo apt-get -y install automake
#	#sudo apt-get -y install autopoint
#	#sudo apt-get -y install bash
#	sudo apt-get -y install bat
#	#sudo apt-get -y install bison
#	#sudo apt-get -y install ccache
#	sudo apt-get -y install ccls
#	#sudo apt-get -y install cl-clx-sbcl
#	#sudo apt-get -y install clang
#	#sudo apt-get -y install clang-format
#	#sudo apt-get -y install clang-tidy
#	#sudo apt-get -y install cmake
#	sudo apt-get -y install curl
#	sudo apt-get -y install doxygen
#	sudo apt-get -y install figlet
#	sudo apt-get -y install fish
#	#sudo apt-get -y install flex
#	#sudo apt-get -y install fonts-firacode
#	#sudo apt-get -y install fossil
#	sudo apt-get -y install fzf
#	sudo apt-get -y install g++-12
#	sudo apt-get -y install gdb
#	#sudo apt-get -y install gettext
#	sudo apt-get -y install git-gui
#	sudo apt-get -y install gitk
#	#sudo apt-get -y install golang
#	#sudo apt-get -y install ispell
#	sudo apt-get -y install jq
#	sudo apt-get -y install keychain
#	#sudo apt-get -y install libboost-all-dev
#	#sudo apt-get -y install libboost-python-dev
#	#sudo apt-get -y install libbz2-dev
#	#sudo apt-get -y install libcanberra-gtk-module
#	#sudo apt-get -y install libcanberra-gtk3-module
#	#sudo apt-get -y install libffi-dev
#	#sudo apt-get -y install libgccjit-12-dev
#	#sudo apt-get -y install libgccjit0
#	#sudo apt-get -y install libjansson-dev
#	#sudo apt-get -y install libjansson4
#	#sudo apt-get -y install liblzma-dev
#	#sudo apt-get -y install libncurses5-dev
#	#sudo apt-get -y install libncursesw5-dev
#	#sudo apt-get -y install libreadline-dev
#	#sudo apt-get -y install libsqlite3-dev
#	#sudo apt-get -y install libssl-dev
#	#sudo apt-get -y install llvm
#	#sudo apt-get -y install locales
#	#sudo apt-get -y install make
#	#sudo apt-get -y install man
#	sudo apt-get -y install meld
#	#sudo apt-get -y install ninja-build
#	#sudo apt-get -y install nodejs
#	#sudo apt-get -y install npm
#	#sudo apt-get -y install pkg-config
#	sudo apt-get -y install qpdf
#	sudo apt-get -y install ripgrep
#	#sudo apt-get -y install sbcl
#	#sudo apt-get -y install sbcl-doc
#	#sudo apt-get -y install sbcl-source
#	sudo apt-get -y install sqlite3
#	sudo apt-get -y install sshfs
#	#sudo apt-get -y install stow
#	#sudo apt-get -y install sudo
#	#sudo apt-get -y install tcsh
#	#sudo apt-get -y install tk-dev
#	#sudo apt-get -y install unzip
#	#sudo apt-get -y install wget
#	sudo apt-get -y install xclip
#	#sudo apt-get -y install xz-utils
#	#sudo apt-get -y install zlib1g-dev
#	#sudo apt-get -y install zsh
#	#sudo apt-get -y install zstd
#	sudo apt -y autoremove
