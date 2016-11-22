#!/bin/bash
# ------------------------------------------------------------------------------
# Provisioning script for the docker-base image
# ------------------------------------------------------------------------------

apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

# -----------------------------------------------------------------------------
# Curl
# ------------------------------------------------------------------------------

apt-get -y install curl

# ------------------------------------------------------------------------------
# Supervisor
# ------------------------------------------------------------------------------

# install python (required for Supervisor)
apt-get -y install python python-pip
pip install --upgrade pip

# directories and conf files
mkdir -p /etc/supervisord/
mkdir /var/log/supervisor
cp /provision/conf/supervisor.conf /etc/supervisord.conf

# install
pip install supervisor

# ------------------------------------------------------------------------------
# Cron
# ------------------------------------------------------------------------------

apt-get -y install cron
cp /provision/service/cron.conf /etc/supervisord/cron.conf

# ------------------------------------------------------------------------------
# Nano
# ------------------------------------------------------------------------------

apt-get -y install nano

# Fix 'Error opening terminal: unknown' in docker exec for older Docker versions
# askubuntu.com/questions/736101
# https://github.com/docker/docker/issues/9299
# http://stackoverflow.com/questions/27826241
echo 'export TERM=xterm' >> /etc/bash.bashrc

# ------------------------------------------------------------------------------
# Zip and unzip
# ------------------------------------------------------------------------------

apt-get -y install zip unzip

# ------------------------------------------------------------------------------
# Git version control
# ------------------------------------------------------------------------------

apt-get -y install git

# ------------------------------------------------------------------------------
# Unattended upgrades (security patches)
# ------------------------------------------------------------------------------

apt-get -y install unattended-upgrades
dpkg-reconfigure unattended-upgrades

# ------------------------------------------------------------------------------
# Clean up
# ------------------------------------------------------------------------------
rm -rf /provision
