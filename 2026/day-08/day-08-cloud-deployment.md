# Day 08 – Cloud Server Deployment & Nginx Logs Practice

## Goal

Today I deployed a real cloud server and practiced installing a web service and verifying it using logs — just like a real troubleshooting workflow.

---

## What I Did

* Launched a cloud instance and connected to it using SSH
* Updated the server and installed Nginx
* Verified that the Nginx service was running
* Opened HTTP access through security rules
* Confirmed the Nginx welcome page in the browser
* Located Nginx logs to verify incoming requests
* Saved logs into a file for documentation

---

## Understanding the Logs

Nginx keeps records of what happens on the server:

* **access.log** shows who connected, when, and what request was made
* **error.log** shows warnings or failures

When I refreshed the webpage, I could see my request appear in the logs.
This confirmed that the server was working correctly.

---

## Challenges I Faced

* HTTP access was blocked until firewall rules were fixed
* Initially confused service control vs installation
* Needed to find the correct log directory

Each issue was solved by checking status, configuration, and logs step by step.

---

## What I Learned

* Installing a service is not enough — verification is important
* Security rules directly affect accessibility
* Logs provide proof of system behavior
* Cloud servers require careful validation
* Troubleshooting becomes easier when logs are checked first

---

## Key Takeaway

Deploy → Verify → Check Logs
That’s the real workflow of a DevOps engineer.

---

Day 08 completed successfully ✔
