#!/usr/bin/env bash

NODE_BIN=node_modules/.bin
CONTAINER_PORT=5000
CONTAINER_NAME=magic-localhost
IMAGE_TAG=magic:localhost

OUT_DIR=out

function build() {
  echo "start building docker container"

  docker build \
  --tag $IMAGE_TAG \
  --build-arg="PORT=$CONTAINER_PORT" \
    . # dot!

  echo "finished building docker container"
}

function run() {
  rm

  echo "start docker container"
  docker run \
    --name $CONTAINER_NAME \
    --publish 5000:5000 \
    --detach \
    $IMAGE_TAG
}

function rm() {
  echo "delete docker container"
  docker rm -f $CONTAINER_NAME
  echo "delete docker container finished"
}

function lint() {
  echo 'eslint start'
  $NODE_BIN/eslint \
    src/H.js src/config.js
  echo 'eslint done'
}

function lint-fix() {
  echo 'lint-fix start'
  $NODE_BIN/eslint \
    --fix \
    src/H.js src/config.js
  echo 'lint-fix end'
}

function help() {
  echo " \n\
make [task] \n\
\n\
running make without task starts a dev env \n\
\n\
build    - build docker container \n\
run      - run docker container \n\
clean    - remove build library and test files \n\
lint     - eslint javascript sources \n\
lint-fix - eslint and fix javascript sources \n\
rm       - remote docker container \n\
"
}

if [ $1 ]
then
  function=$1
  shift
  $function $@
else
  help $@
fi
