# Day 49 – DevSecOps with GitHub Actions

---

# Introduction

In this task, I integrated security into my CI/CD pipeline.
The goal was to ensure that code, dependencies, and Docker images are secure before deployment.

---

# Task 1 – Docker Image Vulnerability Scan

## What I Did

* Integrated Trivy in the Docker workflow
* Scanned Docker images for vulnerabilities
* Configured pipeline to fail on HIGH and CRITICAL issues

## Code

```yaml
- name: Scan Docker Image
  uses: aquasecurity/trivy-action@master
  with:
    image-ref: ${{ inputs.image_name }}:${{ inputs.tag }}
    severity: CRITICAL,HIGH
    exit-code: '1'
```

## Learning

* Docker images can contain vulnerabilities
* Scanning before deployment is important

---

# Task 2 – Secret Scanning

## What I Did

* Checked GitHub settings for Secret Scanning
* Feature was not available in my repo
* Understood how it works

## Difference

* Secret Scanning → detects after push
* Push Protection → blocks before push

## If AWS Key is leaked

* GitHub raises alert
* Key must be revoked
* New key should be generated
* Remove key from code

---

# Task 3 – Dependency Vulnerability Scan

## What I Did

* Added dependency scan in PR pipeline
* Used dependency-review-action

## Code

```yaml
- name: Check Dependencies for Vulnerabilities
  uses: actions/dependency-review-action@v4
  with:
    fail-on-severity: critical
```

## Verification

* Created new branch
* Added dependency
* Opened PR
* Verified scan runs successfully

---

# Task 4 – Workflow Permissions

## Code

### PR Pipeline

```yaml
permissions:
  contents: read
  pull-requests: write
```

### Main Pipeline

```yaml
permissions:
  contents: read
```

## Explanation (Easy)

* Give only required permissions
* Prevent misuse of workflows

## Risk if not limited

* Malicious code injection
* Secret leakage
* Repository damage

---

# Task 5 – DevSecOps Pipeline

## PR Pipeline

PR Opened
→ Build & Test
→ Dependency Scan
→ PR Pass / Fail

## Main Pipeline

Merge to Main
→ Build & Test
→ Docker Build
→ Trivy Scan
→ Docker Push (only if safe)
→ Deploy

## Always Active

* Secret Scanning
* Push Protection

---

# Brownie Points

## 1. Pin Actions to Commit SHA

```yaml
uses: actions/checkout@b4ffde65f46336ab88eb53be808477a3936bae11
```

## Why

* Prevents supply chain attacks
* Locks exact version

---

## 2. Upload SARIF Results

```yaml
- name: Scan Docker Image
  uses: aquasecurity/trivy-action@master
  with:
    image-ref: ${{ inputs.image_name }}:${{ inputs.tag }}
    format: sarif
    output: trivy-results.sarif

- name: Upload scan results
  uses: github/codeql-action/upload-sarif@v4
  with:
    sarif_file: trivy-results.sarif
```

## Permission Required

```yaml
permissions:
  contents: read
  security-events: write
```

## Learning

* Results visible in GitHub Security tab
* Improves visibility of vulnerabilities

---

## 3. OIDC (Concept)

* No need to store secrets
* Uses temporary tokens
* More secure authentication

---

# Final Learning

* Security should be part of CI/CD
* Vulnerabilities must be detected early
* Only secure code should be deployed

This task helped me understand real DevSecOps practices.

---
