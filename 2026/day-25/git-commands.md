# Git Commands Reference (Days 22–25)

This file contains all important Git commands I practiced from Day 22 to Day 25.
It is written for quick revision and practical use.

------------------------------------------------------------

## 1. Setup & Configuration

Initialize repository:
git init

Clone repository:
git clone <repo-url>

Set username:
git config --global user.name "Your Name"

Set email:
git config --global user.email "your@email.com"

Check config:
git config --list


------------------------------------------------------------

## 2. Basic Workflow

Check status:
git status

Add single file:
git add filename

Add all files:
git add .

Commit changes:
git commit -m "commit message"

View commit history:
git log

Short log:
git log --oneline

See unstaged changes:
git diff

See staged changes:
git diff --staged


------------------------------------------------------------

## 3. Branching

Create branch:
git branch branch-name

Switch branch:
git checkout branch-name
or
git switch branch-name

Create and switch:
git checkout -b branch-name
or
git switch -c branch-name

List branches:
git branch

Delete branch:
git branch -d branch-name


------------------------------------------------------------

## 4. Remote Commands

Add remote:
git remote add origin <repo-url>

Check remote:
git remote -v

Push:
git push origin branch-name

First time push:
git push -u origin branch-name

Pull:
git pull origin branch-name

Fetch:
git fetch

Clone:
git clone <repo-url>

Fork:
Fork is done from GitHub UI, then clone your fork.


------------------------------------------------------------

## 5. Merging & Rebasing

Merge branch:
git merge branch-name

Rebase:
git rebase branch-name

Continue rebase:
git rebase --continue

Abort rebase:
git rebase --abort


------------------------------------------------------------

## 6. Stash & Cherry Pick

Stash changes:
git stash

List stash:
git stash list

Apply stash:
git stash apply

Drop stash:
git stash drop

Cherry-pick specific commit:
git cherry-pick <commit-hash>


------------------------------------------------------------

## 7. Reset & Revert

Soft reset (undo commit, keep staged changes):
git reset --soft HEAD~1

Mixed reset (undo commit, unstage changes):
git reset --mixed HEAD~1

Hard reset (undo commit and delete changes):
git reset --hard HEAD~1

Revert last commit:
git revert HEAD

Revert specific commit:
git revert <commit-hash>

Continue revert:
git revert --continue

Abort revert:
git revert --abort


------------------------------------------------------------

Quick Reminder:

- Use reset for local cleanup.
- Use revert for pushed commits.
- Avoid --hard unless you are sure.
- Always check git status before committing.

------------------------------------------------------------

End of Notes.
