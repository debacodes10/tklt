# Variables
SHELL := /bin/bash

# Targets
setup:
	@bash ./setup.sh

clean:
	rm -rf ../data/*.db ../logs/*.log

test:
	@for test in ../tests/*.sh; do \
		echo "Running $$test..."; \
		bash "$$test"; \
		echo ""; \
	done

help:
	@echo "Makefile commands:"
	@echo "  setup  - Sets up the environment for the tool."
	@echo "  clean  - Cleans up the database and log files."
	@echo "  test  - Runs tests for setup, tasks, and logs."
	@echo "  help   - Displays this help message."
