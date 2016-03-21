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

debug:
	@./cli.sh debug

logs:
	@./cli.sh logs

rm:
	@./cli.sh docker-rm

run:
	@./cli.sh run

ip:
	@./cli.sh ip

help:
	@./cli.sh help