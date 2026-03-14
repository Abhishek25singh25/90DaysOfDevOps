# Day 44 – Secrets, Artifacts & Running Real Tests in CI

## Introduction

On Day 44 of my DevOps learning journey, I explored how to make GitHub Actions pipelines more practical and production-like. Earlier workflows only executed simple commands, but today I learned how pipelines actually handle **sensitive data, store build outputs, run real scripts, and optimize performance using caching**.

The main concepts covered today were:

* GitHub **Secrets** for secure credential management
* **Artifacts** for storing pipeline outputs
* Passing artifacts **between multiple jobs**
* Running **real tests in CI pipelines**
* Using **Caching** to speed up workflows

These features are essential in real CI/CD systems because they improve **security, traceability, and efficiency**.

---

# Task 1 – GitHub Secrets

## What are GitHub Secrets?

GitHub Secrets are **encrypted environment variables** stored securely in a repository or organization. They are used to store sensitive information that should never be exposed in code.

Examples of sensitive information:

* API Keys
* Database passwords
* Docker credentials
* Cloud provider tokens
* Authentication tokens

Instead of writing these values directly in a workflow file, they are stored as secrets and accessed securely during pipeline execution.

---

## Steps I Performed

1. Opened my repository on GitHub.
2. Navigated to:

Repository → **Settings → Secrets and Variables → Actions**

3. Created a new secret named:

```
MY_SECRET_MESSAGE
```

4. Added any value to it and saved the secret.

5. Created a workflow that checks whether the secret exists.

Instead of printing the actual value, the workflow prints a message confirming whether the secret is set.

---

## What happens if you print a secret directly?

If we attempt to print a secret using:

```
${{ secrets.MY_SECRET_MESSAGE }}
```

GitHub automatically masks the output in logs.

Example output:

```
***
```

This masking mechanism prevents accidental credential leaks.

---

## Why should you never print secrets in CI logs?

Printing secrets in logs is dangerous because:

* CI logs may be visible to collaborators.
* Logs can remain stored for a long time.
* Attackers could extract credentials.
* It violates security best practices.

Therefore, secrets should only be used internally by scripts and tools.

---

# Task 2 – Using Secrets as Environment Variables

Secrets are commonly passed to workflow steps as **environment variables**. This allows tools or scripts to use them without exposing the values.

Example use cases include:

* Docker authentication
* Cloud deployment credentials
* API requests
* Database connections

---

## What I Did

I used the secret inside a workflow step by passing it as an **environment variable**.

This allows the script to access the value securely without hardcoding it in the workflow file.

---

## Additional Secrets Added

For future tasks I created two additional secrets:

```
DOCKER_USERNAME
DOCKER_TOKEN
```

These will be used when pushing container images to Docker Hub in later CI/CD pipelines.

Using secrets this way keeps workflows secure while allowing pipelines to interact with external services.

---

# Task 3 – Uploading Artifacts

## What are Artifacts?

Artifacts are files created during a workflow that are **stored by GitHub Actions after the job finishes**.

They allow us to:

* Save important outputs
* Download pipeline results
* Share files between workflow jobs

Artifacts are very useful when pipelines produce files that need to be examined later.

---

## What I Did

In this task:

1. A workflow step generated a file during pipeline execution.
2. The file was uploaded as an artifact.
3. After the workflow finished, I downloaded the artifact from the **Actions tab**.

---

## Examples of Artifacts in Real Pipelines

Artifacts commonly include:

* Build outputs (`.jar`, `.zip`, `.exe`)
* Test reports
* Coverage reports
* Security scan results
* Log files

Artifacts help maintain **traceability of pipeline results**.

---

# Task 4 – Downloading Artifacts Between Jobs

CI pipelines often contain **multiple jobs**, each performing different tasks such as build, test, security scan, or deployment.

Artifacts allow files created in one job to be **used in another job**.

---

## What I Did

The workflow contained two jobs.

### Job 1

* Created a file
* Uploaded it as an artifact

### Job 2

* Downloaded the artifact
* Printed its contents

This demonstrated how artifacts can move data between different pipeline stages.

---

## When are artifacts used in real pipelines?

Artifacts are used when:

* Passing **build outputs** to testing stages
* Storing **test reports**
* Saving **debugging logs**
* Sharing files between jobs
* Delivering **deployment packages**

Example real pipeline:

```
Build Stage
   ↓
Upload Artifact (compiled application)

Test Stage
   ↓
Download Artifact and run tests

Deploy Stage
   ↓
Deploy the same artifact
```

This ensures every stage uses the **same build output**.

---

# Task 5 – Running Real Tests in CI

One of the main goals of Continuous Integration is to **automatically test code whenever changes are made**.

Instead of only printing messages, pipelines should run actual scripts or tests.

---

## What I Did

1. Added a test script to the repository.
2. Created a workflow that:

   * Checks out the code
   * Runs the script
3. Observed the pipeline behavior.

---

## Observations

If the script returned:

```
exit 0
```

The pipeline **passed (green)**.

If the script returned:

```
exit 1
```

The pipeline **failed (red)**.

This mechanism helps detect problems automatically before code is merged or deployed.

---

## Importance of CI Testing

Running tests in CI ensures:

* Broken code is detected early
* Bugs are caught automatically
* Code quality improves
* Production deployments become safer

Typical CI pipeline flow:

```
Developer Pushes Code
        ↓
Build Application
        ↓
Run Tests
        ↓
If Tests Pass → Deploy
If Tests Fail → Stop Pipeline
```

---

# Task 6 – Caching

## What is Caching?

Caching is a technique used to **store frequently used files so that future workflow runs can reuse them instead of downloading them again**.

This significantly reduces pipeline execution time.

---

## What I Did

Added caching to the workflow so that dependencies or files could be reused across workflow runs.

---

## Observations

### First Workflow Run

* No cache available
* Dependencies downloaded normally
* Pipeline took longer

### Second Workflow Run

* Cache restored
* Installation step completed faster
* Pipeline executed more quickly

---

## What is being cached?

Items typically cached include:

* Package dependencies
* Libraries
* Build tools
* Downloaded resources

---

## Where is the cache stored?

GitHub stores caches in its **remote cache storage associated with the repository**.

Each cache is identified by a **cache key**, which determines whether an existing cache can be reused.

---

# Key Learnings

Today I learned several important CI/CD concepts:

* How to securely store credentials using **GitHub Secrets**
* How to use secrets safely without exposing them in logs
* How to save pipeline outputs using **Artifacts**
* How to share artifacts between jobs
* How CI pipelines run **real automated tests**
* How **Caching improves workflow performance**

These are essential features used in **modern DevOps pipelines**.

---

# Conclusion

Day 44 helped me understand how real CI pipelines operate beyond basic commands.

By integrating **secrets management, artifact storage, automated testing, and caching**, pipelines become more secure, reliable, and efficient.

These concepts form the foundation of professional CI/CD systems used in modern software development.

---

# Hashtags

#90DaysOfDevOps
#DevOps
#GitHubActions
#CI
#DevOpsLearning
#TrainWithShubham
