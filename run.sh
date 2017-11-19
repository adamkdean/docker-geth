#!/bin/bash

cd "${0%/*}"

# ensure host has docker installed
if ! [ -x "$(command -v docker)" ]; then
  echo "error: docker not found, please see https://get.docker.com/"
  exit 1
fi

# build image
docker build --tag geth .

# remove existing container if necessary
GETH_EXISTS=$(docker ps -a --format "{{.Names}}" | grep ^geth$)
if [[ ! -z $GETH_EXISTS ]]; then
  docker stop geth
  docker rm geth
fi

# run local geth container
docker run \
  --detach \
  --restart always \
  --publish 8545:8545 \
  --name geth \
  geth