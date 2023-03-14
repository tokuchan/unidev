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
RUN sed -i 's/# deb-src/deb-src/' /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get -y install locales
RUN apt-get -y install sudo

FROM base AS package-install

RUN apt-get -y install build-essential
RUN apt-get -y install g++-12
RUN apt-get -y install libgccjit-12-dev
RUN apt-get -y install libgccjit0
RUN apt-get build-dep -y emacs

FROM package-install AS user-setup

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

FROM user-setup AS build-emacs

ENV CC="gcc-12"

CMD cd emacs; \
if [ -e configure ]; \
then echo "Skipping autogen.sh"; \
else ./autogen.sh; \
fi; \
if [ -e Makefile ]; \
then echo "Skipping configure"; \
else ./configure \
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
         prefix=${rootdir}/breakbulk/emacs; \
fi; \
make -j$(cat /proc/cpuinfo | grep proc | wc -l) install
