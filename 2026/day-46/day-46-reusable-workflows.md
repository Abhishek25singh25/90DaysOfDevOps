# Day 46 – Reusable Workflows & Composite Actions

## Overview

Today I learned how to make GitHub Actions pipelines **modular and reusable** using:

* **Reusable Workflows (`workflow_call`)**
* **Composite Actions**

In real-world DevOps pipelines, teams avoid repeating the same CI/CD logic across multiple workflows. Instead, they create reusable workflows and custom actions that can be called like functions.

---

# Task 1 – Understanding `workflow_call`

### What is a reusable workflow?

A reusable workflow is a GitHub Actions workflow that can be **called by another workflow**.
It allows developers to reuse complete pipeline logic across multiple workflows or repositories.

---

### What is the `workflow_call` trigger?

`workflow_call` is a special trigger that allows a workflow to be **invoked by another workflow**.

Example:

```yaml
on:
  workflow_call
```

This means the workflow will **not run independently** and must be called by another workflow.

---

### How is calling a reusable workflow different from using a regular action?

| Type              | Description                                        |
| ----------------- | -------------------------------------------------- |
| Reusable Workflow | Reuses an entire workflow including jobs and steps |
| Regular Action    | Reuses a single step or action inside a job        |

Reusable workflows operate at the **workflow level**, while actions operate at the **step level**.

---

### Where must a reusable workflow file live?

Reusable workflows must be placed inside:

```
.github/workflows/
```

Only workflows stored in this directory can be called using `workflow_call`.

---

# Task 2 – Creating a Reusable Workflow

File created:

```
.github/workflows/reusable-build.yml
```

This workflow:

* Accepts **inputs**
* Accepts **secrets**
* Runs a job that prints build information

### Reusable Workflow YAML

```yaml
name: Reusable Build

on:
  workflow_call:
    inputs:
      app_name:
        description: "Application name"
        required: true
        type: string
      environment:
        description: "Deployment environment"
        required: true
        type: string
        default: staging
    secrets:
      docker_token:
        required: true

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Print build message
        run: echo "Building ${{ inputs.app_name }} for ${{ inputs.environment }}"

      - name: Verify docker token
        run: |
          if [ -n "${{ secrets.docker_token }}" ]; then
            echo "Docker token is set: true"
          else
            echo "Docker token is set: false"
          fi
```

Note: This workflow **will not run by itself** because it requires a caller workflow.

---

# Task 3 – Creating a Caller Workflow

File created:

```
.github/workflows/call-build.yml
```

This workflow triggers on push and calls the reusable workflow.

### Caller Workflow YAML

```yaml
name: Call Reusable Build Workflow

on:
  push:
    branches:
      - main

jobs:
  build:
    uses: ./.github/workflows/reusable-build.yml
    with:
      app_name: "my-web-app"
      environment: "production"
    secrets:
      docker_token: ${{ secrets.DOCKER_TOKEN }}
```

### Workflow Flow

```
Push to main
      ↓
Caller Workflow Triggered
      ↓
Reusable Workflow Executed
      ↓
Build Information Printed
```

---

# Task 4 – Adding Outputs to the Reusable Workflow

The reusable workflow was extended to generate a build version.

Example version format:

```
v1.0-<short-sha>
```

The version was exposed as an output so the caller workflow could access it.

Example usage in caller workflow:

```
${{ needs.build.outputs.build_version }}
```

A second job prints the generated version.

Example output:

```
Build version is v1.0-a1b2c3d
```

---

# Task 5 – Creating a Composite Action

A custom composite action was created at:

```
.github/actions/setup-and-greet/action.yml
```

Composite actions allow grouping multiple steps into a reusable action.

### Composite Action YAML

```yaml
name: setup and greet
description: A simple greeting action

inputs:
  name:
    description: "Name of the user"
    required: true
  language:
    description: "Language for greeting"
    required: false
    default: "en"

outputs:
  greeted:
    description: "Greeting completed"
    value: true

runs:
  using: "composite"
  steps:
    - name: Print greeting
      shell: bash
      run: |
        if [ "${{ inputs.language }}" == "en" ]; then
          echo "Hello ${{ inputs.name }}"
        elif [ "${{ inputs.language }}" == "hi" ]; then
          echo "Namaste ${{ inputs.name }}"
        else
          echo "Hola ${{ inputs.name }}"
        fi

    - name: Print system info
      shell: bash
      run: |
        echo "Current date: $(date)"
        echo "Runner OS: $RUNNER_OS"

    - name: Set output
      shell: bash
      run: echo "greeted=true" >> $GITHUB_OUTPUT
```

This action prints:

* Greeting message
* Current date
* Runner operating system

---

# Task 6 – Reusable Workflow vs Composite Action

| Feature                     | Reusable Workflow                | Composite Action                      |
| --------------------------- | -------------------------------- | ------------------------------------- |
| Triggered by                | `workflow_call`                  | `uses:` in a step                     |
| Can contain jobs            | Yes                              | No                                    |
| Can contain multiple steps  | Yes                              | Yes                                   |
| Lives where                 | `.github/workflows/`             | `.github/actions/`                    |
| Can accept secrets directly | Yes                              | No (must be passed as inputs)         |
| Best for                    | Reusing complete CI/CD pipelines | Reusing a group of steps inside a job |

---

# Key Learnings

Today’s tasks helped me understand:

* How to create **modular CI/CD pipelines**
* Reusing workflows using `workflow_call`
* Passing **inputs, secrets, and outputs** between workflows
* Creating **custom composite actions**
* Structuring scalable GitHub Actions pipelines

---

# Screenshot

(Add screenshot of the caller workflow triggering the reusable workflow here.)

---

# Conclusion

Reusable workflows and composite actions allow DevOps teams to **reduce duplication and build scalable automation pipelines**.

These concepts are widely used in production environments where CI/CD pipelines need to be modular and maintainable.
