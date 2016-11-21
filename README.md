Ubuntu Docker base image with Supervisor
========================================

This is a base Docker image for building other images. Contains:

- [Ubuntu Server 16.04 LTS](https://www.ubuntu.com/download/server) (Xenial)
- [Supervisor](http://supervisord.org) for process supervision
    - [Python](https://www.python.org) (dependency for Supervisor)
- Cron scheduler
- Nano text editor
- [Curl](https://curl.haxx.se)
- [Git](https://git-scm.com/) version control

Container also:
- runs cron as service
- sets locale (en_US.UTF-8 to support UTF-8)
- installs and sets unattended-upgrades (automatic security patches)
- fixes 'Error opening terminal: unknown' in [docker exec](https://github.com/docker/docker/issues/9299) for older Docker versions

Running a container
-------------------

*This base image doesn't do anything useful. It is intended for building other
images on top of the base packages.*

**1.** Download the public Docker image from Dockerhub:

	docker pull mtmacdonald/docker-base:version

**2.** Run the Docker image as a new Docker container:

  docker run -d --restart=always --name=appname mtmacdonald/docker-base:version

Get a terminal in a running container
-------------------------------------

**1.** Use docker exec to get a terminal in an already running container:

  docker exec -it appname bash

Process supervision
-------------------

*Supervisor monitors and automatically restarts services.*

**1.** To inspect status and manually manage services:

  supervisorctl

**2.** To add new services, add configuration files to */etc/supervisord*

See also
--------

This image is loosely based on ideas from
[phusion/baseimage-docker](https://github.com/phusion/baseimage-docker).
