# Day 16 – Shell Scripting Basics

## Overview

Today I started learning the basics of shell scripting. The goal was to understand how simple commands can be automated using scripts. Instead of running commands manually every time, scripts help automate repetitive tasks.

---

## Task 1 – My First Script

Created a file named `hello.sh` with:

* Shebang line: `#!/bin/bash`
* Used `echo` to print: Hello, DevOps!

After making it executable using `chmod +x`, the script ran successfully.

### What I Observed

If the shebang line is removed, the script may not execute directly with `./hello.sh`. It would need to be run using `bash hello.sh`.

---

## Task 2 – Variables

Created `variables.sh` with:

* A variable for my name
* A variable for my role
* Printed both using echo

### Key Learning

* No spaces around `=`
* Double quotes allow variable expansion
* Single quotes print text exactly as written

---

## Task 3 – User Input

Created `greet.sh`:

* Used `read` to take user input
* Asked for name and favourite tool
* Printed a personalized message

This made the script interactive.

---

## Task 4 – If-Else Conditions

Created two scripts:

1. `check_number.sh`

   * Takes a number as input
   * Checks if it is positive, negative, or zero

2. `file_check.sh`

   * Takes a filename
   * Checks if the file exists using `-f`

This helped me understand how logical conditions work in bash.

---

## Task 5 – Combining Everything

Created `server_check.sh`:

* Stored a service name in a variable
* Asked user if they want to check status
* Used if-else to either run `systemctl status` or skip

This felt like real automation practice.

---

## What I Learned

* Shebang defines which interpreter runs the script
* Variables store reusable data
* read makes scripts interactive
* If-else adds logic and decision-making
* Shell scripting is the first step toward automation in DevOps

Shell scripting is simple but powerful. Even small scripts can save time and reduce manual work.
