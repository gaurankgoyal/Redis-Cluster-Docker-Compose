#!/bin/bash
set -e

request=$1
if [ "$request" == "CREATE" -o "$request" == "DESTROY" ]
then
  case $request in
    CREATE)
      echo "----CREATING REDIS CLUSTER----"
      sleep 2
      echo `docker-compose up -d`
      echo "-----CLUSTER DETAILS-----"
      sleep 10
      docker logs redis-cluster-init > cluster_info.txt
      more cluster_info.txt
      ;;
    DESTROY)
      echo "DESTROYING CLUSTER"
      echo `docker-compose down`
      docker volume rm redis_cluster_redis-cluster_data-0 redis_cluster_redis-cluster_data-1 redis_cluster_redis-cluster_data-2 redis_cluster_redis-cluster_data-3 redis_cluster_redis-cluster_data-4 redis_cluster_redis-cluster_data-5
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
