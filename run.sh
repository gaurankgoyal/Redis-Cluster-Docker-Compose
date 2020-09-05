#!/bin/bash
set -e

request=$1
if [ "$request" == "CREATE" -o "$request" == "DESTROY" ]
then
  case $request in
    CREATE)
      echo "------CREATING REDIS CLUSTER-------"
      sleep 2
      echo `docker-compose  -f redis_cluster/docker-compose.yml up -d`
      echo "----------CLUSTER DETAILS----------"
      sleep 10
      docker exec redis-node-1 redis-cli cluster nodes > cluster_info.txt
      CAT cluster_info.txt
      echo "----------------DONE---------------"
      ;;
    DESTROY)
      echo "DESTROYING CLUSTER"
      echo `docker-compose  -f redis_cluster/docker-compose.yml down`
      echo "DELETE VOLUMES"
      VOLUMES=`docker volume ls | grep "redis-cluster_data-" | awk '{print $2}'`
      docker volume rm $VOLUMES
      ;;
    esac
else
  echo "ERROR"
  tput setaf 1; echo "#Inavlid Usage #"
  tput setaf 1; echo "#Correct Usage as below:#"
  tput setaf 1; echo "run.sh <INPUT_PARAMETER>"
  tput setaf 1; echo "valid values for <INPUT_PARAMETER> are CREATE and DESTORY"
  tput setaf 7;
fi
