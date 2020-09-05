# Locusnine-Project

## Redis Cluster

Docker Compose to Deploy Redis Cluster in Docker in Data Sharding technique with 3 master and 3 slaves

### How to Deploy Redis Cluster?
In order to start Redius CLuster, run the below command.

```
git clone https://github.com/gaurankgoyal/Locusnine-Project.git
cd Locusnine-Project
sh run.sh CREATE
```

It will start a redis cluster with 3 master and 3 slave node in data sharding mode.


### Destroy Cluster
In order to destroy cluster run the below command

```sh run.sh DESTROY```

## NodeJS Client

Simple node js publisher and scriber application using ioredis nmp module.

### How to start?

In order to start nodejs publisher run the below

```sh start_publisher.sh```

In order to start nodejs subscriber run the below

```sh start_subscriber.sh```
