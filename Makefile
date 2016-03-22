CLI=./node_modules/magic-root/bin/cli.sh

# default parameters:
# export NODE_BIN=node_modules/.bin/test
# export CONTAINER_NAME=magic-localhost
# export JS_ROOT_DIR=src/js
# export MAGIC_BIN=node_modules/magic-root/bin
# export NODEJS_SRC_FILES=src/config.js src/index.js
# export NODEJS_OUT_FILE=out/index.js

.PHONY: \
	all \
	build \
	clean \
	lint \
	lint-fix \
	rm \
	run

all: help

build:
	@${CLI} build

lint:
	@${CLI} lint

lint-fix:
	@${CLI} lint-fix

clean:
	@${CLI} clean

debug:
	@${CLI} debug

logs:
	@${CLI} logs

rm:
	@${CLI} docker-rm

run:
	@${CLI} run

ip:
	@${CLI} ip

help:
	@${CLI} help