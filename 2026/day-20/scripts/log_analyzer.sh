#!/bin/bash

# =====================================
# Task 1: Input & Validation
# =====================================

LOG_FILE="$1"

if [ -z "$LOG_FILE" ]; then
    echo "Usage: $0 <logfile>"
    exit 1
fi

if [ ! -f "$LOG_FILE" ]; then
    echo "File does not exist"
    exit 1
fi

echo "=========================================="
echo "Log Analyzer Started"
echo "Processing file: $LOG_FILE"
echo "=========================================="

# =====================================
# Task 2: Error Count
# =====================================

echo ""
echo "---- Counting ERROR and Failed ----"

ERROR_COUNT=$(grep -c -E "ERROR|Failed" "$LOG_FILE")
echo "Total Errors Found: $ERROR_COUNT"

# =====================================
# Task 3: Critical Events
# =====================================

echo ""
echo "---- Critical Events ----"

CRITICAL_LINES=$(grep -n "CRITICAL" "$LOG_FILE")
echo "$CRITICAL_LINES"

# =====================================
# Task 4: Top 5 Error Messages
# =====================================

echo ""
echo "---- Top 5 Error Messages ----"

TOP_ERRORS=$(grep "ERROR" "$LOG_FILE" \
| awk '{ $1=""; $2=""; $3=""; print }' \
| sort \
| uniq -c \
| sort -rn \
| head -5)

echo "$TOP_ERRORS"

# =====================================
# Task 5: Generate Summary Report
# =====================================

REPORT_DATE=$(date +%Y-%m-%d)
REPORT_FILE="log_report_$REPORT_DATE.txt"

echo "Generating report: $REPORT_FILE"

{
    echo "Log Analysis Report"
    echo "Date of Analysis: $REPORT_DATE"
    echo "Log File: $LOG_FILE"
    echo "----------------------------------------"
    echo "Total Errors (ERROR + Failed): $ERROR_COUNT"
    echo ""
    echo "Top 5 Error Messages:"
    echo "$TOP_ERRORS"
    echo ""
    echo "Critical Events:"
    echo "$CRITICAL_LINES"
} > "$REPORT_FILE"

echo "Report Generated Successfully: $REPORT_FILE"

echo ""
echo "Log Analysis Completed"

