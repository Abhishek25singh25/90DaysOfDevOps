# 📦 Day 34 – Docker Compose: Real-World Multi-Container Apps (Node + MySQL + Redis)

## 🎯 Goal

Today’s objective was to build a production-style 3-service application stack using Docker Compose.

Stack used:

- 🌐 Node.js Web Application  
- 🗄 MySQL Database  
- ⚡ Redis Cache  

This setup simulates a real backend architecture used in real-world applications.

---

# 🧱 Task 1 – 3 Service Application Stack

Created a multi-container application consisting of:

- A Node.js backend server
- MySQL as the primary database
- Redis for caching

The Node application connects to MySQL and Redis using service names inside the Docker network.

This ensures internal container communication without exposing unnecessary ports.

---

# 🔁 Task 2 – depends_on & Healthchecks

Learned that `depends_on` only controls start order, not readiness.

To solve this:

- Added a healthcheck to the MySQL service
- Configured the Node app to wait until MySQL is healthy
- Used `condition: service_healthy`

This prevents the common issue where the app crashes because the database is not ready yet.

---

# 🔄 Task 3 – Restart Policies

Tested different restart strategies.

### restart: always
- Container restarts automatically if stopped or crashed
- Best suited for databases in production

### restart: on-failure
- Restarts only when container exits with an error
- Useful for background services or jobs

Understanding restart behavior is critical for high availability systems.

---

# 🏗 Task 4 – Custom Dockerfile with Compose

Instead of using a prebuilt Node image directly:

- Used `build:` in docker-compose
- Built the app from a custom Dockerfile
- Rebuilt everything with a single command

This reflects how production systems are actually deployed.

---

# 🌐 Task 5 – Named Networks & Volumes

Defined:

- A custom backend network for service communication
- A named volume for MySQL data persistence

Benefits:

- Data remains safe even if containers are removed
- Clean service separation
- Better structure for scalable systems

---

# 📈 Task 6 – Scaling Experiment

Scaled the Node web service to multiple replicas.

Observation:

- Multiple Node containers started successfully
- Port binding conflict occurred on the host
- Only one container can bind to the same host port

Conclusion:

Simple scaling does not work when using fixed port mapping.

To scale properly, production setups require:

- Reverse proxy (NGINX)
- Load balancer
- Or orchestration tools like Docker Swarm or Kubernetes

---

# 🧠 Key Learnings

- Container start does not mean service readiness
- Healthchecks improve stability
- Restart policies improve resilience
- Named volumes prevent data loss
- Scaling requires proper load balancing
- Docker Compose is powerful for development environments

---

# 🏁 Conclusion

Day 34 focused on building a real-world multi-container application stack using:

Node.js + MySQL + Redis

This exercise introduced production-level concepts like service health, restart strategies, persistent storage, and scaling limitations.

---

#90DaysOfDevOps  
#DevOpsKaJosh  
#TrainWithShubham
