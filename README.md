# docker-swarm-example

## Docker machine

A very useful way to managing containers - not just in the local environemt. Using the generic driver we can add docker instances from remote locations. 

## How to use

### Service discovery

First we need service discovery, I use consul here, but etcd is just as valid. Start consul on a plain docker host
```sh
# Create the docker-machine
./consul.sh <machine ip>
```

### Swarm manager
This manages the swarm, all agents get connected to this node through the service discovery. 

```
./manager.sh <consul ip> <machine ip> <name>
```

This command creates a machine configured with swarm to look at the consul service discovery

### Agent
Very similar script to `manager.sh`, instead of being a manager this one will be an agent.

```
./agent.sh <consul ip> <machine ip> <name>
```

### Network
Create the overlay network that links the docker hosts.

```sh
./network.sh
```

## Example app
Start a sample nginx on one and connect to from another
### Nginx

Start an nginx instance on a node
```sh
./nginx_app01.sh <swarm agent name (can include manager)>
```

### Request
```sh
./request.sh <a different node name>
```
