#!/bin/bash

LOG_DIR="$1"

# Check if argument given
if [ -z "$LOG_DIR" ]; then
    echo "Usage: $0 <log_directory>"
    exit 1
fi

# Check if directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Directory does not exist!"
    exit 1
fi

echo "Starting log rotation in $LOG_DIR"

# Count old .log files
compressed_count=$(find "$LOG_DIR" -name "*.log" -mtime +7 | wc -l)

# Compress logs older than 7 days
find "$LOG_DIR" -name "*.log" -mtime +7 -exec gzip {} \;

# Count old .gz files
deleted_count=$(find "$LOG_DIR" -name "*.gz" -mtime +30 | wc -l)

# Delete compressed files older than 30 days
find "$LOG_DIR" -name "*.gz" -mtime +30 -delete

echo "Compressed files: $compressed_count"
echo "Deleted files: $deleted_count"

echo "Log rotation completed."

