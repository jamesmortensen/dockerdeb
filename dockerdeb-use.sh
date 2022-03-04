#!/bin/bash

if [ -z "$*" ]
then
    echo "No args given: Options are to connect to the Docker Debian 'arm64' or 'x86_64'"
elif [ $1 == "arm64" ]
then
    echo "export DOCKER_HOST=unix:///tmp/docker-on-debian.sock"
elif [ $1 == "x86_64" ] 
then
    echo "export DOCKER_HOST=unix:///tmp/docker-on-debianx64.sock"
else
    echo "Incorrect arch: Options are to connect to the Docker Debian 'arm64' or 'x86_64'"
fi
   


