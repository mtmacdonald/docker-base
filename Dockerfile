# ------------------------------------------------------------------------------
# Docker provisioning script for the docker-base image
#
# 	e.g. docker build -t mtmacdonald/docker-base:version .
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Start with the official Ubuntu 16.04 base image
# ------------------------------------------------------------------------------

FROM ubuntu:16.04

MAINTAINER Mark Macdonald <mark.t.macdonald@googlemail.com>

# Set correct environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Use Supervisor to run and manage all other services
CMD ["supervisord", "-c", "/etc/supervisord.conf"]

# ------------------------------------------------------------------------------
# Provision
# ------------------------------------------------------------------------------

RUN mkdir /provision
ADD provision /provision
RUN /provision/provision.sh

# ------------------------------------------------------------------------------
# Set locale (support UTF-8 in the container terminal)
# ------------------------------------------------------------------------------

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# ------------------------------------------------------------------------------
# Clean up
# ------------------------------------------------------------------------------

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
