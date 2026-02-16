# Day 18 – Shell Scripting: Functions & Strict Mode

## Overview

Today I focused on writing cleaner and more structured shell scripts. Instead of writing everything in one block, I started breaking scripts into proper functions. I also learned how strict mode helps prevent hidden errors.

This felt like moving from beginner scripting to writing something closer to real-world scripts.

---

## Task 1 – Basic Functions

I created a script with:

* A `greet` function that takes a name and prints a greeting
* An `add` function that takes two numbers and prints their sum
* Called both functions from the main script

This helped me understand how arguments are passed inside functions and how code can be reused.

---

## Task 2 – Disk & Memory Check

I wrote a script with:

* A function to check disk usage using `df -h`
* A function to check memory usage using `free -h`
* A main section that calls both functions

This felt more practical and closer to monitoring scripts used in real systems.

---

## Task 3 – Strict Mode (`set -euo pipefail`)

I added:

```
set -euo pipefail
```

### What I observed:

* `set -e` → Script exits immediately if a command fails
* `set -u` → Script stops if an undefined variable is used
* `set -o pipefail` → Script fails if any command inside a pipeline fails

This makes scripts safer and prevents silent failures.

---

## Task 4 – Local Variables

I created a script that used `local` variables inside a function.

Observation:

* Variables declared as `local` stay inside the function
* Without `local`, variables can affect the global scope

This made variable handling clearer and safer.

---

## Task 5 – System Info Reporter

I built a structured script that:

* Prints hostname and OS info
* Shows uptime
* Displays disk usage
* Shows memory usage
* Lists top CPU-consuming processes
* Uses a `main` function to organize everything

The output looked clean and properly structured.

---

## What I Learned

* Functions make scripts reusable and easier to manage
* Strict mode prevents unexpected failures
* Local variables improve script safety
* Structured scripts look more professional

Today’s scripting felt more organized and production-oriented compared to earlier days.
