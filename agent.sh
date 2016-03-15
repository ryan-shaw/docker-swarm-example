# Need a kv store, I use consul here

CONSUL=$1
MACHINE=$2
NAME=$3

docker-machine create \
    -d generic \
    --generic-ip-address $MACHINE \
    --swarm \
    --swarm-discovery="consul://$CONSUL:8500" \
    --engine-opt="cluster-store=consul://$CONSUL:8500" \
    --engine-opt="cluster-advertise=eth0:2376" \
    $NAME
