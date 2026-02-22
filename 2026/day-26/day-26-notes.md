# Day 26 – GitHub CLI (gh)

Today I learned how to use GitHub directly from the terminal using GitHub CLI (gh).  
This helps avoid switching to the browser and improves productivity.

------------------------------------------------------------

## Task 1: Install and Authenticate

I installed GitHub CLI and authenticated successfully.

Authentication methods supported by gh:

1. Browser-based authentication (OAuth)
2. Personal Access Token (PAT)
3. SSH authentication

Browser login is recommended for most users.
PAT is useful for automation and CI/CD.
SSH is common in developer environments.

------------------------------------------------------------

## Task 2: Working with Repositories

Using gh, I was able to:

- Create a new public repository from terminal
- Clone a repository
- View repository details
- List all my repositories
- Open repository in browser from terminal
- Delete a repository safely

Important commands used:

gh repo create  
gh repo clone  
gh repo list  
gh repo view  
gh repo delete  

------------------------------------------------------------

## Task 3: Issues

I created and managed issues directly from terminal.

Commands used:

gh issue create  
gh issue list  
gh issue view  
gh issue close  

How gh issue can be used in automation:

- Automatically create issues when CI fails
- Track bugs from scripts
- Auto-assign labels
- Close issues after deployment

------------------------------------------------------------

## Task 4: Pull Requests

I created a branch, pushed changes, and created a pull request entirely from the terminal.

Commands used:

gh pr create  
gh pr list  
gh pr view  
gh pr diff  
gh pr merge  
gh pr review  

Merge methods supported:

- merge
- squash
- rebase

To review someone else's PR:

- View PR details
- Check differences
- Approve or request changes
- Comment directly from terminal

------------------------------------------------------------

## Task 5: GitHub Actions Preview

Commands used:

gh run list  
gh run view  
gh workflow list  

How gh run and gh workflow help in CI/CD:

They allow monitoring workflow runs, checking build status, triggering workflows, and debugging failures directly from the terminal.  
Useful for automation and pipeline monitoring.

------------------------------------------------------------

## Task 6: Useful gh Commands

1. gh api  
Used to make direct GitHub API calls for automation and scripting.

2. gh alias  
Used to create shortcuts for frequently used commands.

3. gh search repos  
Used to search GitHub repositories from the terminal.

------------------------------------------------------------

## What I Learned Today

- GitHub CLI reduces browser dependency.
- It improves productivity.
- It is very useful for DevOps automation.
- Most GitHub tasks can be done directly from the terminal.

Day 26 completed.
