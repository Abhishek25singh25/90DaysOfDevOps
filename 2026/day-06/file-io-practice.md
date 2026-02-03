# Day 06 – Linux File Read and Write (Notes)

## What I Studied Today
Today I learned how to read and write text files in Linux using basic commands.
I practiced creating a file, writing text into it, adding new lines, and reading the file in different ways.

---

## Why File Handling Is Important
In Linux and DevOps, most important things are text files:
- log files
- configuration files
- script outputs

If file handling is clear, debugging becomes easier and faster.

---

## Creating a File
A file can be created in Linux even if it is empty.
Creating an empty file is useful when we want to store data later, such as logs or notes.

---

## Writing Text into a File
Text can be written directly into a file from the terminal.
While writing, it is important to understand that:
- Writing can remove old content
- Writing can also add new content below existing text

Choosing the correct method is important to avoid losing data.

---

## Appending Text to a File
Appending means adding new lines without deleting old lines.
This is commonly used in log files where old data must be preserved.
Appending is safer than overwriting.

---

## Reading a File Using `cat`
The `cat` command is used to read the full content of a file.
It displays everything inside the file at once.
This is useful for small files.

---

## Reading Parts of a File Using `head` and `tail`
Sometimes files are very large, so reading the full file is not needed.

- `head` is used to read the starting lines of a file  
- `tail` is used to read the ending lines of a file  

This is very useful while checking logs, where recent entries matter more.

---

## Using `tee` Command
The `tee` command is used to display output on the screen and write it into a file at the same time.
It is useful while running commands or scripts where we want to see the output and also save it.

---

## What I Learned Today
- Linux treats logs and configs as simple text files
- Writing and appending files must be done carefully
- `cat`, `head`, and `tail` help in reading files efficiently
- `tee` is useful for logging and visibility together

---

## One Line Summary
Day 06 helped me understand how to safely read, write, and view text files in Linux, which is essential for daily DevOps work.

---

End of Day 06 Notes
