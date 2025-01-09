#!/bin/bash

#Import db configuration
source "$(dirname "$0")/../src/core/database.sh" || { echo "Failed to load database.sh"; exit 1; }

# Core functions

# Add Task
add_task() {
	local title="$1"
	local description="$2"
	local priority="${3:-Medium}"
	local due_date="${4:-NULL}"
	local status="${5:-Pending}"

	echo "DEBUG: Title=$title, Description=$description, Priority=$priority, Due=$duedate, Status=$status"

	if [[ -z "$title" ]]; then
		echo "ERROR: Task title cannot be empty." >&2
		return 1
	fi

	sqlite3 "$DB_PATH" "INSERT INTO tasks (title, description, priority, due_date, status, created_at) VALUES ('$title', '$description', '$priority', '$due_date', '$status', datetime('now'));" 

	if [[ $? -eq 0 ]]; then
		echo "$title task added."
	else
		echo "Failed to add task. Check logs/tasks.logs" >&2
	fi
}

# List Task
list_tasks() {
	echo "ID | Title | Description | Priority | Due Date | Status | Created At"
	echo "____________________________________________________________________"
	sqlite3 "$DB_PATH" "SELECT id, title, description, priority, due_date, status, created_at FROM tasks;"
}

# Delete Task
delete_task() {
	local task_id="$1"
	if [[ -z "$task_id" ]]; then
		echo "Error: Task ID is required to delete a task." >&2
		return 1
	fi

	sqlite3 "$DB_PATH" "DELETE FROM tasks WHERE id = $task_id;"
	if [[ $? -eq 0 ]]; then
		echo "Task with ID $task_id deleted successfully."
	else
		echo "Failed to delete task with ID $task_id." >&2
	fi
}

# Search Task
search_tasks() {
	local keyword="$1"

	if [[ -z "$keyword" ]]; then
		echo "ERROR: Search keyword cannot be empty." >&2
		return 1
	fi

	echo "ID | Title | Description | Priority | Due Date | Status | Created At"
	echo "____________________________________________________________________"
	sqlite3 "$DB_PATH" "SELECT id, title, description, priority, due_date, status FROM tasks WHERE title LIKE '%$keyword%' OR description LIKE '%$keyword%';"
}

# Update Task
update_task() {
	local task_id="$1"
	local column="$2"
	local value="$3"

	if [[ -z "$task_id" || -z "$column" || -z "$value" ]]; then
		echo "ERROR: ID, column and value are required to update a task." >&2
		return 1
	fi

	sqlite3 "$DB_PATH" "UPDATE tasks SET $column='$value' WHERE id=$task_id;"
	if [[ $? -eq 0 ]]; then
		echo "Task with ID $task_id updated: $column = $value."
	else
		echo "Failed to update task $task_id." >&2
	fi
}

# List filtered Tasks
list_filtered_tasks() {
	local filter_column="$1"
	local filter_value="$2"

	if [[ -z "$filter_column" || -z "$filter_value" ]]; then
		echo "ERROR: Filter column and value are required." >&2
		return 1
	fi
	
	echo "ID | Title | Description | Priority | Due Date | Status | Created At"
	echo "____________________________________________________________________"
	sqlite3 "$DB_PATH" "SELECT id, title, description, priority, due_date, status, created_at FROM tasks WHERE $filter_column = '$filter_value';"
}
