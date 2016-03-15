#!/bin/bash -e

MACHINE=$1

docker-machine create -d generic --generic-ip-address=$MACHINE

docker run -d \
	-p "8500:8500" \
	-h "consul" \
	--restart=always \
	progrium/consul -server -bootstrap
