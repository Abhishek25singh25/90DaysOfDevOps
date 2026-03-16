# Day 45 – Docker CI/CD Pipeline with GitHub Actions

## Overview

On Day 45, I built a complete CI/CD pipeline that automatically builds and publishes a Docker image whenever code is pushed to GitHub.

This pipeline demonstrates how modern DevOps workflows automate container image builds and distribution.

Technologies used:

* GitHub Actions
* Docker
* Docker Hub
* CI/CD pipelines

---

# Task 1 – Prepare the Repository

First, I prepared the repository for Docker CI/CD.

### Steps performed

1. Created a simple Python Flask application.
2. Added a `Dockerfile` to containerize the application.
3. Ensured that Docker Hub credentials were securely stored in GitHub Secrets.

### Repository structure

```
github-actions-practice
│
├── Dockerfile
├── README.md
│
├── app
│   ├── app.py
│   └── requirements.txt
│
└── .github
     └── workflows
          └── docker-publish.yml
```

---

# Task 2 – Build the Docker Image in CI

Next, I created a GitHub Actions workflow to automatically build the Docker image.

### Workflow trigger

The workflow triggers when code is pushed to the `main` branch.

### Steps performed by the pipeline

1. Checkout repository code.
2. Start a GitHub Actions runner.
3. Build the Docker image using the Dockerfile.

### Example command used in the pipeline

```
docker build -t my-app:v1 .
```

### Verification

The build logs in GitHub Actions confirmed that the Docker image was successfully created.

---

# Task 3 – Push Docker Image to Docker Hub

After building the image, the next step was to push it to Docker Hub.

### Steps implemented

1. Login to Docker Hub using GitHub Secrets.
2. Tag the image with:

   * `latest`
   * commit SHA
3. Push both tags to Docker Hub.

### Example tags

```
username/myapp:latest
username/myapp:sha-abc1234
```

### Security

Authentication was handled using GitHub repository secrets:

```
DOCKER_USERNAME
DOCKER_TOKEN
```

These credentials are securely stored and never exposed in the workflow logs.

---

# Task 4 – Push Only on Main Branch

To avoid unnecessary image pushes from feature branches, I added a condition.

### Logic implemented

* Image builds on **all branches**
* Image pushes **only on the main branch**

### Example condition used

```
if: github.ref == 'refs/heads/main'
```

This ensures the Docker registry only receives production-ready images.

---

# Task 5 – Add Pipeline Status Badge

To visualize pipeline status, I added a GitHub Actions badge in the README.

### Badge URL format

```
https://github.com/<username>/<repo>/actions/workflows/docker-publish.yml/badge.svg
```

### Example badge

```
![Docker Publish](badge-url)
```

The badge automatically shows whether the pipeline is passing or failing.

---

# Task 6 – Pull and Run the Docker Image

Finally, I verified that the pushed image could be pulled and executed.

### Pull the image

```
docker pull username/myapp:latest
```

### Run the container

```
docker run -p 5000:5000 username/myapp:latest
```

### Result

The container started successfully and the application was accessible through the browser.

---

# Full Journey – From `git push` to Running Container

1. Developer pushes code to GitHub using `git push`.
2. GitHub Actions detects the push event.
3. A runner starts and checks out the repository.
4. Docker builds the image using the Dockerfile.
5. The workflow logs in to Docker Hub using secure secrets.
6. The image is tagged with `latest` and commit SHA.
7. The image is pushed to Docker Hub.
8. A user pulls the image from Docker Hub.
9. Docker runs the container locally or on a server.
10. The application becomes accessible to users.

---

# Key Learnings

* Building Docker images inside CI pipelines
* Authenticating Docker Hub securely with GitHub Secrets
* Tagging images with commit hashes
* Controlling pipeline behavior with branch conditions
* End-to-end container delivery automation

---

# Conclusion

This project demonstrates a fully automated Docker CI/CD workflow.

By integrating GitHub Actions with Docker Hub, the pipeline automatically builds and distributes container images whenever new code is pushed.

Such pipelines are widely used in modern DevOps environments to enable fast and reliable software delivery.
