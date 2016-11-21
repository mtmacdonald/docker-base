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

# ------------------------------------------------------------------------------
# Cron
# ------------------------------------------------------------------------------

apt-get -y install cron

# ------------------------------------------------------------------------------
# Nano
# ------------------------------------------------------------------------------

apt-get -y install nano

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
