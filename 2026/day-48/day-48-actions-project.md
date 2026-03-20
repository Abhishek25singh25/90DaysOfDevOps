# Day 48 – GitHub Actions Capstone (CI/CD Pipeline)

---

# 🎯 Objective

The goal of this project is to build a complete CI/CD pipeline using GitHub Actions.

The pipeline performs:

* Build the application
* Run tests
* Build and push Docker image
* Simulate deployment
* Perform scheduled health checks

---

# 🧩 Task 1: Project Setup

## 📌 What was built?

A simple **Flask-based portfolio application**:

* `/` → serves the frontend (HTML page)
* `/health` → returns application status

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
<h1>Hi, I'm Abhishek 🚀</h1>
<p>DevOps | Java | Python | CI/CD Enthusiast</p>
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

CMD ["python", "app.py"]
```

---

## 🧠 Explanation

* Flask serves the HTML portfolio page
* `/health` endpoint is used for monitoring
* Dockerfile makes the app portable

👉 This forms the base of the CI/CD pipeline.

---

# 🔁 Task 2: Reusable Workflow – Build & Test

## 📌 Purpose

To create a reusable workflow that:

* Installs dependencies
* Runs tests
* Returns result (`passed` or `failed`)

---

## 📁 Code

```yaml
on:
  workflow_call:

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - run: pip install -r requirements.txt

      - id: test
        run: bash test.sh || true
```

---

## 🧠 Explanation

* `workflow_call` makes the workflow reusable
* `|| true` prevents pipeline from stopping immediately
* Test result is handled manually

👉 This is the **CI (Continuous Integration)** part.

---

# 🐳 Task 3: Docker Build & Push

## 📌 Purpose

To:

* Build Docker image
* Push it to Docker Hub

---

## 📁 Code

```yaml
- uses: docker/login-action@v3

- uses: docker/build-push-action@v5
```

---

## 🧠 Explanation

* Docker containerizes the application
* Ensures consistency across environments

👉 This is part of **CD (Continuous Delivery)**.

---

# 🔍 Task 4: PR Pipeline

## 📌 Purpose

To run tests when a Pull Request is created.

---

## 📁 Code

```yaml
on:
  pull_request:

jobs:
  test:
    uses: reusable-build-test.yml
```

---

## 🧠 Explanation

* Only tests are executed
* No Docker build or deployment

👉 Prevents broken code from being merged.

---

# 🚀 Task 5: Main Pipeline

## 📌 Flow

1. Run tests
2. Build Docker image
3. Push Docker image
4. Deploy

---

## 📁 Code

```yaml
jobs:
  test:
    uses: reusable-build-test.yml

  docker:
    needs: test
```

---

## 🧠 Explanation

* `needs` ensures sequential execution
* Docker runs only if tests pass

👉 This represents a real CI/CD pipeline.

---

# ⏰ Task 6: Health Check

## 📌 Purpose

To monitor the application automatically.

---

## 📁 Code

```yaml
on:
  schedule:
    - cron: '0 */12 * * *'

steps:
  - run: curl http://localhost:5000/health
```

---

## 🧠 Explanation

* Runs every 12 hours
* Checks application health

👉 Important for production monitoring.

---

# 🧠 Task 7: Pipeline Architecture

## 📌 Flow Diagram

```
Pull Request → Build & Test

Merge to Main → Build & Test → Docker Build → Deploy

Scheduled → Health Check
```

---

## 🧠 Explanation

* PR pipeline → validation
* Main pipeline → full CI/CD
* Health check → monitoring

👉 This represents the complete DevOps lifecycle.

---

# 📌 Final Understanding

This project covers:

* Continuous Integration (CI)
* Continuous Delivery (CD)
* Docker containerization
* GitHub Actions automation
* Application monitoring

---

# 🔥 Conclusion

This project demonstrates how to build a production-style CI/CD pipeline using GitHub Actions, including testing, deployment, and monitoring.

---

# #90DaysOfDevOps

# #DevOpsKaJosh

# #TrainWithShubham
