# Day 22 – Introduction to Git: My First Repository

Today I started my Git journey properly by practicing the basics step-by-step. Instead of just watching tutorials, I created my own repository and built commit history manually.

---

## Task 1: Install and Configure Git

First, I verified that Git was installed on my system.

```bash
git --version
```

Then I configured my Git identity:

```bash
git config --global user.name "Abhishek Singh"
git config --global user.email "your@email.com"
```

To verify everything was set correctly:

```bash
git config --list
```

This ensures my commits are linked to my identity.

---

## Task 2: Create My Git Project

I created a new folder and initialized it as a Git repository.

```bash
mkdir devops-git-practice
cd devops-git-practice
git init
```

Then I checked the repository status:

```bash
git status
```

I also explored the hidden `.git/` directory:

```bash
ls -a
cd .git
ls
```

I learned that this folder stores all commit history, branches, and Git metadata.

---

## Task 3: Create My Git Commands Reference

I created a file called:

```
git-commands.md
```

Inside this file, I started documenting:

- Setup & Configuration commands  
- Basic workflow commands  
- Viewing changes commands  

Each command includes a short description and example usage.

This file will grow as I learn more Git concepts.

---

## Task 4: Stage and Commit

I staged my file:

```bash
git add git-commands.md
```

Checked what was staged:

```bash
git status
```

Committed the changes:

```bash
git commit -m "Initial Git commands reference"
```

Viewed commit history:

```bash
git log
git log --oneline
```

---

## Task 5: Build Commit History

I updated the `git-commands.md` file multiple times by adding more commands like:

- git branch  
- git checkout  
- git remote  
- git reset  

After each update, I followed this workflow:

```bash
git diff
git add git-commands.md
git commit -m "Added new Git commands"
```

I repeated this process multiple times to create a clean commit history.

Finally, I viewed the compact history:

```bash
git log --oneline
```

This helped me understand how Git tracks changes over time.

---

## Task 6: Understanding the Git Workflow

### 1️⃣ Difference between git add and git commit

git add prepares the changes by moving selected files to the staging area.

git commit permanently saves those staged changes to the repository with a message.

Add = Prepare  
Commit = Save  

---

### 2️⃣ What does the staging area do?

The staging area allows me to choose exactly which changes to commit.

Without it, every small modification would be committed automatically, making the history messy. It gives control and structure.

---

### 3️⃣ What does git log show?

git log shows:

- Commit ID (hash)
- Author
- Date
- Commit message

It helps track project history.

---

### 4️⃣ What is the .git/ folder?

The `.git/` folder contains all version history and internal Git data.

If it is deleted, the project loses its Git history and becomes a normal folder.

---

### 5️⃣ Working Directory vs Staging Area vs Repository

Working Directory → Where I edit files  
Staging Area → Files prepared for commit  
Repository → Permanently stored commit history  

These three areas form the complete Git workflow.

---

## Final Thoughts

Today I understood how Git actually works internally instead of just memorizing commands.

This is the foundation for branching, merging, CI/CD pipelines, and real DevOps workflows.

I will continue updating my Git reference file as I learn more.
