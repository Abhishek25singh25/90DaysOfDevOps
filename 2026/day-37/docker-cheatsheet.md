# Docker Cheat Sheet

A quick reference for common Docker commands used in daily DevOps work.

---

# Container Commands

Run a container (interactive)

```
docker run -it ubuntu bash
```

Run container in detached mode

```
docker run -d nginx
```

List running containers

```
docker ps
```

List all containers

```
docker ps -a
```

Stop a container

```
docker stop <container_id>
```

Remove a container

```
docker rm <container_id>
```

Execute command inside container

```
docker exec -it <container_id> bash
```

View container logs

```
docker logs <container_id>
```

---

# Image Commands

Pull image from Docker Hub

```
docker pull nginx
```

List images

```
docker images
```

Build image from Dockerfile

```
docker build -t myapp .
```

Tag an image

```
docker tag myapp username/myapp:v1
```

Push image to Docker Hub

```
docker push username/myapp:v1
```

Remove image

```
docker rmi <image_id>
```

---

# Volume Commands

Create volume

```
docker volume create myvolume
```

List volumes

```
docker volume ls
```

Inspect volume

```
docker volume inspect myvolume
```

Remove volume

```
docker volume rm myvolume
```

Run container with volume

```
docker run -v myvolume:/data nginx
```

Bind mount example

```
docker run -v $(pwd):/app nginx
```

---

# Network Commands

Create network

```
docker network create mynetwork
```

List networks

```
docker network ls
```

Inspect network

```
docker network inspect mynetwork
```

Connect container to network

```
docker network connect mynetwork container_name
```

---

# Docker Compose Commands

Start services

```
docker compose up
```

Start in background

```
docker compose up -d
```

Stop services

```
docker compose down
```

Stop and remove volumes

```
docker compose down -v
```

View running services

```
docker compose ps
```

View logs

```
docker compose logs
```

Rebuild images

```
docker compose build
```

---

# Cleanup Commands

Remove unused containers, images, networks

```
docker system prune
```

Show Docker disk usage

```
docker system df
```

Remove unused volumes

```
docker volume prune
```

---

# Dockerfile Instructions

Base image

```
FROM ubuntu
```

Run command during build

```
RUN apt update
```

Copy files

```
COPY . /app
```

Set working directory

```
WORKDIR /app
```

Expose port

```
EXPOSE 5000
```

Default command

```
CMD ["python", "app.py"]
```

Define executable container

```
ENTRYPOINT ["python"]
```

---

# Useful Example

Run nginx on port 8080

```
docker run -d -p 8080:80 nginx
```

Meaning:
8080 = host port
80 = container port

---

# Tip for DevOps Engineers

Remember the common workflow:

```
Write Dockerfile
↓
docker build
↓
docker run
↓
docker tag
↓
docker push
```

---

# End

Docker is about **packaging applications + dependencies into portable containers**.
