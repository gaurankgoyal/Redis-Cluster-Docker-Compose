#!/bin/bash

trap ctrl_c INT

function ctrl_c() {
        echo "** Trapped CTRL-C"
        echo "Kill container subscriber"
        docker stop subscriber
        docker container rm subscriber
        exit 1
}
# Build Docker image
echo "building docker image.."
docker build -t node-subscriber-npm /node_subscriber.

NETWORK_NAME=`docker network ls | grep "redis_cluster" | awk '{print $2}'`

echo "image build completed.."
echo "Starting Subscriber..."
docker run -d --net=$NETWORK_NAME --name subscriber node-subscriber-npm
while [ 1 ]   # Endless loop.
do
  echo "Press CTRL-C to Kill Subsriber"
  docker logs subscriber
  sleep 2
  clear
done
)
