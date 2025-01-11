# Task Management Tool (TKLT)

![Task Management Tool - TKLT](../assets/readme_logo.jpeg)

## Overview
**TKLT** (Task Management Tool) is a simple, CLI-based task management tool built using Bash and SQLite3. This tool allows users to efficiently manage tasks with the ability to add, list, update, delete, search, and filter tasks from a local SQLite database. The tool provides an easy-to-use command-line interface to organize tasks with essential attributes like title, description, priority, due date, and status.

Whether you're working on personal projects or need a simple solution to track tasks, TKLT makes it easy to interact with your tasks from the terminal.

### Key Features:
- **Add Task**: Add a new task with custom title, description, priority, due date, and status.
- **List Tasks**: View all tasks stored in the database.
- **Update Task**: Modify the details of an existing task.
- **Delete Task**: Remove a task by its ID.
- **Search Tasks**: Search tasks by title or description using a keyword.
- **Filter Tasks**: Filter tasks based on a specific column value (e.g., priority or status).
- **Export Tasks**: Export tasks in a structured format for backup or reporting.

### Technology Stack:
- **Bash**: For scripting and managing task operations.
- **SQLite3**: For storing task data in a lightweight, self-contained database.

This tool is designed to be simple, lightweight, and quick to set up, offering essential task management functionality right in your terminal.

## Prerequisites
Before using the tool, ensure that you have the following installed:
- **Bash**: A compatible version of the Bash shell.
- **SQLite3**: SQLite3 is used for storing the tasks in a local database.

---

## Setup Instructions

### 1. Install Dependencies
Ensure that Bash and SQLite3 are installed on your system. On most Linux distributions, you can install SQLite3 using the following command:
```bash
sudo apt-get install sqlite3
```

### 2. Set Up the Environment
To set up the environment, navigate to the setup folder and run the setup process:
```bash
cd setup
make setup
```

### 3. Run Tests
Before proceeding with normal use, you can run the tests to verify that everything is functioning correctly:
```bash
cd setup
make test
```

## Commands

### Accessing Help
To view the available commands and their usage, run the help command from the bin directory:
```bash
cd bin
./tasks.sh help
```

### Running TKLT
To run the task management tool manually, use the following command:
```bash
cd bin
./tasks.sh
```

## Maintenance

### Clean Logs and Data
To remove logs and reset the data folder, use the clean command from the setup directory:
```bash
cd setup
make clean
```

## Contributing
Feel free to fork this repository, contribute, or create an issue if you encounter any bugs or have suggestions for improvements. Please follow the coding standards and submit pull requests with clear explanations of changes.
