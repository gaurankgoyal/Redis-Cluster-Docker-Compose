#!/bin/bash

trap ctrl_c INT

function ctrl_c() {
        echo "** Trapped CTRL-C"
        echo "Kill container publisher"
        docker kill publisher
        docker container rm publisher
        exit 1
}

# Build Docker image
echo "building docker image.."
docker build -t node-publisher-npm node_publisher/.

NETWORK_NAME=`docker network ls | grep "redis_cluster" | awk '{print $2}'`

echo "image build completed.."
echo "Starting Publisher..."
docker run -d --net=$NETWORK_NAME --name publisher node-publisher-npm
while [ 1 ]   # Endless loop.
do
  echo "Press CTRL-C to Kill publisher"
  docker logs --tail 25 publisher
  sleep 2
  clear
done
)
