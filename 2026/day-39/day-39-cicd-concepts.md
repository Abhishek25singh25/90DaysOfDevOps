# Day 39 – CI/CD Concepts

## The Problem (Without CI/CD)

Imagine a team of **5 developers** working on the same project.
Each developer pushes code to the same repository and deployments are done **manually**.

### What can go wrong?

**1. Code Conflicts**

Two developers may change the same file. When the code is merged, one change may break the other.

**2. Bugs Reach Production**

Without automatic testing, bugs may go to production and affect users.

**3. Deployment Mistakes**

Manual deployment requires running commands by hand. Someone may forget a step or run the wrong command.

Example deployment steps:

```
git pull
npm install
npm run build
docker build .
docker run
```

If a step is missed, the application may break.

**4. Version Confusion**

The team may not know which version of the application is running in production.

---

### What does “It works on my machine” mean?

This means the code works correctly on the developer's computer but fails on another machine or server.

Reasons may include:

* different Node or Python versions
* missing dependencies
* different operating system
* missing environment variables

CI/CD solves this problem by running the same automated process in a consistent environment.

---

### How many times can a team safely deploy manually?

Manual deployment is slow and risky.

Most teams deploy:

**1–2 times per day**

With CI/CD pipelines, teams can deploy **many times per day automatically**.

---

# CI vs CD vs Continuous Deployment

## Continuous Integration (CI)

Continuous Integration means developers frequently push code to a shared repository and automated tools **build and test the code automatically**.

Typical CI tasks:

* install dependencies
* build the project
* run tests
* check code quality

Example commands:

```
npm install
npm run build
npm test
```

CI helps detect errors early.

---

## Continuous Delivery

Continuous Delivery means the application is **always ready to be deployed** after CI passes.

The system:

* builds the application
* runs tests
* prepares a deployable package

But deployment to production still requires **manual approval**.

Pipeline flow:

```
Push Code
   ↓
Build
   ↓
Test
   ↓
Ready for Deployment
```

---

## Continuous Deployment

Continuous Deployment means every change that passes tests is **automatically deployed to production**.

No manual approval is required.

Pipeline flow:

```
Push Code
   ↓
Build
   ↓
Test
   ↓
Deploy Automatically
```

---

# Pipeline Anatomy

A CI/CD pipeline has several important components.

## Trigger

A trigger is an event that **starts the pipeline**.

Examples:

* push
* pull request
* schedule
* manual trigger

Example:

```
git push
```

---

## Stage

A stage is a **major phase in the pipeline**.

Common stages:

```
Build
Test
Deploy
```

---

## Job

A job is a **group of tasks executed in a stage**.

Example:

```
Run tests
```

---

## Step

A step is a **single command inside a job**.

Examples:

```
npm install
npm test
docker build .
```

---

## Runner

A runner is the **machine that executes the pipeline jobs**.

Example:

```
Ubuntu runner
```

GitHub provides hosted runners or you can use your own server.

---

## Artifact

An artifact is a **file produced during the pipeline**.

Examples:

* compiled application
* build files
* Docker images

Artifacts are often used in later pipeline stages.

---

# CI/CD Pipeline Diagram

Example scenario:
A developer pushes code to GitHub. The application is tested, built into a Docker image, and deployed to a staging server.

```
Developer
   |
   v
Push Code to GitHub
   |
   v
Pipeline Triggered
   |
   v
---------------------
Stage 1: Test
---------------------
Install Dependencies
Run Tests
   |
   v
---------------------
Stage 2: Build
---------------------
Build Docker Image
Push Image to Registry
   |
   v
---------------------
Stage 3: Deploy
---------------------
Deploy to Staging Server
Restart Container
   |
   v
Application Running
```

---

# Exploring an Open Source Repository

Repository explored:

React

```
https://github.com/facebook/react
```

Workflow file explored:

```
.github/workflows/compiler_discord_notify.yml
```

---

## What triggers the workflow?

This workflow runs when a **pull request is opened or marked ready for review**.

Example trigger:

```
pull_request_target:
  types: [opened, ready_for_review]
```

It only runs when changes are made in:

```
compiler/**
.github/workflows/compiler_**.yml
```

---

## How many jobs does it have?

This workflow has **three jobs**:

```
check_access
check_maintainer
notify
```

---

## What does the workflow do?

This workflow sends a **Discord notification** when a compiler-related pull request is opened.

Steps:

1. Check if the pull request author is a member or collaborator.
2. Verify if the person is part of the React core team.
3. If verified, send a message to a Discord channel with pull request details.

The message includes:

* PR title
* PR author
* number of changes
* PR link

This helps the team **stay updated about important pull requests automatically**.

---

# Folder Structure

```
2026/
  day-39/
    day-39-cicd-concepts.md
```

---

# Git Commands

```
git add .
git commit -m "Day 39 CI/CD Concepts"
git push
```

---
