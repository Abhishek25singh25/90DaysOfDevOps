# Day 32 – Docker Volumes & Networking

## 🚀 Goal

Today’s goal was to solve two real Docker problems:

1. Data persistence  
2. Container communication  

Containers are ephemeral.  
And by default, containers don’t easily talk to each other.

Today, I fixed both.

---

## 🧩 Task 1 – The Problem (Without Volume)

### What I Did

- Ran a MySQL container  
- Created a database and table  
- Inserted some rows  
- Stopped and removed the container  
- Ran a new container  

### What Happened?

❌ The data was gone.

### Why?

Because containers are ephemeral.

When a container is removed, its writable layer is deleted.  
Since I did not attach a volume, the database data was stored inside the container itself.

When the container was removed → the data was permanently lost.

This was my first real “aha” moment.

---

## 📦 Task 2 – Named Volumes

### What I Did

Created a named volume:

docker volume create testdb  

Ran MySQL with the volume attached:

docker run -d --name mysql-db --network test -e MYSQL_ROOT_PASSWORD=test123 -v testdb:/var/lib/mysql mysql:8  

Inserted data.  
Stopped and removed the container.  
Then started a brand new container with the same volume.

### What Happened?

✅ The data was still there.

### Why?

Because volumes store data outside the container lifecycle.

Even if the container is deleted, the volume remains.

### Verified Using

docker volume ls  
docker volume inspect testdb  

---

## 🗂 Task 3 – Bind Mounts

### What I Did

- Created a folder on my host machine  
- Added an `index.html` file  
- Ran Nginx with bind mount:

docker run --name nginx-demo -p 8080:80 -v $(pwd):/usr/share/nginx/html -d nginx  

### What Happened?

Opened browser → http://localhost:8080  

The website loaded.

Then I edited `index.html` on my host machine.  
Refreshed the browser.

✅ Changes appeared instantly.

### Difference: Named Volume vs Bind Mount

| Named Volume | Bind Mount |
|--------------|------------|
| Managed by Docker | Managed by user |
| Stored in Docker internal path | Stored in specific host folder |
| Good for production | Good for development |
| Data not directly visible | Files directly editable |

---

## 🌐 Task 4 – Docker Networking Basics

Listed networks:

docker network ls  

Inspected default bridge:

docker network inspect bridge  

### Experiment

Ran two containers on default bridge.

- Ping by name → ❌ Failed  
- Ping by IP → ✅ Worked  

### Why?

The default bridge network does not provide automatic DNS resolution.

Containers can talk using IP addresses, but not by container names.

---

## 🔗 Task 5 – Custom Networks

Created custom network:

docker network create my-app-net  

Ran two containers on this network.

### Result

- Ping by name → ✅ Worked  
- Ping by IP → ✅ Worked  

### Why?

User-defined bridge networks include built-in Docker DNS.

Container names are automatically resolved to IP addresses.

---

## 🧠 Task 6 – Full Setup (App + Database)

### Steps

1. Created custom network `test`  
2. Ran MySQL container with volume  
3. Ran app container (Alpine) on same network  
4. Verified connection using:

ping mysql-db  

### Result

✅ App container successfully reached the database using container name.

Because both containers were on the same custom network, Docker DNS resolved the container name automatically.

---

## 🔥 Key Learnings

- Containers are ephemeral  
- Volumes provide persistence  
- Bind mounts are useful for development  
- Default bridge does not support name-based communication  
- Custom networks enable automatic DNS  
- Container name becomes hostname inside custom network  

---

## 💡 My Biggest Takeaway

Before today, I didn’t fully understand why volumes and networking are so important.

After deleting a container and losing my data once —  
I will never forget why volumes matter.

This was a powerful learning day.

#90DaysOfDevOps  
#DevOpsKaJosh  
#TrainWithShubham
