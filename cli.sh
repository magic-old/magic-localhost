#!/usr/bin/env bash

NODE_BIN=node_modules/.bin
CONTAINER_NAME=magic-localhost
IMAGE_TAG=magic:localhost
JS_ROOT_DIR=src/js

OUT_DIR=out

function build() {
  echo "start building $CONTAINER_NAME docker container"

  build-browser-js
  build-node-js
  build-express-dirs

  docker build \
  --tag $CONTAINER_NAME \
    . # dot!

  echo "finished building docker container"
}

function build-browser-js() {
  echo "start building javascript bundles"

  mkdir -p out/js

  cp -r src/js/* out/js/
  echo "finished building javascript bundles"
}

function build-node-js() {
  echo "start building nodejs"

  mkdir -p out/

  $NODE_BIN/babel \
    --out-file out/index.js \
    src/config.js src/index.js # order is important

  echo "finished building nodejs"
}

function build-express-dirs() {
  echo "start copying express views and public dir"

  mkdir -p out/

  cp -r \
    src/public src/views \
    out/

  echo "finished copying express views and public dir"
}

function run() {
  docker-rm

  echo "start docker container"
  docker run \
    --name $CONTAINER_NAME \
    --detach \
    $IMAGE_TAG
}

function ip() {
  ip=$(python ./bin/ip.py $CONTAINER_NAME)
  echo "container $CONTAINER_NAME started with ip: $ip"
  echo $ip > ./IP.txt
}

function docker-rm() {
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

function clean() {
  echo "cleaning up out dir"

  rm -rf out

  echo "cleaning up finished"
}

function logs() {
  echo "connecting to container logs: $CONTAINER_NAME"
  docker logs --follow $CONTAINER_NAME
}

function debug() {
  docker-rm
  build

  echo "connecting to container $CONTAINER_NAME"
  docker run \
    --interactive \
    --tty \
    --name "$CONTAINER_NAME" \
    --entrypoint=sh "$CONTAINER_NAME"
}

function help() {
  echo "
make [task]

running make without task starts a dev env

build     - build docker container
run       - run docker container
clean     - remove build library and test files
lint      - eslint javascript sources
lint-fix  - eslint and fix javascript sources
debug     - connect to a debug container
logs      - tail the logs of the running container
clean     - remove out dir
docker-rm - remote docker container
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
