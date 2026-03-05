# Day 36 – Docker Project: Dockerizing a Full Application

## 🚀 Project Overview

Today I Dockerized a complete Flask + PostgreSQL application end-to-end.

This project simulates a real-world backend service with database integration and production-ready Docker setup.

---

## 🛠 Tech Stack

- Python (Flask)
- PostgreSQL
- Docker
- Docker Compose

---

## 📂 Project Structure

2026/day-36/
│
├── app/
│   ├── app.py
│   └── requirements.txt
│
├── Dockerfile
├── docker-compose.yml
├── .dockerignore
├── .env (not pushed)
└── README.md

---

## 🐳 Docker Implementation

### 1️⃣ Multi-Stage Build
- Separate build and runtime stages
- Reduced final image size
- Removed unnecessary build dependencies

### 2️⃣ Non-Root User
- Improved container security
- Avoided running as root

### 3️⃣ Docker Compose Setup
- App service
- PostgreSQL database service
- Custom network
- Named volume for persistence
- Healthcheck for database readiness

---

## 🔐 Environment Configuration

Environment variables managed using `.env` file.

Important variables:
- POSTGRES_DB
- POSTGRES_USER
- POSTGRES_PASSWORD
- DB_HOST

---

## 📦 Final Image Size

Optimized Alpine-based image with multi-stage build.

---

## 🧠 Challenges Faced

- Database initialization error due to missing environment variables
- Volume reuse issues causing DB mismatch
- Docker Compose v2 version deprecation warning

---

## 🎯 Key Learnings

- Importance of volume management
- How healthchecks improve service dependency handling
- Why multi-stage builds are production standard
- Never push `.env` to GitHub

---

## 🔥 DevOps Takeaway

Dockerizing a full application requires:
- Clean folder structure
- Correct environment handling
- Secure image building practices
- Proper service orchestration

This is what real-world backend containerization looks like.
