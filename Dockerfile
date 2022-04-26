FROM ubuntu:latest

ARG user=sspillane
ARG uid

MAINTAINER Sean Spillane

LABEL description="Development container for Bellport"

# Keep apt tools from prompting
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Ny

# Inflate the system and set up APT.
RUN yes | unminimize
RUN apt-get -y install dialog apt-utils tzdata

# Install needed packages
RUN apt-get -y install \
autoconf \
automake \
build-essential \
cmake \
curl \
fish \
g++ \
gettext \
git \
libbz2-dev \
libffi-dev \
liblzma-dev \
libncurses5-dev \
libncursesw5-dev \
libreadline-dev \
libsqlite3-dev \
libssl-dev \
libtool \
llvm \
make \
man \
neovim \
sudo \
tk-dev \
wget \
xz-utils \
zlib1g-dev

# Set up shell
RUN chsh -s /usr/bin/fish

# Set up a user and switch to that user for the remaining commands
RUN useradd -u ${uid} -ms /usr/bin/fish ${user}
RUN adduser ${user} sudo
USER ${user}
WORKDIR /home/${user}

# Set up pyenv
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv
ENV PATH=/home/${user}/.pyenv/bin:$PATH
RUN mkdir -p /home/${user}/.config/fish
RUN echo 'status is-login; and pyenv init --path | source' >> /home/${user}/.config/fish/config.fish
RUN echo 'status is-interactive; and pyenv init - | source' >> /home/${user}/.config/fish/config.fish

# Install python
RUN pyenv install 3.10.4

# Run shell
ENTRYPOINT /usr/bin/fish
