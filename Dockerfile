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
RUN apt-get -y install dialog apt-utils tzdata git
RUN git clone https://github.com/timothyvanderaerden/add-apt-repository.git /usr/local/share/add-apt-repository
RUN chmod ugo+rx /usr/local/share/add-apt-repository/add-apt-repository
RUN ln -s /usr/local/share/add-apt-repository/add-apt-repository /usr/local/bin/add-apt-repository

# Add custom APT repos

# Install needed packages
RUN apt-get -y install \
autoconf \
automake \
autopoint \
bison \
build-essential \
cmake \
curl \
fish \
flex \
g++ \
gettext \
libbz2-dev \
libffi-dev \
liblzma-dev \
libncurses5-dev \
libncursesw5-dev \
libboost-all-dev \
libboost-python-dev \
libreadline-dev \
libsqlite3-dev \
libssl-dev \
libtool \
llvm \
locales \
make \
man \
neovim \
nodejs \
sudo \
tk-dev \
wget \
xz-utils \
zlib1g-dev \
zstd

# Install neovim
#ARG CUSTOM_NVIM_PATH=/usr/local/share/nvim.appimage
#RUN curl -LO "https://github.com/neovim/neovim/releases/latest/download/nvim.appimage"
#RUN mv nvim.appimage /usr/local/share/
#RUN chmod ugo+x /usr/local/share/nvim.appimage \
# && ln -s /usr/local/share/nvim.appimage /usr/local/bin/nvim \
# && update-alternatives --install /usr/bin/ex ex "${CUSTOM_NVIM_PATH}" 110 \
# && update-alternatives --install /usr/bin/vi vi "${CUSTOM_NVIM_PATH}" 110 \
# && update-alternatives --install /usr/bin/view view "${CUSTOM_NVIM_PATH}" 110 \
# && update-alternatives --install /usr/bin/vim vim "${CUSTOM_NVIM_PATH}" 110 \
# && update-alternatives --install /usr/bin/vimdiff vimdiff "${CUSTOM_NVIM_PATH}" 110

# Set up shell
RUN chsh -s /usr/bin/fish

# Set up a user and switch to that user for the remaining commands
RUN useradd -u ${uid} -ms /usr/bin/fish ${user}
#RUN echo "sspillane:sspillane" | chpasswd
RUN adduser ${user} sudo
RUN echo 'ALL            ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers

# Set up some environment
ENV LANGUAGE="en_US.UTF-8"
ENV LC_ALL="en_US.UTF-8"
ENV LC_CTYPE="en_US.UTF-8"
ENV LANG="en_US.UTF-8"
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

USER ${user}
WORKDIR /home/${user}

# Set up pyenv
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv
ENV PATH=/home/${user}/.pyenv/bin:$PATH

# Install python
RUN pyenv install 3.10.4

# Run shell
ENTRYPOINT /usr/bin/fish
