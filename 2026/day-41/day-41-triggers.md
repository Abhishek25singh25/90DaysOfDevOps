# Day 41 – Triggers & Matrix Builds

## Introduction

In GitHub Actions, **workflow triggers** define when a workflow should start automatically.
Triggers allow workflows to run on events like code pushes, pull requests, schedules, or manual execution.

Another powerful feature of GitHub Actions is the **Matrix Strategy**, which allows the same job to run across multiple environments such as different operating systems or programming language versions.

This helps teams ensure that applications work correctly across multiple platforms.

---

# Task 1 – Pull Request Trigger

## Workflow File

Location:

```
.github/workflows/pr-check.yml
```

```yaml
name: PR Check Workflow

on:
  pull_request:
    branches:
      - main
    types: [opened, synchronize]

jobs:
  pr-check:
    runs-on: ubuntu-latest

    steps:
      - name: Print PR Branch Name
        run: echo "PR check running for branch: ${{ github.head_ref }}"
```

## Explanation

* `pull_request` → Workflow runs when a PR event occurs.
* `branches: main` → Only PRs targeting the main branch trigger the workflow.
* `types`

  * `opened` → when PR is created
  * `synchronize` → when new commits are pushed to the PR

The workflow prints the branch name from which the pull request was created.

## Verification

Steps to test:

1. Create a new branch.
2. Push a commit.
3. Open a Pull Request to `main`.
4. Go to **Pull Request → Checks tab**.

You should see the workflow running automatically.

---

# Task 2 – Scheduled Trigger

## Cron Workflow Example

```yaml
name: Scheduled Workflow

on:
  schedule:
    - cron: '0 0 * * *'

jobs:
  scheduled-job:
    runs-on: ubuntu-latest

    steps:
      - name: Print Message
        run: echo "This workflow runs every day at midnight UTC"
```

## Cron Expression Explanation

```
0 0 * * *
│ │ │ │ │
│ │ │ │ └ Day of week
│ │ │ └── Month
│ │ └──── Day of month
│ └────── Hour
└──────── Minute
```

This expression runs the workflow **every day at 00:00 UTC**.

## Question Answer

Cron expression for **Every Monday at 9 AM UTC**

```
0 9 * * 1
```

Explanation:

* `0` → minute
* `9` → hour
* `*` → every day of month
* `*` → every month
* `1` → Monday

---

# Task 3 – Manual Trigger

## Workflow File

```
.github/workflows/manual.yml
```

```yaml
name: Manual Workflow

on:
  workflow_dispatch:
    inputs:
      environment:
        description: "Enter environment (staging or production)"
        required: true
        default: "staging"

jobs:
  manual-job:
    runs-on: ubuntu-latest

    steps:
      - name: Print Environment
        run: echo "Deployment environment is ${{ github.event.inputs.environment }}"
```

## Explanation

`workflow_dispatch` allows users to **run workflows manually** from the GitHub Actions tab.

This workflow includes an **input parameter** called `environment`.

Possible values:

* staging
* production

## Verification

Steps:

1. Go to **GitHub Repository**
2. Click **Actions**
3. Select **Manual Workflow**
4. Click **Run Workflow**
5. Enter environment name
6. Check logs for printed value

---

# Task 4 – Matrix Builds

## Workflow File

```
.github/workflows/matrix.yml
```

```yaml
name: Matrix Build Example

on:
  push:

jobs:
  matrix-job:
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        os: [ubuntu-latest]
        python-version: ["3.10", "3.11", "3.12"]

    steps:
      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: ${{ matrix.python-version }}

      - name: Print Python Version
        run: python --version
```

## Result

This workflow runs **3 parallel jobs**:

* Python 3.10
* Python 3.11
* Python 3.12

---

## Extended Matrix

```yaml
matrix:
  os: [ubuntu-latest, windows-latest]
  python-version: ["3.10", "3.11", "3.12"]
```

Total jobs:

```
2 OS × 3 Python versions = 6 jobs
```

All jobs run **in parallel**.

---

# Task 5 – Exclude & Fail-Fast

## Updated Matrix Workflow

```yaml
strategy:
  fail-fast: false

  matrix:
    os: [ubuntu-latest, windows-latest]
    python-version: ["3.10", "3.11", "3.12"]

    exclude:
      - os: windows-latest
        python-version: "3.10"
```

## Explanation

### Exclude

The following combination will **not run**:

```
windows-latest + python 3.10
```

This reduces unnecessary builds.

---

## Fail-Fast Behavior

### fail-fast: true (default)

* If **one job fails**
* All remaining jobs **stop immediately**

This saves CI resources.

### fail-fast: false

* Even if **one job fails**
* Other jobs **continue running**

Useful for debugging multiple environments.

---

# Screenshots

Add screenshots of:

1. Pull Request workflow run
2. Manual workflow execution
3. Matrix jobs running in parallel
4. Excluded job behavior

---

# Key Learnings

Today we learned:

* Different ways to trigger GitHub Actions workflows
* Pull request based automation
* Scheduled automation using cron
* Manual workflow execution
* Matrix builds for multi-environment testing
* Excluding specific build combinations
* Understanding fail-fast behavior

These features are essential for building **efficient CI/CD pipelines in DevOps workflows.**

---

# Hashtags

```
#90DaysOfDevOps
#DevOpsKaJosh
#GitHubActions
#TrainWithShubham
```
