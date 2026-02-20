# Day 23 – Git Branching & GitHub Practice Notes

---

# 1️⃣ Understanding Branches

## What is a branch in Git?
A branch is a separate version of your project.  
It allows you to work on new features or bug fixes without affecting the main branch.

## Why do we use branches instead of committing everything to master?
We use branches to keep the master branch safe and stable.  
New features are developed and tested in separate branches before merging.

## What is HEAD in Git?
HEAD is a pointer that shows which branch and commit you are currently working on.

## What happens when you switch branches?
When you switch branches, Git updates your files to match the selected branch version.

---

# 2️⃣ git switch vs git checkout

## git switch
- Used only for switching branches.
- Simple and safer.

Example:
```bash
git switch feature-1
```

## git checkout
- Older command.
- Used for switching branches and restoring files.
- Can be confusing because it does multiple things.

Example:
```bash
git checkout feature-1
```

---

# 3️⃣ Creating a Feature Branch & Commit

## Create and switch to feature-1
```bash
git switch -c feature-1
```

## Make changes and commit
```bash
git add .
git commit -m "Added new changes in feature-1"
```

Switch back to master:
```bash
git switch master
```

The new commit will not exist in master unless merged.

---

# 4️⃣ Push to GitHub

## Step 1: Create repository on GitHub
- Create new repo
- Do NOT initialize with README

## Step 2: Connect local repo
```bash
git remote add origin https://github.com/your-username/devops-git-practice.git
```

Check connection:
```bash
git remote -v
```

## Step 3: Push master branch
```bash
git push -u origin master
```

## Step 4: Push feature-1 branch
```bash
git push -u origin feature-1
```

Verify both branches on GitHub.

---

# 5️⃣ origin vs upstream

## origin
- Your GitHub repository.
- Default remote name.
- Used to push and pull your changes.

## upstream
- Original repository (if you forked).
- Used to pull latest updates from original project.

Simple:
origin = your repo  
upstream = original repo  

---

# 6️⃣ Pull from GitHub

## Make change directly on GitHub
- Edit file on GitHub
- Commit changes

## Pull changes to local
```bash
git pull origin master
```

---

# 7️⃣ git fetch vs git pull

## git fetch
- Downloads changes from remote.
- Does NOT merge automatically.

## git pull
- Downloads AND merges automatically.
- git pull = git fetch + git merge

---

# 8️⃣ Clone vs Fork

## Clone
- Copies repository to your local machine.
- Command used: git clone
- Used when you have direct access.

## Fork
- Creates a copy of someone else's repo in your GitHub account.
- Used for contributing to open-source projects.

---

# 9️⃣ When to Use Clone vs Fork

Use clone:
- When working on your own project.
- When you have write access.

Use fork:
- When contributing to someone else's project.
- When you don't have write access.

---

# 🔟 Keeping Fork in Sync

Add upstream:
```bash
git remote add upstream https://github.com/original-owner/repo.git
```

Fetch updates:
```bash
git fetch upstream
```

Merge updates:
```bash
git merge upstream/master
```

This keeps your fork updated with the original repository.

---

#  Summary

Today I learned:
- Branch creation and switching
- Difference between switch and checkout
- Pushing branches to GitHub
- Difference between origin and upstream
- Pulling changes from GitHub
- Difference between fetch and pull
- Clone vs Fork
- Syncing fork with original repo
