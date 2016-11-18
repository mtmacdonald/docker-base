#!/bin/bash
# ------------------------------------------------------------------------------
# Provisioning script for the docker-laravel web server stack
# ------------------------------------------------------------------------------

apt-get update

# -----------------------------------------------------------------------------
# curl
# ------------------------------------------------------------------------------

apt-get -y install curl

# ------------------------------------------------------------------------------
# Supervisor
# ------------------------------------------------------------------------------

# install python (required for supervisor)
apt-get -y install python

# directories and conf files
mkdir -p /etc/supervisord/
mkdir /var/log/supervisor
cp /provision/conf/supervisor.conf /etc/supervisord.conf
cp /provision/service/* /etc/supervisord/

# install
curl https://bootstrap.pypa.io/ez_setup.py -o - | python
easy_install supervisor
