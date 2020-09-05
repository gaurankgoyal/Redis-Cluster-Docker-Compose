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
      echo `docker logs redis-cluster-init`
      ;;
    DESTROY)
      echo "DESTROYING CLUSTER"
      echo `docker-compose down`
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
