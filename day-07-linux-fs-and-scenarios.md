# Day 07 – Linux File System & Scenario Practice

## What I Did Today

Today I explored Linux folders and practiced troubleshooting like a beginner DevOps engineer. I focused on understanding where files live and how to diagnose system problems step by step.

---

# Part 1 – Linux File System Hierarchy

## /

This is the main root directory of Linux. Everything starts from here.

Seen folders: home, etc

I would use this when I want to explore the whole system structure.

---

## /home

Stores folders of normal users.

Seen folders: ubuntu

I would use this when working with user files.

---

## /root

Home directory of the root (admin) user.

Seen files: hidden config files

I would use this when doing admin tasks.

---

## /etc

Contains system configuration files.

Seen files: hostname, passwd

I would use this when checking system settings.

---

## /var/log

Stores logs of services and system activity.

Seen logs: syslog, auth.log

I would use this when troubleshooting issues.

---

## /tmp

Temporary storage used by running programs.

Seen files: temp process files

I would use this when checking temporary data.

---

## /bin

Contains essential Linux commands.

Seen commands: ls, cp

I would use this when understanding system commands.

---

## /usr/bin

Contains additional user commands.

Seen commands: vim, nano

I would use this when running installed programs.

---

## /opt

Used for optional or third-party applications.

Seen: external software folders

I would use this when managing custom software.

---

# Hands-on Practice

Checked large logs:

du -sh /var/log/* | sort -h | tail -5

Viewed hostname config:

cat /etc/hostname

Checked my home directory:

ls -la ~

---

# Part 2 – Scenario Practice

## Scenario 1 – Service Not Starting

Step 1
systemctl status myapp
→ Check if service failed or stopped

Step 2
journalctl -u myapp -n 50
→ View recent error logs

Step 3
systemctl is-enabled myapp
→ Check if it starts on boot

Step 4
journalctl -xe
→ View system errors

---

## Scenario 2 – High CPU Usage

top
→ See live CPU usage

ps aux --sort=-%cpu | head
→ Find heavy processes

---

## Scenario 3 – Finding Service Logs

systemctl status docker
→ Confirm service status

journalctl -u docker -n 50
→ View logs

journalctl -u docker -f
→ Follow logs live

---

## Scenario 4 – Permission Issue

ls -l backup.sh
→ Check permissions

chmod +x backup.sh
→ Add execute permission

./backup.sh
→ Run script

---

## What I Learned

Linux directories have specific purposes.
Logs help diagnose problems.
Troubleshooting follows logical steps.
Permissions matter when running scripts.

---

# Conclusion

This practice helped me understand Linux structure and basic troubleshooting workflow like a DevOps engineer.

#90DaysOfDevOps
#TrainWithShubham
