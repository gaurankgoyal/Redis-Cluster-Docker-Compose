#!/bin/bash

# Build Docker image
echo "building docker image.."
docker build -t node-publisher-npm .

NETWORK_NAME=`docker network ls | grep "redis_cluster" | awk '{print $2}'`

echo "image build completed.."
echo "Starting Publisher..."
docker run -d --net=$NETWORK_NAME node-publisher-npm
