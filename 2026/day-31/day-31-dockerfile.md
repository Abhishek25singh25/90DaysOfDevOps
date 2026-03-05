# Day 31 – Dockerfile: Build Your Own Images

## Objective
Today’s focus was writing Dockerfiles from scratch and understanding how Docker builds custom images.

---

## Tasks Completed

### Task 1: Your First Dockerfile
- Created a custom image using `ubuntu` as the base.
- Installed `curl` inside the image.
- Set a default command to print a custom message.
- Built and ran the image successfully.
- Verified output using `docker run`.

---

### Task 2: Dockerfile Instructions
Created a Dockerfile using all core instructions:

- FROM
- RUN
- COPY
- WORKDIR
- EXPOSE
- CMD

Understood how each instruction creates a new layer and how they work together during image build and container run.

---

### Task 3: CMD vs ENTRYPOINT
Tested behavior differences:

- CMD acts as a default command and can be overridden.
- ENTRYPOINT acts as a fixed main command and appends arguments.

Conclusion:
Use CMD when flexibility is required.
Use ENTRYPOINT when the container should always run a specific command.

---

### Task 4: Simple Web App Image
- Created a static `index.html`.
- Used `nginx:alpine` as the base image.
- Copied the HTML file to `/usr/share/nginx/html/`.
- Built and ran the container with port mapping.
- Successfully accessed the site via `http://localhost:8080`.

---

### Task 5: .dockerignore
- Created a `.dockerignore` file.
- Added:
  - node_modules
  - .git
  - *.md
  - .env
- Verified ignored files were not included in the build context.

---

### Task 6: Build Optimization
- Built an image and rebuilt without changes to observe caching.
- Modified one line and observed which layers rebuilt.
- Reordered Dockerfile instructions to optimize layer usage.

Key Learning:
Docker builds images in layers.
If a layer changes, that layer and all layers below it rebuild.
Placing frequently changing instructions at the bottom improves build speed.

---

## Commands Used
docker build -t image-name:tag .
docker run -p 8080:80 image-name
docker ps
docker logs <container_id>
docker build --no-cache -t image-name .

---

## What I Learned
- How Docker images are built in layers
- How build caching works
- Difference between CMD and ENTRYPOINT
- How to optimize Dockerfile for performance
- How to serve static websites using Nginx in Docker

---

#90DaysOfDevOps #DevOpsKaJosh #TrainWithShubham
