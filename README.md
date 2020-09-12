# Redis Cluster Via Docker Compose


## Redis Cluster

Docker Compose to Deploy Redis Cluster in Docker in Data Sharding technique with 3 master and 3 slaves

### How to Deploy Redis Cluster?
In order to start Redius Cluster, run the below command.

```bash
git clone https://github.com/gaurankgoyal/Locusnine-Project.git
cd Locusnine-Project
sh run.sh CREATE
```

It will start a redis cluster with 3 master and 3 slave nodes in data sharding mode.


### Destroy Cluster
In order to destroy cluster run the below command

```bash
sh run.sh DESTROY
```


### Monitoring CLUSTER

redis state container is also packaged with this solution, which gives the basic
cluster monitoring. redis state UI can be access on ```localhost:8080```

## NodeJS Client

Simple node js publisher and scriber application using ioredis nmp module.

### How to start Publisher and Subscriber?

In order to start nodejs publisher run the below

```bash
sh start_publisher.sh
```

In order to start nodejs subscriber run the below

```bash
sh start_subscriber.sh
```


## Tools and Tech Used

* Docker
* Docker-Compose
* Shell Script
* ioredis npm package
* nodeJS
