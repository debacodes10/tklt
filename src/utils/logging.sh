#!/bin/bash

LOG_DIR="../logs"
ls ../logs

log_message() {
	local log_level="$1"
	local message="$2"
	local log_file="$LOG_DIR/tasks.log"

	local timestamp
	timestamp=$(date "+%Y-%m-%d %H:%M:%S")

	echo "[$timestamp] [$log_level] $message" >> "$log_file"
}

log_info(){
	log_message "INFO" "$1"
}

log_error() {
	log_message "ERROR" "$1"
}

log_debug() {
	log_message "DEBUG" "$1"
}

rotate_logs() {
	local log_file="$LOG_DIR/tasks.log"
	local max_size=1048576 #1 MB in bytes

	if [[ -f "$log_file" && $(stat -c%s "$log_file") -gt $max_size ]]; then
		mv "$log_file" "$log_file.$(date "+%Y%m%d%H%M%S")"
		log_info "Log file rotated."
	fi
}
