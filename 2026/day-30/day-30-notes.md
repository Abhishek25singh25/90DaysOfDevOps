# Day 30 – Docker Images & Container Lifecycle

## Objective

Today I focused on understanding how Docker images and containers actually work internally.  
The goal was not just to run commands, but to understand what is happening behind the scenes.

---

# Task 1: Docker Images

## 1. Pull Required Images

I pulled the following images from Docker Hub:

docker pull nginx
docker pull ubuntu
docker pull alpine

---

## 2. List All Images

docker images

Observation:
- Ubuntu image size is around 70–80MB
- Alpine image size is around 5–7MB
- Nginx size depends on the base image

---

## 3. Why is Alpine Smaller than Ubuntu?

Alpine is much smaller because:

- It uses musl libc instead of glibc
- It uses BusyBox instead of full GNU utilities
- It includes only minimal essential packages
- It is designed specifically for containers

Ubuntu is a full Linux distribution with more tools, libraries, and utilities.

---

## 4. Inspect an Image

docker inspect nginx

From this command I could see:

- Image ID
- Created time
- Default CMD
- Exposed ports
- Environment variables
- Architecture
- Layers information

This helped me understand what is inside an image.

---

## 5. Remove an Image

docker rmi alpine

Images must not be in use by containers before removing them.

---

# Task 2: Image Layers

## 1. Check Image History

docker image history nginx

Observation:
- Each row represents one layer
- Some layers show size in MB
- Some layers show 0B

## Why do some layers show 0B?

Layers that modify the filesystem (like RUN, COPY, ADD) increase image size.

Layers like CMD, ENV, EXPOSE only modify metadata and do not change the filesystem, so they show 0B.

## What are Docker Layers?

Docker images are built using layered architecture.

Each instruction in a Dockerfile creates a read-only layer.

Layers are:
- Immutable
- Reusable
- Cached for faster builds

## Why does Docker use layers?

- Efficient storage (shared layers)
- Faster builds (layer caching)
- Faster downloads
- Better modular design

---

# Task 3: Container Lifecycle

I practiced full lifecycle management of a container.

## 1. Create container without starting

docker create nginx

State: Created

## 2. Start container

docker start <container_id>

State: Running

## 3. Pause container

docker pause <container_id>

State: Paused

## 4. Unpause container

docker unpause <container_id>

State: Running

## 5. Stop container

docker stop <container_id>

State: Exited

## 6. Restart container

docker restart <container_id>

State: Running

## 7. Kill container

docker kill <container_id>

Force stops container immediately.

## 8. Remove container

docker rm <container_id>

Container deleted from system.

After every step, I checked:

docker ps -a

To observe state changes.

---

# Task 4: Working with Running Containers

## 1. Run Nginx in detached mode

docker run -d -p 8080:80 --name mynginx nginx

## 2. View logs

docker logs mynginx

## 3. Follow logs in real time

docker logs -f mynginx

## 4. Exec into container

docker exec -it mynginx sh

Explored filesystem using:
ls
pwd
cd /

## 5. Run single command without entering container

docker exec mynginx ls /usr/share/nginx/html

## 6. Inspect container

docker inspect mynginx

From inspect I found:
- Container IP address
- Port mappings
- Mount information
- Network settings

---

# Task 5: Cleanup

## Stop all running containers

docker stop $(docker ps -q)

## Remove all stopped containers

docker rm $(docker ps -aq)

## Remove unused images and resources

docker system prune

## Check Docker disk usage

docker system df

This command shows space used by:
- Images
- Containers
- Volumes
- Build cache

---

# Key Learnings

- Docker images are built using layered architecture.
- Containers run as long as the main process is active.
- Metadata instructions create 0B layers.
- Layer caching improves performance.
- Container states change clearly during lifecycle.
- Proper cleanup prevents disk space issues.

---

# Conclusion

Day 30 helped me clearly understand the relationship between images and containers, how layers work internally, and how the full container lifecycle operates.

Consistency for 30 days has improved my practical understanding of Docker.
