#!/bin/bash

REDIS_SERVER=""
IFS=' '
read -ra HOST <<< "$REDIS_NODES"
for i in "${HOST[@]}"; do
    SERVER=`ping "$i" -c1 | grep "PING" | awk '{print $3}' | sed -e 's/(//' -e 's/)//'`
    REDIS_SERVER="$REDIS_SERVER $SERVER:$PORT"
done

redis-cli --cluster create $REDIS_SERVER --cluster-replicas $REDIS_CLUSTER_REPLICAS --cluster-yes
echo "DONE"
