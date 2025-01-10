#!/bin/bash

source ../tests/test_framework.sh

echo "Testing setup script..."

# Run the setup script
../setup/setup.sh

# Check if directories and files exist
assert_equals "$(test -d ../data && echo "yes" || echo "no")" "yes" "Data directory exists"
assert_equals "$(test -f ../data/tasks.db && echo "yes" || echo "no")" "yes" "Database file exists"
assert_equals "$(test -d ../logs && echo "yes" || echo "no")" "yes" "Logs directory exists"
assert_equals "$(test -f ../logs/tasks.log && echo "yes" || echo "no")" "yes" "Log file exists"

summary
