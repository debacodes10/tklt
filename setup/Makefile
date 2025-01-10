# Variables
SHELL := /bin/bash

# Targets
setup:
	@bash ./setup.sh

run:
	@bash ./../bin/tasks.sh

clean:
	rm -rf ../data/*.db ../logs/*.log

help:
	@echo "Makefile commands:"
	@echo "  setup  - Sets up the environment for the tool."
	@echo "  run    - Runs the task management tool."
	@echo "  clean  - Cleans up the database and log files."
	@echo "  help   - Displays this help message."
