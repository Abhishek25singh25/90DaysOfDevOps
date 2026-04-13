# Day 69 — Ansible Playbooks and Modules (Detailed)

---

## 🔹 Task 1: First Playbook (Nginx Installation)

### Playbook:

```yaml
- name: Install and start Nginx on web servers
  hosts: web
  become: true

  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: present
        update_cache: yes

    - name: Start and enable Nginx
      service:
        name: nginx
        state: started
        enabled: true

    - name: Create custom index page
      copy:
        content: "<h1>Deployed by Ansible</h1>"
        dest: /usr/share/nginx/html/index.html
```

### Explanation:

* Play targets **web group**
* Tasks install, start, and configure Nginx
* `become: true` gives sudo access

### Result:

* First run → `changed`
* Second run → `ok` (idempotency)

---

## 🔹 Task 2: Playbook Structure

### Key Components:

* **Play** → defines target hosts
* **Tasks** → list of actions
* **Modules** → actual operations

### Answers:

1. Play = where, Task = what
2. Yes, multiple plays allowed
3. `become` at play = all tasks, at task = specific task
4. If a task fails → stops for that host only

---

## 🔹 Task 3: Essential Modules

### Playbook:

```yaml
- name: Practice essential modules
  hosts: all
  become: true

  tasks:
    - name: Install packages
      apt:
        name: [git, curl, wget, tree]
        state: present
        update_cache: yes

    - name: Create directory
      file:
        path: /opt/myapp
        state: directory
        mode: '0755'

    - name: Copy config file
      copy:
        src: files/app.conf
        dest: /etc/app.conf
        mode: '0644'

    - name: Check disk space
      command: df -h
      register: disk_output

    - name: Print disk space
      debug:
        var: disk_output.stdout_lines

    - name: Count processes
      shell: ps aux | wc -l
      register: process_count

    - name: Show process count
      debug:
        msg: "{{ process_count.stdout }}"

    - name: Set timezone
      lineinfile:
        path: /etc/environment
        line: 'TZ=Asia/Kolkata'
        create: true
```

### Learned Modules:

* apt, service, file, copy, command, shell, lineinfile

### Command vs Shell:

* command → simple, secure
* shell → supports pipes

---

## 🔹 Task 4: Handlers

### Playbook:

```yaml
- name: Configure Nginx with handler
  hosts: web
  become: true

  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: present

    - name: Deploy config
      copy:
        src: files/nginx.conf
        dest: /etc/nginx/nginx.conf
      notify: Restart Nginx

  handlers:
    - name: Restart Nginx
      service:
        name: nginx
        state: restarted
```

### Concept:

* Handler runs **only when change occurs**
* Prevents unnecessary restarts

---

## 🔹 Task 5: Check, Diff, Verbosity

### Commands:

```bash
ansible-playbook install-nginx.yml --check
ansible-playbook nginx-config.yml --check --diff
ansible-playbook install-nginx.yml -v
```

### Explanation:

* `--check` → dry run
* `--diff` → shows changes
* `-v` → debug output

👉 Important for production safety

---

## 🔹 Task 6: Multiple Plays

### Playbook:

```yaml
- name: Configure web servers
  hosts: web
  tasks:
    - apt:
        name: nginx
        state: present

- name: Configure app servers
  hosts: app
  tasks:
    - file:
        path: /opt/app
        state: directory

- name: Configure db servers
  hosts: db
  tasks:
    - apt:
        name: mysql-client
        state: present
```

### Result:

* Nginx → only web
* App setup → only app
* MySQL → only db

---

## 🔹 Verification

```bash
ansible web -m command -a "nginx -v"
ansible db -m command -a "mysql --version"
```

✔ Verified correct installation

---

## 🔹 Idempotency

* First run → changes
* Second run → no changes

👉 Ensures consistent automation

---

## 🔹 Conclusion

* Learned playbooks, modules, handlers
* Understood idempotency
* Executed multi-server automation

🚀 Now ready for advanced Ansible concepts!
