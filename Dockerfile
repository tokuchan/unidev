FROM ubuntu:latest

## Basic Setup
ARG user=sspillane
ARG uid

MAINTAINER Sean Spillane

LABEL description="UNIversal DEVelopment environment"

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

## Package Installation
# Install build-deps for emacs
RUN sed -i 's/# deb-src/deb-src/' /etc/apt/sources.list \
&&  apt-get update \
&&  apt-get build-dep -y emacs

# Install needed packages
RUN apt-get update \
&& apt-get -y install \
autoconf \
automake \
autopoint \
bash \
bison \
build-essential \
ccache \
ccls \
cmake \
curl \
doxygen \
emacs \
fish \
flex \
g++-12 \
gettext \
ispell \
keychain \
libboost-all-dev \
libboost-python-dev \
libbz2-dev \
libffi-dev \
libgccjit-12-dev \
libgccjit0 \
libjansson-dev \
libjansson4 \
liblzma-dev \
libncurses5-dev \
libncursesw5-dev \
libreadline-dev \
libsqlite3-dev \
libssl-dev \
libtool \
libtool-bin \
llvm \
locales \
make \
man \
neovim \
ninja-build \
nodejs \
npm \
pkg-config \
ripgrep \
sudo \
tcsh \
tk-dev \
unzip \
wget \
xz-utils \
zlib1g-dev \
zsh \
zstd

## Custom Tooling (Root Level)
# Install neovim
RUN cd /usr/local/src/neovim \
 && git checkout stable \
 && make \
 && make install

ARG CUSTOM_NVIM_PATH=/usr/local/bin/nvim
RUN update-alternatives --install /usr/bin/ex ex "${CUSTOM_NVIM_PATH}" 110 \
 && update-alternatives --install /usr/bin/vi vi "${CUSTOM_NVIM_PATH}" 110 \
 && update-alternatives --install /usr/bin/view view "${CUSTOM_NVIM_PATH}" 110 \
 && update-alternatives --install /usr/bin/vim vim "${CUSTOM_NVIM_PATH}" 110 \
 && update-alternatives --install /usr/bin/vimdiff vimdiff "${CUSTOM_NVIM_PATH}" 110

# Install emacs 28
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
&&  make install

# Install pyright lsp
RUN npm install -g pyright

## Custom Tooling (User Level)
# Set up a user and switch to that user for the remaining commands
RUN useradd -u ${uid} -ms /usr/bin/fish ${user}
RUN adduser ${user} sudo
RUN echo 'ALL            ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers

# Set up environment needed for pyenv
ENV LANGUAGE="en_US.UTF-8"
ENV LC_ALL="en_US.UTF-8"
ENV LC_CTYPE="en_US.UTF-8"
ENV LANG="en_US.UTF-8"
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales
ENV SSH_AUTH_SOCK=${SSH_AUTH_SOCK}

USER ${user}
WORKDIR /home/${user}

# Set up pyenv
RUN git clone https://github.com/pyenv/pyenv.git /home/${user}/.pyenv
ENV PATH=/home/${user}/.pyenv/bin:$PATH

# Install python
RUN pyenv install 3.10.4
RUN mkdir -p /home/${user}/.local/src/pip
RUN curl -Lo /home/${user}/.local/src/pip/get-pip.py https://bootstrap.pypa.io/get-pip.py
RUN sudo python3 /home/${user}/.local/src/pip/get-pip.py
RUN sudo pip install click sh rich flake8 autoflake "ptvsd>=4.2" jupytext importmagic epc

# Install additional packages
RUN sudo apt-get update \
&&  sudo apt-get install -y \
clang-format \
clang-tidy \
libcanberra-gtk-module \
libcanberra-gtk3-module

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
