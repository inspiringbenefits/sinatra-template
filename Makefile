.DEFAULT_GOAL:=help
SHELL:=/bin/bash

.PHONY: help install start test_setup test

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

install:  ## Checks and installs dependencies
	$(info Checking and getting dependencies)
	@docker-compose run --rm template bash -c "bundle check || bundle install"

start: ## Starts the development server
	$(info Starting the development server)
	@docker-compose run --rm --service-ports template bundle exec rackup --host 0.0.0.0 -p 9091

test: ## Starts the test runner
	$(info Running tests)
	@docker-compose run --rm template bundle exec rspec --format documentation
