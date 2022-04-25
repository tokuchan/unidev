FROM centos:latest

MAINTAINER Sean Spillane

LABEL description="Development container for Bellport"

# Configure yum to work:
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Install required packages to build Bellport
RUN yum -y update \
&& yum -y install automake autoconf libtool pkgconfig gettext gcc-c++ make cmake git python39 \
&& yum clean all

# Run shell
WORKDIR /usr/share/bellport
