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
	@./cli.sh build

lint:
	@./cli.sh lint

lint-fix:
	@./cli.sh lint-fix

clean:
	@./cli.sh clean

rm:
	@./cli.sh rm

run:
	@./cli.sh run

ip:
	@./cli.sh ip

help:
	@./cli.sh help