#!/bin/bash
# ------------------------------------------------------------------------------
# Provisioning script for the docker-base image
# ------------------------------------------------------------------------------

apt-get update

# -----------------------------------------------------------------------------
# Curl
# ------------------------------------------------------------------------------

apt-get -y install curl

# ------------------------------------------------------------------------------
# Supervisor
# ------------------------------------------------------------------------------

# install python (required for supervisor)
apt-get -y install python python-pip
pip install --upgrade pip

# directories and conf files
mkdir -p /etc/supervisord/
mkdir /var/log/supervisor
cp /provision/conf/supervisor.conf /etc/supervisord.conf
cp /provision/service/* /etc/supervisord/

# install
pip install supervisor
