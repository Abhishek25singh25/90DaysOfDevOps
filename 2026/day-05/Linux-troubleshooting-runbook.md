# Linux Troubleshooting Runbook – Day 05

## Target Service
NGINX – Web server handling HTTP requests on the system.

---

## Commands Executed & Observations

### Environment Basics
The system is running on a Linux kernel with Ubuntu as the operating system.  
Kernel version and architecture were verified successfully.

---

### Filesystem Sanity
A temporary directory was created and a system file was copied into it without errors.  
This confirms that the filesystem is writable and functioning correctly.

---

### CPU & Memory Snapshot
System CPU usage was normal and the NGINX process was consuming minimal CPU.  
Sufficient free memory was available, with no signs of memory pressure.

---

### Disk & IO Snapshot
Disk usage across all mounted partitions was within safe limits.  
NGINX log directory size was reasonable and not growing abnormally.

---

### Network Snapshot
NGINX was found listening on port 80 and accepting connections.  
An HTTP HEAD request to localhost returned a successful response.

---

### Logs Reviewed
Recent NGINX error logs did not show any critical issues.  
Access logs indicated normal request handling activity.

---

## Quick Findings
- NGINX service is running and stable  
- No abnormal CPU, memory, or disk usage detected  
- Network connectivity and port binding are correct  
- Logs are clean with no critical errors

---

## If This Worsens (Next Steps)
1. Validate NGINX configuration using `nginx -t`
2. Check service status and restart NGINX if required
3. Increase log verbosity and monitor error logs closely

---

## Learning / Notes
This drill reinforced the habit of checking system health and logs before restarting services.  
A structured troubleshooting approach helps avoid guesswork during incidents.
