# dockerdeb

dockerdeb is a series of BASH scripts to connect a Docker Engine on a QEMU Debian 11 virtual machine's Docker Engine to a Docker CLI running on the host. It replaces the proprietary Docker Desktop. For more details, see [Setting Up Docker on macOS M1 ARM64 to use Debian 10.4 Docker Engine](https://www.codeluge.com/post/setting-up-docker-on-macos-m1-arm64-to-use-debian-10.4-docker-engine/). 

These scripts assist in connecting to the Docker socket, as well as using SSH port forwarding to tunnel through the VM's open SSH port to the container ports. 

Run `dockerdeb-help.sh` for usage details.

NOTE: For best results, put the scripts in your home bin folder at ~/bin/dockerdeb and add to your system path. To do so, add the following line to ~/.bashrc:

```
export PATH=$PATH:~/bin/dockerdeb
```

## Virtual Machine Setup

On Mac M1's, virtualization options are limited. UTM is a free and open source virtualization wrapper around QEMU. You can download the [Debian 10.4 ARM64 Minimal VM](https://mac.getutm.app/gallery/debian-10-4-minimal) from the gallery.

Follow the steps in [Setting Up Docker on macOS M1 ARM64 to use Debian 10.4 Docker Engine](https://www.codeluge.com/post/setting-up-docker-on-macos-m1-arm64-to-use-debian-10.4-docker-engine/) to configure the VM with an open SSH port, as well as installing necessary tools, such as openssl-server and the Docker Engine.

Alternatively, you can use VirtualBox on Intel/AMD64 architectures or create your own AMD64 UTM VM by downloading a Debian AMD64 ISO installer and installing Debian on the VM.

## Basic Script Usage

### To connect the Docker socket using SSH:

```
$ dockerdeb-connect-socket.sh arm64
```

NOTE: Use x86_64 if on Intel or AMD64 hardware.


### To create a tunnel between port 3000 and 8080 from the host to a container:

```
$ dockerdeb-connect-tunnels.sh -a arm64 -p 3000 -p 8080
```

### To kill SSH port forwarding for port 3000

```
$ dockerdeb-kill-tunnels.sh -a arm64 -p 3000
```

### To disconnect the socket from the host to the VM

```
$ dockerdeb-kill-socket.sh arm64
```

### To run an x86_64 VM and connect to that Docker socket instead

```
$ $(dockerdeb-use.sh x86_64)
```

NOTE: This sets DOCKER_HOST to `unix:///tmp/docker-on-debianx64.sock` while the default is `unix:///tmp/docker-on-debian.sock`, the ARM64 socket. Since there are two different sockets, we can run two VM's, one with an AMD64 (x86_64 VM) and one with ARM64, and we can connect different terminals to the different VM's. this allows us to run container images from other architectures at the same time.

## License 

Copyright (c) James Mortensen, 2022 MIT License

