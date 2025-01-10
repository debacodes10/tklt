#!/bin/bash

source ../tests/test_framework.sh

echo "Testing logging functionality..."

# Log a message
LOG_FILE="../logs/tasks.log"
message="Test log message"
source ../src/utils/logging.sh
log_info "$message"

# Check if the message is logged
assert_equals "$(grep -c "$message" "$LOG_FILE")" "1" "Log message written successfully"

summary
