# Day 29 – Introduction to Docker

## 🚀 What is Docker?

Today I learned the basics of Docker and ran my first containers. At first it felt confusing, but once I actually ran commands and saw containers working, things started making sense.

---

## 🔹 What is a Container?

A container is a lightweight package that includes:

* Application code
* Runtime
* Required libraries
* All dependencies

It helps solve the classic problem: *"It works on my machine"*.

Instead of worrying about different environments or missing dependencies, containers make sure the application runs the same everywhere.

Containers share the host OS kernel, which makes them much faster and lighter than virtual machines.

---

## 🆚 Containers vs Virtual Machines

| Feature     | Containers    | Virtual Machines   |
| ----------- | ------------- | ------------------ |
| Boot Time   | Few seconds   | Few minutes        |
| Size        | MBs           | GBs                |
| OS          | Share Host OS | Separate OS per VM |
| Performance | Lightweight   | Heavy              |
| Isolation   | Process-level | Hardware-level     |

### My Understanding:

Virtual Machines virtualize hardware.
Containers virtualize the operating system.

That’s why containers are faster and more efficient.

---

## 🏗 Docker Architecture

Docker uses a client-server architecture.

### Main Components:

1. **Docker Client**
   This is what we use in terminal (`docker run`, `docker ps`).

2. **Docker Daemon (dockerd)**
   Runs in the background and manages containers and images.

3. **Docker Images**
   Blueprint for containers. Images are read-only.

4. **Docker Containers**
   Running instance of an image.

5. **Docker Registry**
   Stores images. Example: Docker Hub.

---

### Docker Flow (In Simple Words)

When I run:

```
docker run nginx
```

This happens:

1. Docker client sends request to daemon
2. Daemon checks if image exists locally
3. If not, it pulls from Docker Hub
4. Creates a container
5. Starts the container

Seeing this process in action helped me understand how Docker actually works.

---

# 🛠 Task 2 – Install Docker

## Verify Installation

```bash
docker --version
```

## Run Hello World

```bash
docker run hello-world
```

What happened:

* Image was downloaded from Docker Hub
* A container was created
* It ran successfully
* A confirmation message was printed

This confirmed Docker is working correctly on my system.

---

# 🌐 Task 3 – Run Real Containers

## 🔹 Run Nginx Container

```bash
docker run -d -p 8080:80 nginx
```

Then I opened:

```
http://localhost:8080
```

And saw the Nginx welcome page in the browser.
That was my first real container running as a web server.

---

## 🔹 Run Ubuntu Container (Interactive Mode)

```bash
docker run -it ubuntu bash
```

Inside the container I tried:

```bash
ls
pwd
whoami
```

It felt like using a mini Linux machine.

To exit:

```bash
exit
```

---

## 🔹 Useful Commands Practiced

List running containers:

```bash
docker ps
```

List all containers (including stopped):

```bash
docker ps -a
```

Stop a container:

```bash
docker stop <container_id>
```

Remove a container:

```bash
docker rm <container_id>
```

---

# 🔍 Task 4 – Exploring More Features

### 🔹 Detached Mode

```bash
docker run -d nginx
```

Difference:

* Container runs in background
* Terminal remains free

---

### 🔹 Custom Name

```bash
docker run -d --name mynginx nginx
```

Giving a custom name makes container management easier.

---

### 🔹 Port Mapping

```bash
docker run -d -p 3000:80 nginx
```

Format:

```
-p hostPort:containerPort
```

This connects the container’s port to my local machine port.

---

### 🔹 Check Logs

```bash
docker logs mynginx
```

Live logs:

```bash
docker logs -f mynginx
```

---

### 🔹 Run Command Inside Container

```bash
docker exec -it mynginx bash
```

Single command:

```bash
docker exec mynginx ls
```

---

# 💡 Why Docker Matters in DevOps

Docker is widely used in:

* CI/CD pipelines
* Cloud deployments
* Microservices architecture
* Kubernetes clusters

It ensures consistency across development, testing, and production.

---

# 🔥 Conclusion

Today I:

* Understood what containers are
* Learned Docker architecture
* Installed Docker
* Ran multiple containers
* Practiced important Docker commands

This was my first proper step into containers and DevOps. Looking forward to learning more 🚀
