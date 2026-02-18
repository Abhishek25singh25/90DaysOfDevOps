# Day 20 – Log Analyzer & Report Generator

## Overview

Today I built a Bash script that analyzes a system log file and generates a structured summary report.

Instead of manually reading logs line by line, the script automates error detection and report creation.

This exercise helped me understand how real-world log monitoring works in production environments.

---

## What the Script Does

The script performs the following steps:

- Accepts a log file as input.
- Validates whether the file exists.
- Counts total lines in the log.
- Counts suspicious events such as error, failed, panic, denied, and critical.
- Extracts CRITICAL and PANIC events along with their line numbers.
- Identifies the top 5 most common error messages.
- Generates a dated summary report file.

---

## Sample Result (Linux_2k.log)

- Total suspicious events found: 47
- Report generated successfully.
- Summary saved in a file named: log_report_<date>.txt

---

## Tools Used

- grep for searching patterns
- wc for counting lines
- sort and uniq for identifying repeated messages
- date for timestamped report naming

---

## What I Learned

1. How to analyze large log files using simple Linux commands.
2. How command pipelines can extract meaningful insights from raw data.
3. How automation reduces manual troubleshooting effort.

---

This project strengthened my understanding of log parsing and error analysis using Bash scripting.

Day 20 completed.
