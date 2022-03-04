#!/bin/bash

# Get the port tunnel options
Ports=()
while getopts ":a:hp:" option; do
   case $option in
      a) # arch
         arch=$OPTARG;;
      h) # display Help
         Help
         exit;;
      p) # Enter a name
         port=$OPTARG;
         Ports+='-i :'$port' ';;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done
shift $(($OPTIND + 1))


if [ -z "$arch" ]
then
    echo "No architecture given: Options are to connect to the Docker Debian 'arm64' or 'x86_64' using -a flag"
    exit;
elif [ -z $port ]
then
    echo "No port given. At least one port must be specified with -p flag."
    exit;
elif [ $arch == "arm64" ]
then
    username=debian
    sshPort=22022
    echo "Killing SSH Tunnels for Docker on Debian Arm64"
elif [ $arch == "x86_64" ]
then
    username=debianx64
    sshPort=20002
    echo "Killing SSH Tunnels for Docker on Debian x86_64"
else
    echo "Incorrect arch: Options are to connect to the Docker Debian 'arm64' or 'x86_64'"
fi

lsof -i $Ports |grep ssh| kill `awk '{print $2}'`

# lsof -i :$PORT_1 -i :$PORT_2|grep ssh| kill `awk '{print $2}'`
