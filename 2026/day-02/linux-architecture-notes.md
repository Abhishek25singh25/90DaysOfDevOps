Day 02 Linux Notes

Today I learned some basics about how Linux works.

Linux has three main parts.

Kernel  
Kernel is the main part of Linux.  
It controls CPU, memory, disk and devices.  
All programs run with help of kernel.

User space  
This is where we use the system.  
We type commands and run programs here.  
Terminal and apps are part of user space.

systemd  
When the system starts, systemd starts first.  
It starts all services needed for the system.  
It also checks if services are running or not.

---

Process means a program that is running.

When I run any command, a process is created.  
Every process has a number called PID.  
One process can create another process.

Process states I noted:

Running – process is working now  
Sleeping – process is waiting  
Zombie – process finished but not removed fully  
Stopped – process is paused

---

systemd helps to manage services.

We can start and stop services using systemd.  
If service stops, systemd can start it again.  
We can also check logs using systemd tools.

---

Some commands I will use daily:

ps – see running processes  
top – check CPU and memory usage  
systemctl status nginx – check service status  
journalctl – check logs  
kill PID – stop a process

---

This is important for DevOps work.

Most servers use Linux.  
If something goes wrong, we check processes and services.  
So these basics are very useful.
