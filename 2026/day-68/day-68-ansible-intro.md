# Day 68 — Introduction to Ansible and Inventory Setup

## 🔹 What is Configuration Management?

Configuration Management is the process of managing and maintaining systems in a consistent and automated way.

### Why do we need it?

* Ensures consistency across servers
* Reduces manual errors
* Saves time with automation
* Helps scale infrastructure easily
* Allows tracking and rollback of changes

---

## 🔹 Ansible vs Chef, Puppet, Salt

* **Ansible** → Agentless, simple (YAML), SSH-based
* **Chef** → Agent-based, uses Ruby, complex
* **Puppet** → Agent-based, declarative, enterprise-focused
* **Salt** → Fast, supports agent + agentless

👉 Ansible is easiest and beginner-friendly

---

## 🔹 What is Agentless?

Agentless means no software is required on target machines.

👉 Ansible uses:

* SSH (Linux)
* WinRM (Windows)

---

## 🔹 Ansible Architecture

* **Control Node** → Machine where Ansible runs (EC2 Ubuntu)
* **Managed Nodes** → EC2 instances (web, app, db)
* **Inventory** → List of servers (inventory.ini)
* **Modules** → Tasks (install package, copy file, etc.)
* **Playbooks** → YAML files for automation

---

## 🔹 Lab Setup

* Created 3 EC2 instances (Ubuntu 24.04)
* Instance type: t2.micro
* Security group: SSH (port 22 open)
* Same key pair used for all instances

Servers:

* Web Server
* App Server
* DB Server

---

## 🔹 Inventory File

```ini
[web]
web-server ansible_host=<IP1>

[app]
app-server ansible_host=<IP2>

[db]
db-server ansible_host=<IP3>

[application:children]
web
app

[all_servers:children]
application
db

[all:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=~/.ssh/control-node.pem
```

---

## 🔹 Ansible Installation

Installed on:
👉 Ubuntu EC2 (Control Node)

Reason:
👉 Only control node needs Ansible (agentless)

---

## 🔹 Ad-hoc Commands

### 1. Check uptime

```bash
ansible all -m command -a "uptime"
```

### 2. Check memory

```bash
ansible web -m command -a "free -h"
```

### 3. Disk usage

```bash
ansible all -m command -a "df -h"
```

### 4. Install git

```bash
ansible web -m apt -a "name=git state=present" --become
```

### 5. Copy file

```bash
ansible all -m copy -a "src=hello.txt dest=/tmp/hello.txt"
```

---

## 🔹 What does --become do?

👉 It gives **sudo/root access**
👉 Used when:

* Installing packages
* Managing services

---

## 🔹 Command vs Shell Module

| Command         | Shell                      |
| --------------- | -------------------------- |
| Simple commands | Supports pipes & redirects |
| Safer           | More flexible              |

---

## 🔹 Verification

```bash
ansible all -m ping
```

✔ All servers responded with **SUCCESS (pong)**

---

## 🔹 Conclusion

* Learned Ansible basics
* Set up inventory and groups
* Ran ad-hoc commands
* Understood agentless architecture

🚀 Ready for Playbooks next!
