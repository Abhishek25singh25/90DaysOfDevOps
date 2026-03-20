# Day 48 – GitHub Actions Capstone (End-to-End CI/CD)

---

# 🎯 Objective

Build a complete CI/CD pipeline using GitHub Actions that:

* Builds and tests the application
* Creates and pushes Docker images
* Simulates deployment
* Performs scheduled health checks

---

# 🧩 Task 1: Project Setup

## 📌 Application

We created a **portfolio-based Flask application** that serves a frontend UI and exposes a health endpoint.

---

## 📁 Code

### app.py

```python
from flask import Flask, send_from_directory

app = Flask(__name__)

@app.route("/")
def home():
    return send_from_directory(".", "index.html")

@app.route("/health")
def health():
    return {"status": "ok"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
```

---

### index.html

```html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Abhishek | Portfolio</title>

<style>
* { margin:0; padding:0; box-sizing:border-box; font-family:'Segoe UI'; }
body { background:linear-gradient(135deg,#0f172a,#020617); color:white; }

nav { display:flex; justify-content:space-between; padding:20px 50px; }
nav h2 { color:#22c55e; }

.hero { text-align:center; padding:100px 20px; }
.hero span { color:#22c55e; }

section { padding:60px 50px; }

.card { background:#1e293b; padding:20px; border-radius:10px; }

footer { text-align:center; padding:20px; }

button { background:#22c55e; border:none; padding:10px 20px; color:white; }
</style>
</head>

<body>

<nav>
  <h2>Abhishek</h2>
</nav>

<div class="hero">
  <h1>Hi, I'm <span>Abhishek</span> 👋</h1>
  <p>DevOps | Java | Python | CI/CD Enthusiast</p>
</div>

<section>
  <h2>Projects</h2>
  <div class="card">CI/CD Pipeline using GitHub Actions</div>
</section>

<footer>
  <p>© 2026 Abhishek</p>
</footer>

</body>
</html>
```

---

### requirements.txt

```
flask
```

---

### test.sh

```bash
#!/bin/bash
if [ -f "app.py" ]; then
  echo "App exists"
else
  exit 1
fi
```

---

### Dockerfile

```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python", "app.py"]
```

---

## 🧠 Explanation

* Flask serves the portfolio website
* `/health` endpoint is used for monitoring
* Dockerfile containerizes the application

---

# 🔁 Task 2: Reusable Build & Test

## 📌 Purpose

To install dependencies and run tests in a reusable workflow.

## 📁 Code

```yaml
name: Build and Test

on:
  workflow_call:
    inputs:
      python_version:
        type: string
      run_tests:
        type: boolean
    outputs:
      test_result:
        value: ${{ jobs.build.outputs.result }}

jobs:
  build:
    runs-on: ubuntu-latest

    outputs:
      result: ${{ steps.set.outputs.value }}

    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: ${{ inputs.python_version }}

      - run: pip install -r requirements.txt
      - id: test
        run: bash test.sh || true

      - id: set
        run: |
          if [ "${{ steps.test.outcome }}" = "success" ]; then
            echo "value=passed" >> $GITHUB_OUTPUT
          else
            echo "value=failed" >> $GITHUB_OUTPUT
          fi
```

---

# 🐳 Task 3: Docker Build & Push

## 📁 Code

```yaml
name: Docker Build and Push

on:
  workflow_call:
    inputs:
      image_name:
        type: string
      tag:
        type: string
    secrets:
      docker_username:
        required: true
      docker_token:
        required: true

jobs:
  docker:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - uses: docker/login-action@v3
        with:
          username: ${{ secrets.docker_username }}
          password: ${{ secrets.docker_token }}

      - uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: ${{ secrets.docker_username }}/${{ inputs.image_name }}:${{ inputs.tag }}
```

---

# 🔍 Task 4: PR Pipeline

```yaml
name: PR Checks

on:
  pull_request:
    branches: [main]

jobs:
  test:
    uses: ./.github/workflows/reusable-build-test.yml
    with:
      python_version: "3.11"
      run_tests: true
```

👉 Only tests run (no Docker)

---

# 🚀 Task 5: Main Pipeline

```yaml
name: Main Pipeline

on:
  push:
    branches: [main]

jobs:
  test:
    uses: ./.github/workflows/reusable-build-test.yml
    with:
      python_version: "3.11"
      run_tests: true

  docker:
    needs: test
    if: needs.test.outputs.test_result == 'passed'
    uses: ./.github/workflows/reusable-docker-build-push.yml
    with:
      image_name: "my-app"
      tag: "latest"
    secrets: inherit

  deploy:
    needs: docker
    runs-on: ubuntu-latest

    steps:
      - run: echo "Deploying image..."
```

---

# ⏰ Task 6: Health Check

```yaml
name: Health Check

on:
  schedule:
    - cron: '0 */12 * * *'

jobs:
  check:
    runs-on: ubuntu-latest

    steps:
      - run: docker run -d -p 5000:5000 my-app:latest
      - run: sleep 5
      - run: curl http://localhost:5000/health
```

---

# 🧠 Task 7: Pipeline Architecture

```
PR → Build & Test

Main → Test → Docker → Deploy

Schedule → Health Check
```

---

# 📌 Conclusion

This project demonstrates a real-world CI/CD pipeline using GitHub Actions with Docker and monitoring.

---

# #90DaysOfDevOps

# #DevOpsKaJosh

# #TrainWithShubham
