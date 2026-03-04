# Day 37 – Docker Revision

## Self-Assessment

Run a container from Docker Hub — **Can Do**

List, stop, remove containers and images — **Can Do**

Explain image layers and caching — **Can Do**

Write a Dockerfile from scratch — **Can Do**

CMD vs ENTRYPOINT — **Shaky**

Build and tag custom image — **Can Do**

Named volumes — **Can Do**

Bind mounts — **Can Do**

Custom networks — **Can Do**

docker-compose multi container — **Can Do**

Environment variables in compose — **Shaky**

Multi-stage Dockerfile — **Can Do**

Push image to Docker Hub — **Can Do**

Healthchecks and depends_on — **Shaky**

---

# Quick-Fire Answers

### 1. Difference between image and container

Image:
A **read-only template** used to create containers.

Container:
A **running instance of an image**.

Example:

Image → blueprint
Container → running application

---

### 2. What happens to data when container is removed?

All data inside the container is **lost** unless it is stored in:

* volumes
* bind mounts

---

### 3. How do containers communicate in the same network?

They communicate using **container names as hostnames**.

Example:

```
mysql:3306
```

---

### 4. docker compose down vs docker compose down -v

docker compose down

Stops containers and removes network.

docker compose down -v

Stops containers and **also removes volumes (data deleted).**

---

### 5. Why multi-stage builds?

They:

* Reduce image size
* Remove build dependencies
* Improve security
* Make production images smaller

---

### 6. COPY vs ADD

COPY
Copies files from host to container.

ADD
Can also extract archives and download URLs.

Best practice: **use COPY unless ADD is needed.**

---

### 7. What does -p 8080:80 mean?

```
HostPort : ContainerPort
```

Traffic to **localhost:8080** goes to **container port 80**.

---

### 8. Check Docker disk usage

```
docker system df
```

Shows size of:

* images
* containers
* volumes
* build cache

---

# Revision Notes

Key Docker concepts learned:

* Containers vs Images
* Dockerfile basics
* Volumes and persistent data
* Networking between containers
* Docker Compose for multi-container apps
* Multi-stage builds
* Docker Hub image sharing

---

# Weak Areas To Revisit

1. CMD vs ENTRYPOINT
2. Environment variables in Docker Compose

Plan: redo those examples again.

---

# Conclusion

Days 29–36 covered the **core Docker workflow used in real DevOps environments**.

Docker skills learned:

* Container lifecycle
* Image building
* Storage with volumes
* Networking
* Multi-container applications
* Production image optimization

Next step: **Kubernetes and container orchestration.**
