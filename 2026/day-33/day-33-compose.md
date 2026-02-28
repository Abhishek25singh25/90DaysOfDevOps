# Day 33 – Docker Compose: Multi-Container Basics

## Objective
Run multi-container applications using Docker Compose instead of manually creating networks and volumes.

---

## Task 1 – Install & Verify

### Check Docker Compose Version
docker compose version

### Check Docker Version
docker --version

Docker Compose v2 is installed and working successfully.

---

## Task 2 – First Compose File (Nginx)

### Steps Performed

1. Created folder:
   mkdir compose-basics
   cd compose-basics

2. Created docker-compose.yml file for Nginx.

3. Started container:
   docker compose up -d

4. Verified in browser:
   http://localhost:8080

5. Stopped container:
   docker compose down

Result: Nginx container started and served the default welcome page successfully.

---

## Task 3 – WordPress + MySQL Multi-Container Setup

### Steps Performed

1. Created docker-compose.yml file containing:
   - MySQL service
   - WordPress service
   - Named volume for persistence

2. Started services:
   docker compose up -d

3. Accessed WordPress:
   http://localhost:9000

4. Completed WordPress installation setup.

5. Verified persistence:
   docker compose down
   docker compose up -d

Result: WordPress data persisted after restart due to named volume.

---

## Task 4 – Important Docker Compose Commands

Start in detached mode:
docker compose up -d

View running services:
docker compose ps

View all logs:
docker compose logs

View logs of specific service:
docker compose logs mysql

Stop services without removing:
docker compose stop

Remove containers and network:
docker compose down

Rebuild images:
docker compose build
docker compose up -d

---

## Task 5 – Environment Variables

1. Added environment variables directly in docker-compose.yml.

2. Created a .env file to store database credentials.

3. Referenced variables using:
   ${VARIABLE_NAME}

4. Verified variables using:
   docker compose exec mysql env | grep MYSQL

Result: Environment variables were successfully picked up by containers.

---

## Key Learnings

- Docker Compose runs multi-container applications with a single command.
- Services automatically share a default network.
- Service names act as DNS inside the network.
- Named volumes provide data persistence.
- Environment variables configure containers at runtime.
- .env files help separate configuration from code.
