#!/bin/bash

DATA_DIR="../data"
DB_FILE="${DATA_DIR}/tasks.db"
LOG_DIR="../logs"
LOG_FILE="${LOG_DIR}/tasks.log"

echo "Setting up the environment..."

if [[ ! -d "$DATA_DIR" ]]; then
	echo "Creating data directory..."
	mkdir -p "$DATA_DIR" || { echo "Failed to create data directory."; exit 1; }
fi

if [[ ! -f "$DB_FILE" ]]; then
    echo "Initializing database file..."
    sqlite3 "$DB_FILE" "CREATE TABLE IF NOT EXISTS tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT,
        priority TEXT DEFAULT 'Medium',
        due_date TEXT,
        status TEXT DEFAULT 'Pending',
        created_at TEXT NOT NULL
    );" || { echo "Failed to initialize database"; exit 1; }
else
    echo "Database file already exists."
fi

# Create logs directory and log file
if [[ ! -d "$LOG_DIR" ]]; then
    echo "Creating logs directory..."
    mkdir -p "$LOG_DIR" || { echo "Failed to create logs directory"; exit 1; }
fi

if [[ ! -f "$LOG_FILE" ]]; then
    echo "Creating log file..."
    touch "$LOG_FILE" || { echo "Failed to create log file"; exit 1; }
else
    echo "Log file already exists."
fi

# Set permissions
chmod -R u+w "$DATA_DIR" "$LOG_DIR"
echo "Environment setup complete."
