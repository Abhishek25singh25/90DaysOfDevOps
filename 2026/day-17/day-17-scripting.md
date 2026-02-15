# Day 17 – Shell Scripting: Loops, Arguments & Error Handling

## What I Worked On

Today I spent time making my scripts smarter. Instead of just printing text, I added loops, arguments, and basic error handling. It finally started to feel like real automation.

---

## Loops Practice

I wrote scripts using:

* **for loop** to print a list of fruits
* **for loop** to count from 1 to 10
* **while loop** to create a countdown

This helped me understand how repetitive tasks can be automated easily.

---

## Command-Line Arguments

I created a script that:

* Accepts a name as `$1`
* Prints a greeting
* Shows a usage message if no argument is passed

I also tested:

* `$#` → total number of arguments
* `$@` → all arguments
* `$0` → script name

This made it clear how scripts can take input directly from the command line.

---

## Installing Packages with Script

I built a small script that:

* Checks if it is running as root
* Loops through a list of packages
* Installs missing packages
* Skips the ones already installed

This felt practical because it's something I can actually use.

---

## Error Handling

I used:

* `set -e` to stop the script if any command fails
* `||` to print a message if something goes wrong

This made me realize scripts should not just work — they should fail safely.

---

## What I Learned

* Loops save time and reduce repetition
* Arguments make scripts flexible
* Root checks prevent permission errors
* Error handling makes scripts safer
* Scripting is basically automation thinking

Today felt like a proper step forward in my DevOps journey.
