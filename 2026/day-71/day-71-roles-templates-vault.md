# Day 71 — Ansible Roles, Templates, Galaxy and Vault

---

## 🔹 Introduction

Today I learned how to structure Ansible projects using roles, create dynamic configurations using templates, use community roles from Ansible Galaxy, and secure sensitive data using Ansible Vault.

---

## 🔹 Task 1: Jinja2 Templates

Templates allow dynamic configuration using variables.

### Example:

* `nginx.conf.j2`
* `vhost.conf.j2`

Variables like `{{ app_name }}`, `{{ http_port }}` are replaced at runtime.

### Result:

* Config files are generated dynamically
* Same template works for multiple servers

---

## 🔹 Task 2: Role Structure

### Directory Structure:

```
roles/webserver/
├── tasks/main.yml
├── handlers/main.yml
├── templates/
├── defaults/main.yml
```

### Difference:

* **defaults/main.yml**

  * Low priority
  * Easily overridden

* **vars/main.yml**

  * High priority
  * Not easily overridden

---

## 🔹 Task 3: Custom Webserver Role

### Features:

* Installed Nginx
* Created dynamic configs using templates
* Created web root
* Deployed index page
* Used handlers for restart

### Execution:

```bash
ansible-playbook site.yml
```

### Verification:

```bash
curl http://<WEB_SERVER_IP>
```

✔ Custom page loaded successfully

---

## 🔹 Task 4: Ansible Galaxy

### Installed Role:

```bash
ansible-galaxy install geerlingguy.docker
```

### Usage:

```yaml
roles:
  - geerlingguy.docker
```

### Why use requirements.yml?

* Manage multiple roles easily
* Version control
* Reproducible setup

---

## 🔹 Task 5: Ansible Vault

### Created encrypted file:

```bash
ansible-vault create group_vars/db/vault.yml
```

### Used in playbook:

```yaml
{{ vault_db_password }}
```

### Why use Vault?

* Protect secrets (passwords, API keys)
* Secure automation

---

## 🔹 Task 6: Combined Setup

### site.yml includes:

* Web role (custom role)
* Docker role (Galaxy)
* DB config (Vault + template)

### Result:

* Dynamic configs ✔
* Secure secrets ✔
* Reusable roles ✔

---

## 🔹 Key Learnings

* Roles organize large playbooks
* Templates make configs dynamic
* Galaxy provides reusable roles
* Vault secures sensitive data

---

## 🔹 When to Use What?

| Tool      | Use Case                |
| --------- | ----------------------- |
| Ad-hoc    | Quick commands          |
| Playbooks | Simple automation       |
| Roles     | Large reusable projects |

---

## 🔹 Conclusion

* Built production-ready automation
* Structured project like real-world DevOps
* Combined multiple concepts into one workflow

🚀 Now ready for advanced DevOps projects!
