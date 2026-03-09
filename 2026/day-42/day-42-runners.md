# Day 42 – Runners: GitHub-Hosted & Self-Hosted

## Overview

In GitHub Actions, every workflow job runs on a **runner**.
A runner is a machine (virtual or physical) that executes the steps defined in a workflow.

There are two types of runners:

* **GitHub-hosted runners** – provided and managed by GitHub.
* **Self-hosted runners** – machines managed by the user (local machine or cloud VM).

---

# Task 1 – GitHub-Hosted Runners

I created a workflow that runs **three jobs on different operating systems**.

Operating systems used:

* `ubuntu-latest`
* `windows-latest`
* `macos-latest`

Each job prints:

* OS name
* Runner hostname
* Current user running the job

These jobs run **in parallel** on GitHub’s hosted infrastructure.

### What is a GitHub-hosted runner?

A **GitHub-hosted runner** is a virtual machine provided by GitHub that executes workflow jobs.

### Who manages it?

GitHub manages the runner infrastructure, operating system, updates, and pre-installed tools.

---

# Task 2 – Explore What's Pre-installed

On the **ubuntu-latest** runner, I checked the versions of commonly used tools.

Tools checked:

* Docker
* Python
* Node
* Git

Example commands used:

docker --version
python --version
node --version
git --version

### Why does it matter that runners come with tools pre-installed?

Runners with pre-installed tools save setup time in CI/CD pipelines.
Developers do not need to install common tools like Docker, Python, Node, or Git manually in every workflow.
This makes workflows faster, easier to configure, and reduces build time.

---

# Task 3 – Set Up a Self-Hosted Runner

I configured a **self-hosted runner** for my GitHub repository.

Steps performed:

1. Opened **Repository → Settings → Actions → Runners**
2. Selected **New self-hosted runner**
3. Chose **Linux** as the operating system
4. Downloaded and configured the runner on my machine
5. Started the runner using:

./run.sh

After starting, the runner appeared in GitHub with **Idle (green dot)** status.

---

# Task 4 – Use the Self-Hosted Runner

I created a workflow that runs jobs on my own machine.

Workflow file:

.github/workflows/self-hosted.yml

The workflow performs these steps:

* Prints the hostname of my machine
* Prints the working directory
* Creates a file during the workflow execution

This confirmed that the workflow was executed on my **local system instead of GitHub’s servers**.

After the workflow ran, the file created by the job appeared on my machine.

---

# Task 5 – Labels

I added a label to the self-hosted runner:

my-linux-runner

Then I updated the workflow to use:

runs-on: [self-hosted, my-linux-runner]

This ensures the job runs only on a **specific runner with that label**.

### Why are labels useful?

Labels help target specific self-hosted runners when multiple runners are available.
This allows workflows to run on machines with specific environments or capabilities.

---

# Task 6 – GitHub-Hosted vs Self-Hosted Runners

| Feature             | GitHub-Hosted Runner         | Self-Hosted Runner                             |
| ------------------- | ---------------------------- | ---------------------------------------------- |
| Who manages it?     | GitHub                       | User / organization                            |
| Cost                | Free (limited usage)         | Infrastructure cost (server/VM)                |
| Pre-installed tools | Many tools already installed | Must install manually                          |
| Good for            | Simple CI pipelines          | Custom environments and infrastructure control |
| Security concern    | Managed by GitHub            | Must secure and maintain yourself              |

---

# Conclusion

Today I learned how GitHub Actions workflows run on **runners**.
GitHub-hosted runners are quick and easy to use, while self-hosted runners provide more control and flexibility for advanced CI/CD pipelines.

This exercise helped me understand how real DevOps pipelines execute jobs on different machines and environments.
