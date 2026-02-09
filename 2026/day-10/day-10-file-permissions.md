# Day 10 – File Permissions & File Operations Challenge

## Objective

Practice Linux file creation, reading, and permission management to understand how access control works in real systems.

---

## Files Created

* `devops.txt` — empty file created for permission testing
* `notes.txt` — file with sample content
* `script.sh` — simple script to test execute permissions

All files were verified using `ls -l` to inspect permissions.

---

## File Reading Practice

* Read file contents using `cat`
* Opened files in read-only mode
* Viewed system file snippets using `head` and `tail`

This helped reinforce how Linux handles file access safely.

---

## Understanding Permissions

Linux permissions follow the format:

```
rwx rwx rwx
owner group others
```

Where:

* **r (4)** → read
* **w (2)** → write
* **x (1)** → execute

Each file was inspected to understand who could read, write, or execute it.

---

## Permission Changes Performed

* Made `script.sh` executable and ran it successfully
* Converted `devops.txt` to read-only
* Set `notes.txt` permissions to restricted access
* Created a directory with defined permission levels
* Verified permission changes after each modification

A useful shortcut learned:

```
chmod a-w filename
```

This removes write access for everyone, instantly making a file read-only without numeric permission values.

---

## Permission Testing

* Attempted writing to a read-only file → permission denied
* Tried executing a non-executable file → blocked by system

These tests demonstrated how Linux enforces access security.

---

## Commands Used

* `touch` — create empty files
* `cat` — read file contents
* `vim` — edit/view files
* `head` / `tail` — partial file reading
* `chmod` — modify permissions
* `ls -l` — verify permission states

---

## What I Learned

* File permissions directly control system safety
* Execute access is required for scripts
* Permission errors are predictable and enforce security
* Symbolic chmod shortcuts simplify access control
* Verification after changes is critical

---

## Key Takeaway

Linux permissions are not just theory — they actively protect files and control execution. Understanding them is essential for real-world DevOps workflows.

---

Day 10 completed successfully ✔
