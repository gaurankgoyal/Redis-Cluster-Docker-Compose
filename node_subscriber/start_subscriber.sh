#!/bin/bash

# Build Docker image

trap ctrl_c INT

function ctrl_c() {
        echo "** Trapped CTRL-C"
        echo "Kill container subscriber"
        docker stop subscriber
        exit 1
}

echo "building docker image.."
docker build -t node-subscriber-npm .

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
