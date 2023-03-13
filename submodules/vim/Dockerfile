FROM ubuntu:latest AS base

ARG USER
ENV user=${USER}
ARG UID
ENV uid=${UID}
ARG ROOTDIR
ENV rootdir=${ROOTDIR}

# Keep apt tools from prompting
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Ny

# Inflate the system and set up APT.
RUN yes | unminimize
RUN apt-get -y install dialog apt-utils tzdata git
RUN git clone https://github.com/timothyvanderaerden/add-apt-repository.git /usr/local/share/add-apt-repository
RUN chmod ugo+rx /usr/local/share/add-apt-repository/add-apt-repository
RUN ln -s /usr/local/share/add-apt-repository/add-apt-repository /usr/local/bin/add-apt-repository

FROM base AS package-install

# Install needed packages
RUN apt-get update

# Shells
#RUN apt-get -y install bash
RUN apt-get -y install fish
#RUN apt-get -y install tcsh
#RUN apt-get -y install zsh

# System support
RUN apt-get -y install locales
RUN apt-get -y install man
RUN apt-get -y install sshfs
RUN apt-get -y install sudo
RUN apt-get -y install stow
RUN apt-get -y install unzip

# Programming languages
RUN apt-get -y install python3

# Utilties
RUN apt-get -y install bat
RUN apt-get -y install curl
RUN apt-get -y install exa
RUN apt-get -y install jq
RUN apt-get -y install ripgrep
RUN apt-get -y install sqlite3
RUN apt -y autoremove

FROM package-install AS user-setup

#RUN ln -s /home/${user}/host/home/${user}/.Xauthority /home/${user}/.Xauthority
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

FROM user-setup AS python-setup

RUN mkdir -p /usr/local/share/python-pip
RUN curl -Lo /usr/local/share/python-pip/get-pip.py https://bootstrap.pypa.io/get-pip.py
RUN sudo python3 /usr/local/share/python-pip/get-pip.py

RUN pip install --upgrade pip rich-cli termsql ipython

FROM python-setup AS user-shell

RUN sudo apt-get -y install \
build-essential \
curl \
g++-12 \
gettext \
libtool \
libtool-bin \
unzip

RUN sudo cp /etc/apt/sources.list /etc/apt/sources.list~
RUN sudo sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
RUN sudo apt-get update -y

RUN sudo apt-get build-dep -y neovim

CMD cd neovim \
&& make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=${rootdir}/breakbulk/neovim install \
