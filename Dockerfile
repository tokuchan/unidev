FROM ubuntu:latest

## Basic Setup
ARG user=sspillane
ARG uid

MAINTAINER Sean Spillane

LABEL description="UNIversal DEVelopment environment"

## BASIC CONFIGURATION & SETUP
# Keep apt tools from prompting
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Ny

# Inflate the system and set up APT.
RUN yes | unminimize
RUN apt-get -y install dialog apt-utils tzdata git
RUN git clone https://github.com/timothyvanderaerden/add-apt-repository.git /usr/local/share/add-apt-repository
RUN chmod ugo+rx /usr/local/share/add-apt-repository/add-apt-repository
RUN ln -s /usr/local/share/add-apt-repository/add-apt-repository /usr/local/bin/add-apt-repository

# Fetch repos for things we'll compile later
RUN mkdir -p /usr/local/src \
 && git clone https://github.com/neovim/neovim /usr/local/src/neovim \
 && git clone git://git.savannah.gnu.org/emacs.git /usr/local/src/emacs


## EMACS
# Install build-deps for emacs
RUN sed -i 's/# deb-src/deb-src/' /etc/apt/sources.list \
&&  apt-get -y update \
&&  apt-get -y install \
build-essential \
g++-12 \
libgccjit-12-dev \
libgccjit0 \
&&  apt-get build-dep -y emacs

# Install the latest EMACS
ENV CC="gcc-12"
RUN cd /usr/local/src/emacs \
&&  ./autogen.sh \
&&  ./configure \
         --with-native-compilation  \
         --with-gnutls \
         --with-imagemagick \
         --with-jpeg \
         --with-png \
         --with-rsvg \
         --with-tiff \
         --with-wide-int \
         --with-xft \
         --with-xml2 \
         --with-xpm \
         prefix=/usr/local \
&&  make -j$(cat /proc/cpuinfo | grep proc | wc -l) install


## NEOVIM
# Install build-deps for neovim
RUN apt-get -y update \
&&  apt-get -y install \
build-essential \
curl \
g++-12 \
libtool \
libtool-bin \
unzip \
&&  apt-get build-dep -y neovim

# Install neovim
RUN cd /usr/local/src/neovim \
 && git checkout stable \
 && make -j$(cat /proc/cpuinfo | grep proc | wc -l) install

ARG CUSTOM_NVIM_PATH=/usr/local/bin/nvim
RUN update-alternatives --install /usr/bin/ex ex "${CUSTOM_NVIM_PATH}" 110 \
 && update-alternatives --install /usr/bin/vi vi "${CUSTOM_NVIM_PATH}" 110 \
 && update-alternatives --install /usr/bin/view view "${CUSTOM_NVIM_PATH}" 110 \
 && update-alternatives --install /usr/bin/vim vim "${CUSTOM_NVIM_PATH}" 110 \
 && update-alternatives --install /usr/bin/vimdiff vimdiff "${CUSTOM_NVIM_PATH}" 110


## BASIC PACKAGES
# Install needed packages
RUN apt-get update \
&& apt-get -y install \
autoconf \
automake \
autopoint \
bash \
bison \
ccache \
ccls \
cl-clx-sbcl \
clang \
clang-format \
clang-tidy \
cmake \
doxygen \
figlet \
fish \
flex \
fonts-firacode \
fossil \
fzf \
gdb \
gettext \
git-gui \
gitk \
ispell \
keychain \
libboost-all-dev \
libboost-python-dev \
libbz2-dev \
libcanberra-gtk-module \
libcanberra-gtk3-module \
libffi-dev \
libjansson-dev \
libjansson4 \
liblzma-dev \
libncurses5-dev \
libncursesw5-dev \
libreadline-dev \
libsqlite3-dev \
libssl-dev \
llvm \
locales \
make \
man \
meld \
ninja-build \
nodejs \
npm \
pkg-config \
qpdf \
ripgrep \
sbcl \
sbcl-doc \
sbcl-source \
sshfs \
sudo \
tcsh \
tk-dev \
wget \
xclip \
xz-utils \
zlib1g-dev \
zsh \
zstd

# Add handy Chair Horse passphrase generator
RUN git clone https://github.com/adamlsd/passgen.git /usr/local/src/passgen \
&& cd /usr/local/src/passgen \
&& make \
&& ln -s /usr/local/src/passgen/passgen /usr/local/bin/passgen \
&& ln -s /usr/local/src/passgen/pingen /usr/local/bin/pingen

## Custom Tooling (User Level)
# Set up a user and switch to that user for the remaining commands
RUN useradd -u ${uid} -ms /usr/bin/fish ${user}
RUN adduser ${user} sudo
RUN echo 'ALL            ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers

# Set up environment
ENV LANGUAGE="en_US.UTF-8"
ENV LC_ALL="en_US.UTF-8"
ENV LC_CTYPE="en_US.UTF-8"
ENV LANG="en_US.UTF-8"
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales
ENV SSH_AUTH_SOCK=${SSH_AUTH_SOCK}

# Install duckdb
RUN curl -Lo /usr/local/src/duckdb-cli.zip https://github.com/duckdb/duckdb/releases/download/v0.6.0/duckdb_cli-linux-amd64.zip \
&& unzip /usr/local/src/duckdb-cli.zip -d /usr/local/src/duckdb-cli/ \
&& ln -s /usr/local/src/duckdb-cli/duckdb /usr/local/bin/duckdb

USER ${user}
WORKDIR /home/${user}

## C++ setup
RUN sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 100 --slave /usr/bin/g++ g++ /usr/bin/g++-12

## Python setup
# Install pyright lsp
RUN sudo npm install -g pyright

# Set up pyenv
RUN git clone https://github.com/pyenv/pyenv.git /home/${user}/.pyenv
ENV PATH=/home/${user}/.pyenv/bin:$PATH

# Install python
RUN pyenv install 3.10.4
RUN mkdir -p /home/${user}/.local/src/pip
RUN curl -Lo /home/${user}/.local/src/pip/get-pip.py https://bootstrap.pypa.io/get-pip.py
RUN sudo python3 /home/${user}/.local/src/pip/get-pip.py
RUN sudo pip install --upgrade \
"ptvsd>=4.2" \
autoflake \
click \
duckdb \
epc \
flake8 \
importmagic \
ipython \
jupytext \
pip \
poetry \
pygments \
rich \
rich-cli \
sh

## User Environment Startup
# Set up user environment
ARG shell
ARG editor
ENV EDITOR=${editor}
ENV SHELL=${shell}
RUN ln -s /home/${user}/host/home/${user}/.Xauthority /home/${user}/.Xauthority

# Expose spotify control port
EXPOSE 8080

# Run shell
ENTRYPOINT $SHELL
