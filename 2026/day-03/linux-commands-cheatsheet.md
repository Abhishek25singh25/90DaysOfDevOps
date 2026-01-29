# Linux Commands Cheat Sheet – Day 03
Name: Abhishek Singh  
Goal: Daily Linux practice for DevOps

---

##  File System Commands

1. pwd – shows current directory path  
2. ls – list files and folders  
3. ls -la – show hidden files with details  
4. cd foldername – move into a folder  
5. cd .. – go one step back  
6. mkdir test – create a new folder  
7. touch file.txt – create empty file  
8. rm file.txt – delete a file  
9. rm -r folder – delete folder with files  
10. cp a.txt b.txt – copy file  
11. mv old.txt new.txt – rename or move file  
12. cat file.txt – show file content  
13. less file.txt – view large file page by page  
14. head file.txt – first 10 lines of file  
15. tail file.txt – last 10 lines of file  
16. tail -f app.log – live log monitoring

---

##  Process Management

17. ps – show running processes  
18. ps aux – detailed process list  
19. top – real-time process monitoring  
20. htop – better version of top (if installed)  
21. kill PID – stop a process by PID  
22. kill -9 PID – force stop process  
23. jobs – show background jobs  
24. bg – run job in background  
25. fg – bring job to foreground

---

##  Networking & Troubleshooting

26. ping google.com – check internet connectivity  
27. ip addr – show IP address details  
28. ss -tuln – check open ports and services  
29. curl https://example.com – test API or website response  
30. dig google.com – DNS lookup information

---

##  Disk & System Info

31. df -h – disk space usage  
32. du -sh folder – folder size  
33. free -h – memory usage  
34. uptime – system running time  
35. uname -a – system information

---

##  My Favorite Commands

- tail -f app.log → for live logs  
- ps aux → to find process using CPU  
- ip addr → quick IP check  
- df -h → check disk before server crash 😅

---

##  Why I Use These

These commands help me:
- Check server health
- Find errors in logs
- Debug network issues
- Manage running services

These are very useful for DevOps and production support.
