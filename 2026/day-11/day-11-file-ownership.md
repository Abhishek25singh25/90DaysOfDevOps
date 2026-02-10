# Day 11 – File Ownership Challenge (chown & chgrp)

## Objective

Practice Linux file ownership concepts by changing users and groups for files and directories. This simulates real-world DevOps permission management.

---

## Files & Directories Created

* devops-file.txt
* team-notes.txt
* project-config.yaml
* app-logs/
* heist-project/ (with subdirectories and files)
* bank-heist/ with multiple files

All items were verified using `ls -l` and `ls -lR`.

---

## Ownership Changes Performed

* Changed file owners using `chown`
* Modified group ownership using `chgrp`
* Updated owner and group together in one command
* Applied recursive ownership changes to directories

Example transitions:

* devops-file.txt → user:user → tokyo:user
* team-notes.txt → user:user → user:heist-team
* heist-project/* → user:user → professor:planners

Each change was verified immediately after execution.

---

## Commands Used

* `ls -l` — check ownership
* `sudo chown user file` — change owner
* `sudo chgrp group file` — change group
* `sudo chown user:group file` — change both
* `sudo chown -R user:group directory` — recursive change

---

## What I Learned

* File ownership controls access responsibility
* Groups enable shared collaboration
* Recursive ownership is essential for project directories
* Verification prevents permission mistakes
* Ownership structure matters in multi-user systems

---

## Key Takeaway

Ownership management ensures proper access control and is critical for application deployment, teamwork, and system security.

---

Day 11 completed successfully ✔
