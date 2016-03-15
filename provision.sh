# Need a kv store, I use consul here

CONSUL=$1
MACHINE=$2
NAME=$3

docker-machine create \
    -d gereric \
    --swarm \
    --swarm-master \
    --swarm-discovery="consul://$MACHINE:8500" \
    --engine-opt="cluster-store=consule://$MACHINE:8500" \
    --engine-opt="cluster-advertise=eth1:2376" \
    $NAME
