# Day 25 – Git Reset vs Revert & Branching Strategies

Today I learned how to safely undo mistakes in Git and understood different branching strategies used by real engineering teams.

------------------------------------------------------------

# Task 1: Git Reset – Hands-On

I created 3 commits: A → B → C

## 1. git reset --soft HEAD~1

Result:
- Commit C was removed.
- Changes from C stayed in staging area.
- Files were not deleted.

Meaning:
Only commit was undone, but code was still ready to commit again.

---

## 2. git reset --mixed HEAD~1

Result:
- Commit was removed.
- Changes stayed in working directory.
- Files were unstaged.

Meaning:
Commit undone + changes available but not staged.

(Default reset mode)

---

## 3. git reset --hard HEAD~1

Result:
- Commit removed.
- Staging cleared.
- Working directory changes deleted.

Meaning:
Everything was deleted permanently.

---

## Difference Between --soft, --mixed, --hard

| Option | Commit Removed | Staged Changes | Working Directory |
|---------|---------------|----------------|-------------------|
| --soft  | Yes           | Kept           | Kept              |
| --mixed | Yes           | Removed        | Kept              |
| --hard  | Yes           | Removed        | Deleted           |

---

## Which one is destructive?

`--hard` is destructive because it deletes working directory changes permanently.

---

## When to use each?

- --soft → Fix last commit message or combine commits
- --mixed → Undo commit but edit files again
- --hard → Completely discard changes (local only)

---

## Should you use reset on pushed commits?

No. Because it rewrites history and requires force push.
It can break other developers’ repositories.

------------------------------------------------------------

# Task 2: Git Revert – Hands-On

I created 3 commits: X → Y → Z

Then I reverted commit Y.

Result:
- Git created a new commit that reversed Y.
- Commit Y was still visible in history.
- No history was deleted.

---

## Difference Between Reset and Revert

- git reset removes commits from history.
- git revert creates a new commit that undoes changes.

---

## Why is revert safer?

- It does not rewrite history.
- No force push required.
- Safe for shared branches.
- Other developers are not affected.

---

## When to use revert vs reset?

- Use reset for local mistakes before pushing.
- Use revert for already pushed commits.

------------------------------------------------------------

# Task 3: Reset vs Revert Summary

|  | git reset | git revert |
|---|------------|------------|
| What it does | Moves HEAD backward | Creates new commit that reverses changes |
| Removes commit from history? | Yes | No |
| Safe for shared branches? | No | Yes |
| When to use | Local cleanup | After pushing / team projects |

------------------------------------------------------------

# Task 4: Branching Strategies

## 1. GitFlow

How it works:
Uses multiple branches:
- main (production)
- develop
- feature branches
- release branches
- hotfix branches

Flow:
main ← release ← develop ← feature

Used in:
- Large teams
- Scheduled releases

Pros:
- Well organized
- Stable production

Cons:
- Complex
- Slower workflow

---

## 2. GitHub Flow

How it works:
- Single main branch
- Feature branch → Pull Request → Merge

Flow:
main ← feature branch

Used in:
- Startups
- Continuous deployment

Pros:
- Simple
- Fast

Cons:
- Needs strong testing

---

## 3. Trunk-Based Development

How it works:
- Everyone commits to main
- Short-lived branches
- Frequent merges

Flow:
main → small branches → merge quickly

Used in:
- Big tech companies
- CI/CD heavy environments

Pros:
- Fast integration
- Fewer merge conflicts

Cons:
- Requires discipline
- Strong automation needed

---

## Answers

Startup shipping fast:
GitHub Flow.

Large team with scheduled releases:
GitFlow.

Popular open-source projects:
Most use GitHub Flow or Trunk-Based Development.

------------------------------------------------------------

# What I Learned Today

- git reset rewrites history.
- git revert preserves history.
- Never use --hard carelessly.
- reflog is a safety net.
- Branching strategy depends on team size and release model.

------------------------------------------------------------

End of Day 25 Notes.
