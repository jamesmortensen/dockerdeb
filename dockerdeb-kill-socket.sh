#!/bin/bash

unset DOCKER_HOST
lsof |grep 'docker-on-debian.sock'|egrep '^ssh'| kill `awk '{print $2}'`
rm /tmp/docker-on-debian.sock
