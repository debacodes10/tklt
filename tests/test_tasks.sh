#!/bin/bash

source ../tests/test_framework.sh

echo "Testing task functionality..."

# Add a task
../bin/tasks.sh add "Test Task 1" "Description for Test Task 1" "High" "2025-01-20" "Pending"
assert_equals "$?" "0" "Add task command executed successfully"

# List tasks
output=$(../bin/tasks.sh list)
assert_equals "$(echo "$output" | grep -c 'Test Task 1')" "1" "Task listed successfully"

# Remove task
../bin/tasks.sh delete 1
assert_equals "$?" "0" "Remove task command executed successfully"

# Check task removed
output=$(../bin/tasks.sh list)
assert_equals "$(echo "$output" | grep -c 'Test Task 1')" "0" "Task removed successfully"

summary
