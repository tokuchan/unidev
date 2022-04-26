FROM ubuntu:latest

ARG user=sspillane
ARG uid

MAINTAINER Sean Spillane

LABEL description="Development container for Bellport"

## Configure yum to work:
#RUN cd /etc/yum.repos.d/
#RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
#RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
#RUN yum -y install epel-release
#RUN curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo
#RUN yum -y update
#
## Install required packages to build Bellport
## you might need python2-neovim as well on older Fedora releases
#RUN yum -y install gperf
#RUN yum -y install neovim --enablerepo=epel
#RUN yum -y install automake autoconf libtool pkgconfig gettext gcc-c++ make cmake git python39 openssl-devel python3-neovim fish \
#  && yum clean all
#RUN chsh -s /usr/bin/fish

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
RUN mkdir -p ~/.config/fish
RUN echo 'status is-login; and pyenv init --path | source' >> ~/.config/fish/config.fish
RUN echo 'status is-interactive; and pyenv init - | source' >> ~/.config/fish/config.fish

# Install python
RUN pyenv install 3.10.4

# Run shell
ENTRYPOINT /usr/bin/fish
