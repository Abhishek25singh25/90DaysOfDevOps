# Day 09 — Linux User & Group Management Challenge

## Overview

This challenge focused on hands-on Linux user and group management. The goal was to simulate a real-world multi-user environment where permissions and collaboration matter.

---

## Users & Groups Created

Users created:

- tokyo  
- berlin  
- professor  
- nairobi  

Groups created:

- developers  
- admins  
- project-team  

---

## Group Assignments

- tokyo → developers, project-team  
- berlin → developers, admins  
- professor → admins  
- nairobi → project-team  

---

## Directories Created

Shared workspace directories were configured with proper group ownership and permissions:

- `/opt/dev-project` → group: developers → permission: 775  
- `/opt/team-workspace` → group: project-team → permission: 775  

These directories allow group collaboration while maintaining controlled access.

---

## Commands Used

- useradd  
- passwd  
- groupadd  
- usermod  
- mkdir  
- chgrp  
- chmod  
- groups  
- ls  

---

## Verification Steps

- Checked user creation in `/etc/passwd`  
- Verified group entries in `/etc/group`  
- Confirmed directory permissions using `ls -ld`  
- Tested file creation using different users  

---

## What I Learned

- Linux users and groups control system access and collaboration  
- Correct permissions are essential for shared environments  
- System directories require elevated privileges  
- Troubleshooting permission errors improves understanding  
- Path accuracy is critical in Linux operations  

---

## Conclusion

This exercise strengthened my practical understanding of Linux user management, permissions, and multi-user collaboration — essential skills in DevOps workflows.
