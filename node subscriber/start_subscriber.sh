#!/bin/bash

# Build Docker image
echo "building docker image.."
docker build -t node-subscriber-npm .

NETWORK_NAME=`docker network ls | grep "redis_cluster" | awk '{print $2}'`

echo "image build completed.."
echo "Starting Subscriber..."
docker run --net=$NETWORK_NAME node-subscriber-npm
