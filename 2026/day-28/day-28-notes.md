# Day 28 – Revision & Reflection

## 🔁 Self Assessment Summary

### ✅ Linux
- Comfortable with file system navigation and management
- Can manage processes (ps, top, kill, bg/fg)
- Understand systemd (start, stop, enable services)
- Comfortable with troubleshooting CPU, memory, disk
- Clear understanding of Linux file system hierarchy
- Can manage users, groups, permissions (chmod, chown, chgrp)
- Basic understanding of LVM
- Networking commands clear (ping, curl, ss, netstat, dig)

### ⚠️ Shell Scripting
- Comfortable with variables, loops, conditions
- Can write basic automation scripts
- Need more practice with:
  - Advanced error handling
  - Writing complex logic scripts
  - Debugging larger scripts

Plan: Daily hands-on scripting practice to improve confidence.

### ✅ Git & GitHub
- Confident with init, commit, branching
- Clear understanding of merge vs rebase
- Can use stash, cherry-pick, reset, revert
- Understand branching strategies
- Comfortable using GitHub CLI
- GitHub profile and repos organized

---

## 🧠 Revisited Topics

### 1. Shell Error Handling
Re-learned:
- `set -e` → Exit on error
- `set -u` → Treat unset variables as error
- `set -o pipefail` → Fail if any command in pipeline fails
- `trap` → Handle unexpected script termination

### 2. Git Reset vs Revert
- `git reset --hard` rewrites history and discards changes
- `git revert` creates a new commit to undo changes (safe for shared branches)

### 3. Networking Debugging
- Used `ss -tulnp` to check open ports
- Used `curl -I` to test web response headers
- Used `dig` to check DNS resolution

---

## 🎯 Quick-Fire Answers

1. `chmod 755 script.sh`
   → Owner gets full permissions (rwx)
   → Group & others get read and execute (r-x)

2. Process vs Service
   → Process = running instance of a program
   → Service = background process managed by systemd

3. Find process using port 8080
   → `ss -tulnp | grep 8080`

4. `set -euo pipefail`
   → Makes script fail safely on errors, unset variables, and pipeline failures

5. `git reset --hard` vs `git revert`
   → Reset rewrites history
   → Revert creates a new undo commit

6. Branching strategy for 5 dev team shipping weekly
   → GitHub Flow or Trunk-Based Development

7. `git stash`
   → Temporarily saves uncommitted changes

8. Schedule script at 3 AM daily
   → `0 3 * * * /path/to/script.sh`

9. `git fetch` vs `git pull`
   → Fetch downloads changes
   → Pull downloads + merges

10. LVM
   → Logical Volume Manager
   → Flexible disk management (resize, extend volumes without downtime)

---

## 👨‍🏫 Teach It Back – File Permissions Explained

Linux file permissions control who can read, write, or execute a file.

There are three types of users:
- Owner
- Group
- Others

Each has three permissions:
- Read (r)
- Write (w)
- Execute (x)

Example:
`chmod 755 script.sh`

7 → rwx (owner)
5 → r-x (group)
5 → r-x (others)

This ensures secure and controlled access to files.
