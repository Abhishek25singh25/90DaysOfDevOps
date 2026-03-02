# 🚀 Day 35 – Multi-Stage Builds & Docker Hub

## 🎯 Goal

Today’s objective was to build optimized Docker images using multi-stage builds and push them to Docker Hub.

This is how real-world teams reduce image size, improve security, and distribute applications efficiently.

---

# 🧱 Task 1 – The Problem with Large Images

Created a simple application (Node.js / Go / Java).

Built the Docker image using a single-stage Dockerfile.

Observation:

- Image size was significantly large.
- It contained:
  - Build tools
  - Package managers
  - Development dependencies
  - Unnecessary layers

Conclusion:

Single-stage builds include everything required to build the app, even if it’s not needed at runtime.

---

# 🔄 Task 2 – Multi-Stage Build

Rewrote the Dockerfile using a multi-stage approach.

Two stages were used:

Stage 1 – Builder Stage  
- Installed dependencies  
- Compiled or prepared the application  

Stage 2 – Production Stage  
- Used a minimal base image (alpine or distroless)  
- Copied only the built application files  
- Excluded development tools  

After rebuilding:

- Image size reduced significantly.
- Only runtime dependencies were included.
- No build tools remained inside the final image.

---

## 📊 Size Comparison

Single-stage image → Large  
Multi-stage image → Much smaller  

Reason:

Multi-stage builds remove unnecessary build dependencies and intermediate files, resulting in:

- Smaller image size  
- Faster deployment  
- Reduced attack surface  
- Better production readiness  

---

# 🌍 Task 3 – Push to Docker Hub

Steps performed:

- Logged in using terminal
- Tagged the image properly using username/repository:tag format
- Pushed the image to Docker Hub
- Verified by pulling the image again after removing it locally

This confirmed that the image was successfully uploaded and accessible remotely.

---

# 🏷 Task 4 – Docker Hub Repository Exploration

Explored:

- Repository description section
- Tags tab
- Versioning behavior

Learned:

- Each push creates a tag
- `latest` is just a default tag, not necessarily the newest version
- Pulling a specific tag ensures consistent deployments
- Pulling `latest` may lead to unexpected updates

Understanding tagging is critical in production CI/CD workflows.

---

# 🛠 Task 5 – Image Best Practices Applied

Applied best practices to further optimize the image:

1. Used minimal base image (alpine instead of ubuntu)
2. Avoided running as root by creating a non-root user
3. Combined RUN instructions to reduce layers
4. Used specific base image versions instead of `latest`

Result:

- Smaller and more secure image
- Reduced number of layers
- Better compliance with production standards

---

# 🧠 Key Learnings

- Multi-stage builds drastically reduce image size
- Smaller images deploy faster
- Fewer dependencies = lower security risk
- Docker Hub tagging is important for version control
- Never rely blindly on `latest`
- Production images should not run as root

---

# 🏁 Conclusion

Day 35 focused on:

- Image optimization
- Multi-stage Docker builds
- Secure container practices
- Publishing images to Docker Hub
- Understanding tagging and versioning

This is a core DevOps skill and a frequently asked interview topic.

---

#90DaysOfDevOps  
#DevOpsKaJosh  
#TrainWithShubham
