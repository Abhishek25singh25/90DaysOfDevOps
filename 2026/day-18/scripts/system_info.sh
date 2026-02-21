#!/bin/bash
set -euo pipefail

section() {
    echo
    echo "------------------------------------------------------------"
    echo "$1"
    echo "------------------------------------------------------------"
}

print_system_info() {
    section "Basic System Details"
    echo "Hostname          : $(hostname)"
    echo "Operating System  : $(uname -s) $(uname -r)"
    echo "Architecture      : $(uname -m)"
}

print_uptime() {
    section "System Uptime"
    echo "The system has been running for:"
    uptime -p
}

print_memory_usage() {
    section "Memory Usage Overview"
    echo "Current memory status:"
    free -h
}

print_disk_usage() {
    section "Disk Usage Summary (Top 5 in Current Directory)"
    echo "Largest items in this directory:"
    du -sh * 2>/dev/null | sort -rh | head -n 5 || \
    echo "Unable to determine disk usage (empty directory or permission issue)."
}

print_cpu_processes() {
    section "Top 5 CPU-Consuming Processes"
    echo "Processes currently using the most CPU:"
    ps -eo user,pid,%cpu,%mem,comm --sort=-%cpu | head -n 6
}

main() {
    echo
    echo "SYSTEM INFORMATION REPORT"
    echo "Generated on: $(date)"
    echo

    print_system_info
    print_uptime
    print_memory_usage
    print_disk_usage
    print_cpu_processes

    echo
    echo "Report completed successfully."
    echo
}

main

