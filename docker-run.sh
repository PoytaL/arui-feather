#!/bin/bash

__START_TIME=$(date +%s)

appName=$1
appVersion=$2

echo "Remove running container, if exists…"
docker rm -f $appName

echo "Running container…"
docker run -it \
    -v $PWD/src:/home/nodejs/app/src \
    -v $PWD/__tests__:/home/nodejs/app/__tests__ \
    -v $PWD/package.json:/home/nodejs/app/package.json \
    -v $PWD/integration-tests:/home/nodejs/app/integration-tests \
    --name $appName $appName:$appVersion