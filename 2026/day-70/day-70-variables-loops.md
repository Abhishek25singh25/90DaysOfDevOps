# Day 70 — Variables, Facts, Conditionals and Loops

---

## 🔹 Introduction

Today I learned how to make Ansible playbooks dynamic using:

* Variables
* Facts
* Conditionals
* Loops

This allows one playbook to behave differently for different servers.

---

## 🔹 Task 1: Variables in Playbooks

### Key Concepts:

* Variables defined using `vars`
* Dynamic values using Jinja2 (`{{ }}`)

### Example:

```yaml
app_name: terraweek-app
app_port: 8080
app_dir: "/opt/{{ app_name }}"
```

### Verification:

* Default run → uses playbook variables
* CLI override:

```bash
ansible-playbook variables-demo.yml -e "app_name=my-custom-app app_port=9090"
```

👉 CLI variables override playbook variables ✔

---

## 🔹 Task 2: group_vars and host_vars

### Structure:

```
ansible-practice/
  inventory.ini
  ansible.cfg
  group_vars/
    all.yml
    web.yml
    db.yml
  host_vars/
    web-server.yml
  playbooks/
    site.yml
```

### Behavior:

* `group_vars/all.yml` → applies to all hosts
* `group_vars/web.yml` → only web servers
* `host_vars/web-server.yml` → only specific host

### Example:

* web group → `max_connections = 1000`
* host_vars → `max_connections = 2000`

👉 Final value = **2000 (host_vars overrides)**

---

## 🔹 Variable Precedence

Low → High:

```
group_vars/all
↓
group_vars/<group>
↓
playbook vars
↓
host_vars
↓
extra vars (-e)
```

👉 CLI variables have highest priority

---

## 🔹 Task 3: Ansible Facts

### What are facts?

* Automatic system information collected by Ansible

### Example:

```bash
ansible web-server -m setup
```

### Useful facts:

1. `ansible_distribution` → OS detection
2. `ansible_memtotal_mb` → memory-based decisions
3. `ansible_default_ipv4.address` → IP address
4. `ansible_hostname` → hostname
5. `ansible_interfaces` → network info

👉 Used for dynamic automation

---

## 🔹 Task 4: Conditionals (`when`)

### Example:

```yaml
when: "'web' in group_names"
```

### Use cases:

* Install Nginx only on web servers
* Install MySQL only on db servers
* Run tasks based on OS or memory

👉 Tasks skipped automatically if condition not met ✔

---

## 🔹 Task 5: Loops

### Example:

```yaml
loop: "{{ users }}"
```

### Use cases:

* Create multiple users
* Create multiple directories
* Install multiple packages

### Loop vs with_items:

* `loop` → modern syntax ✔
* `with_items` → old/deprecated

---

## 🔹 Task 6: Server Report

### Combined concepts:

* register
* facts
* conditionals

### Output:

* OS
* IP
* RAM
* Disk usage
* Running services

### Verification:

```bash
cat /tmp/server-report-*.txt
```

👉 Report generated correctly on each server ✔

---

## 🔹 Key Learnings

* Variables make playbooks flexible
* Facts provide real-time system data
* Conditionals control execution
* Loops handle repetitive tasks
* Register stores command output

---

## 🔹 Conclusion

* Built dynamic and intelligent playbooks
* Same playbook behaves differently per host
* Achieved real-world automation

🚀 Ready for Roles and advanced project structure!
