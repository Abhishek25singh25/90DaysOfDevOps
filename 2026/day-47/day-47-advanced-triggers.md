# Day 47 – Advanced Triggers: PR Events, Cron Schedules & Event-Driven Pipelines

## 🚀 Overview
This project demonstrates advanced GitHub Actions triggers:
- Pull Request lifecycle events
- PR validation checks
- Scheduled workflows (cron)
- Path & branch filters
- Workflow chaining (workflow_run)
- External triggers (repository_dispatch)

## ✅ Task 1: Pull Request Lifecycle
### 📁 .github/workflows/pr-lifecycle.yml
```yaml
name: PR Lifecycle
on:
  pull_request:
    types: [opened, synchronize, reopened, closed]

jobs:
  pr-info:
    runs-on: ubuntu-latest
    steps:
      - name: Print PR details
        run: |
          echo "Event: ${{ github.event.action }}"
          echo "Title: ${{ github.event.pull_request.title }}"
          echo "Author: ${{ github.event.pull_request.user.login }}"
          echo "Source Branch: ${{ github.head_ref }}"
          echo "Target Branch: ${{ github.base_ref }}"

      - name: Run only when PR is merged
        if: github.event.pull_request.merged == true
        run: echo "PR was merged ✅"
```

## ✅ Task 2: PR Validation Workflow
### 📁 .github/workflows/pr-checks.yml
```yaml
name: PR Checks
on:
  pull_request:
    branches:
      - main

jobs:
  file-size-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Check file size
        run: |
          find . -type f -size +1M && echo "File too large ❌" && exit 1 || echo "All files OK ✅"

  branch-name-check:
    runs-on: ubuntu-latest
    steps:
      - name: Validate branch name
        run: |
          echo "Branch: ${{ github.head_ref }}"
          if [[ ! "${{ github.head_ref }}" =~ ^(feature|fix|docs)/ ]]; then
            echo "Invalid branch name ❌"
            exit 1
          fi
          echo "Branch name valid ✅"

  pr-body-check:
    runs-on: ubuntu-latest
    steps:
      - name: Check PR description
        run: |
          if [ -z "${{ github.event.pull_request.body }}" ]; then
            echo "Warning: PR description is empty ⚠️"
          else
            echo "PR description exists ✅"
          fi
```

## ✅ Task 3: Scheduled Workflows
### 📁 .github/workflows/scheduled-tasks.yml
```yaml
name: Scheduled Tasks
on:
  schedule:
    - cron: "30 2 * * 1"
    - cron: "0 */6 * * *"
  workflow_dispatch:

jobs:
  schedule-job:
    runs-on: ubuntu-latest
    steps:
      - name: Print schedule
        run: echo "Triggered by: ${{ github.event.schedule }}"

      - name: Health Check
        run: |
          status=$(curl -s -o /dev/null -w "%{http_code}" https://example.com)
          echo "Status: $status"
          if [ "$status" -ne 200 ]; then
            echo "Health check failed ❌"
            exit 1
          fi
```

## 📝 Cron Notes
- Every weekday at 9 AM IST → 30 3 * * 1-5
- First day of every month at midnight → 0 0 1 * *

Why schedules may be delayed or skipped:
- Shared system → queue delay  
- No exact timing guarantee  
- Inactive repos may skip schedules  

## ✅ Task 4: Path & Branch Filters
### 📁 .github/workflows/smart-triggers.yml
```yaml
name: Smart Triggers
on:
  push:
    branches:
      - main
      - release/*
    paths:
      - 'src/**'
      - 'app/**'

jobs:
  run-job:
    runs-on: ubuntu-latest
    steps:
      - run: echo "Code changed 🚀"
```

### 📁 .github/workflows/ignore-docs.yml
```yaml
name: Ignore Docs
on:
  push:
    branches:
      - main
    paths-ignore:
      - '*.md'
      - 'docs/**'

jobs:
  skip-docs:
    runs-on: ubuntu-latest
    steps:
      - run: echo "Not a docs-only change ✅"
```

Notes:
- paths → run only for specific files  
- paths-ignore → ignore specific files  

## ✅ Task 5: Workflow Chaining
### 📁 .github/workflows/tests.yml
```yaml
name: Run Tests
on:
  push:

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - run: echo "Running tests ✅"
```

### 📁 .github/workflows/deploy-after-tests.yml
```yaml
name: Deploy After Tests
on:
  workflow_run:
    workflows: ["Run Tests"]
    types: [completed]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Check result
        run: |
          if [ "${{ github.event.workflow_run.conclusion }}" != "success" ]; then
            echo "Tests failed ❌"
            exit 1
          fi
          echo "Deploying... 🚀"
```

workflow_run vs workflow_call:
- workflow_run → runs after another workflow finishes  
- workflow_call → reusable workflow  

## ✅ Task 6: External Trigger
### 📁 .github/workflows/external-trigger.yml
```yaml
name: External Trigger
on:
  repository_dispatch:
    types: [deploy-request]

jobs:
  external:
    runs-on: ubuntu-latest
    steps:
      - run: echo "Deploying to ${{ github.event.client_payload.environment }}"
```

Trigger command:
```bash
gh api repos/<owner>/<repo>/dispatches \
  -f event_type=deploy-request \
  -f client_payload='{"environment":"production"}'
```

## 📝 Notes (External Trigger)
An external system triggers a pipeline when something happens outside GitHub, like a Slack message or a monitoring alert, to automatically start tasks like testing or deployment.
