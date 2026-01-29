# Day 04 – Linux Practice: Processes and Services

Today I practiced basic Linux commands related to processes, services and logs.
I ran the commands on my system and noted what I observed.

---

## 🔹 Process Checks

### 1. Check all running processes

Command:
ps aux

Observation:
This command shows all running processes along with PID, CPU and memory usage.
I could see system processes and user applications.

---

### 2. Real-time process monitoring

Command:
top

Observation:
It shows live CPU and memory usage.
I could see which processes were using more resources.
Pressed `q` to exit.

---

### 3. Find specific process

Command:
pgrep ssh

Observation:
It returned the PID of ssh process, which means ssh service is running.

---

## 🔹 Service Checks (systemd)

### 4. Check status of ssh service

Command:
systemctl status ssh

Observation:
Service was active and running.
It also showed when the service was started last.

---

### 5. List all running services

Command:
systemctl list-units --type=service --state=running

Observation:
It displayed all active services like NetworkManager, cron and ssh.

---

## 🔹 Log Checks

### 6. Check logs of ssh service

Command:
journalctl -u ssh --no-pager | tail -n 20

Observation:
I saw recent ssh related logs and service activity messages.

---

### 7. Check system logs

Command:
tail -n 30 /var/log/syslog

Observation:
It showed latest system messages and background service logs.

---

## 🔹 Mini Troubleshooting Practice

### Scenario: Service not working

Steps I would follow:

1. Check service status  
   systemctl status ssh

2. If service is stopped, start it  
   sudo systemctl start ssh

3. Check logs for errors  
   journalctl -u ssh

4. Verify service again  
   systemctl status ssh

Learning:
Always check status first, then logs, then restart if required.

---

## 🔹 What I Learned Today

- How to check running processes using ps and top
- How to inspect services using systemctl
- How to read service logs using journalctl and system logs using tail
- Basic troubleshooting flow for Linux services
