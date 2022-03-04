#!/bin/bash

if [ -z "$*" ]
then
    echo "No args given: Options are to connect to the Docker Debian 'arm64' or 'x86_64'"
elif [ $1 == "arm64" ]
then
    echo "Connecting docker-on-debian.sock to arm64 Debian VM...";
    export DOCKER_HOST=unix:///tmp/docker-on-debian.sock
    ssh debian@127.0.0.1 -p 22022 -i ~/.ssh/debian_id_rsa -N -f -L/tmp/docker-on-debian.sock:/var/run/docker.sock ssh://debian@127.0.0.1
elif [ $1 == "x86_64" ] 
then
    echo "Connecting docker-on-debian.sock to x86_64 Debian VM...";
    export DOCKER_HOST=unix:///tmp/docker-on-debianx64.sock
    ssh debianx64@127.0.0.1 -p 20002 -i ~/.ssh/debian_id_rsa -N -f -L/tmp/docker-on-debianx64.sock:/var/run/docker.sock ssh://debianx64@127.0.0.1
else
    echo "Incorrect arch: Options are to connect to the Docker Debian 'arm64' or 'x86_64'"
fi
   


