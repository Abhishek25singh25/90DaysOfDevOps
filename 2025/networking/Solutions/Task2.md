
# 🔐 Protocols and Ports Every DevOps Engineer Must Know (2025 Guide)

In DevOps, understanding **network protocols and their ports** is essential for CI/CD pipelines, server provisioning, automation, monitoring, container orchestration, and cloud deployments.

This document covers the **most important protocols**, their **default ports**, and **how they are used in DevOps workflows**.

---

## 📌 1. HTTP — HyperText Transfer Protocol

* **Port:** 80
* **Type:** Application Layer
* **Used For:** Websites, APIs, microservices communication, Kubernetes health checks, CI/CD integration.
* **DevOps Relevance:** Load balancers, API calls, service-to-service communication.

---

## 📌 2. HTTPS — Secure HTTP

* **Port:** 443
* **Type:** Application Layer
* **Used For:** Secure web traffic, encrypted APIs, dashboards like Jenkins/Grafana.
* **DevOps Relevance:** TLS certificates, secure production deployments, Git webhooks.

---

## 📌 3. SSH — Secure Shell

* **Port:** 22
* **Type:** Transport Layer
* **Used For:** Remote login, secure file transfers, server automation.
* **DevOps Relevance:** Deployment via SSH keys, Ansible/Terraform provisioning, secure Git operations.

---

## 📌 4. FTP — File Transfer Protocol

* **Ports:** 21 (Control), 20 (Data)
* **Used For:** File upload/download operations.
* **DevOps Relevance:** Used mostly in legacy environments.

---

## 📌 5. DNS — Domain Name System

* **Port:** 53 (UDP/TCP)
* **Used For:** Resolving domain names to IP addresses.
* **DevOps Relevance:** Kubernetes service discovery, cloud DNS routing, load balancing.

---

## 📌 6. SMTP — Simple Mail Transfer Protocol

* **Ports:** 25, 587 (secure), 465 (SSL)
* **Used For:** Sending email.
* **DevOps Relevance:** Alerts and notifications from Jenkins, Grafana, Prometheus.

---

## 📌 7. SNMP — Simple Network Management Protocol

* **Ports:** 161, 162
* **Used For:** Network management and monitoring.
* **DevOps Relevance:** Monitoring routers, switches, and infrastructure devices.

---

## 📌 8. MySQL / MariaDB

* **Port:** 3306
* **Used For:** Relational database access.
* **DevOps Relevance:** Backups, migrations, application connectivity.

---

## 📌 9. PostgreSQL

* **Port:** 5432
* **Used For:** Relational databases.
* **DevOps Relevance:** Managing DB clusters, migrations, analytics.

---

## 📌 10. Redis

* **Port:** 6379
* **Used For:** Caching, message queues.
* **DevOps Relevance:** Used in pipelines, microservices, distributed locks.

---

## 📌 11. Docker Engine API

* **Ports:** 2375 (HTTP), 2376 (HTTPS)
* **Used For:** Remote Docker management.
* **DevOps Relevance:** CI/CD image building, deployment automation.

---

## 📌 12. Kubernetes (K8s)

* **Kube API Server:** 6443
* **ETCD:** 2379
* **Kubelet:** 10250
* **Used For:** Container orchestration.
* **DevOps Relevance:** Cluster management, all kubectl operations.

---

## 📌 13. Grafana

* **Port:** 3000
* **Used For:** Dashboards.
* **DevOps Relevance:** Visualizing logs, metrics, alerts.

---

## 📌 14. Prometheus

* **Port:** 9090
* **Used For:** Monitoring and alerting.
* **DevOps Relevance:** Collecting metrics from servers, clusters, apps.

---

## 📊 Quick Reference Table

| Protocol   | Port       | DevOps Use              |
| ---------- | ---------- | ----------------------- |
| HTTP       | 80         | Web services/APIs       |
| HTTPS      | 443        | Secure APIs, Kubernetes |
| SSH        | 22         | Deployments, automation |
| FTP        | 20/21      | Legacy file transfer    |
| DNS        | 53         | Service discovery       |
| SMTP       | 25/587/465 | Alerts/notifications    |
| MySQL      | 3306       | Application database    |
| PostgreSQL | 5432       | Application database    |
| Redis      | 6379       | Caching, pipelines      |
| Docker API | 2375/2376  | Build & deploy          |
| K8s API    | 6443       | Cluster management      |
| Grafana    | 3000       | Dashboards              |
| Prometheus | 9090       | Monitoring              |

---

## 📌 Conclusion

These protocols and ports are essential for:

* CI/CD pipelines
* Cloud deployments
* Kubernetes networking
* Infrastructure automation
* Monitoring and alerting
* Secure communication

Mastering them is a key skill for every DevOps engineer.

