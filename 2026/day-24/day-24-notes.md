# Day 24 – Advanced Git: Merge, Rebase, Stash & Cherry Pick

---

# Task 1: Git Merge

## Observations

### What is a Fast-Forward Merge?

A fast-forward merge happens when the main branch has no new commits. Git simply moves the branch pointer forward. No merge commit is created.

### When does Git create a Merge Commit?

Git creates a merge commit when both branches have new commits and history has diverged.

### What is a Merge Conflict?

A merge conflict happens when the same line in the same file is changed in two branches. Git cannot decide which change to keep, so you must fix it manually.

---

# Task 2: Git Rebase

## Observations

After rebase, history becomes a straight line.
After merge, history looks like a tree.

### What does rebase do?

Rebase moves your commits on top of another branch. It rewrites commit history and creates new commit IDs.

### How is history different from merge?

Merge keeps branch history and creates a merge commit.
Rebase makes history clean and linear.

### Why should you never rebase shared commits?

Because rebase changes commit history. If others already pulled the commits, it can cause conflicts and confusion.

### When to use rebase vs merge?

Use rebase for local branches to keep history clean.
Use merge for shared branches and team projects.

---

# Task 3: Squash vs Regular Merge

## Observations

When using --squash, all commits are combined into one commit.
In regular merge, all commits are kept and a merge commit is created.

### What does squash merging do?

It combines multiple commits into one single commit before merging.

### When to use squash vs regular merge?

Use squash to keep history clean.
Use regular merge when commit details are important.

### Trade-off of squashing

You lose detailed commit history.

---

# Task 4: Git Stash

## Observations

Git does not allow branch switching if changes may be overwritten.
Using git stash saves temporary work.

### Difference between git stash pop and git stash apply

* git stash pop → applies stash and removes it from list.
* git stash apply → applies stash but keeps it in the list.

### When to use stash?

Use stash when you need to switch branches quickly without committing unfinished work.

---

# Task 5: Cherry Pick

## Observations

Cherry-pick applied only one selected commit to main.

### What does cherry-pick do?

It copies one specific commit from another branch and applies it to the current branch.

### When to use cherry-pick?

When you need one small fix or feature from another branch.

### What can go wrong?

It can cause conflicts, create duplicate commits, and make history confusing if overused.

---

# Summary

* Merge preserves full history.
* Rebase rewrites history for a cleaner look.
* Squash combines many commits into one.
* Stash temporarily saves unfinished work.
* Cherry-pick copies a specific commit.

#90DaysOfDevOps
#DevOpsKaJosh
#TrainWithShubham

