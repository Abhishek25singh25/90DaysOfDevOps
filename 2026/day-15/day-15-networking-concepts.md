# Day 15 – Networking Concepts: DNS, IP, Subnets & Ports

## Goal

Today I focused on understanding the basic networking concepts that help systems communicate. Instead of only reading theory, I verified concepts using real commands and observations.

---

## Task 1 – DNS: How Names Become IPs

When I type a website name like google.com, my system asks a DNS server to convert that name into an IP address. Once the IP is found, the browser connects to that server to load the website.

### DNS Record Types

* **A** → maps a domain to an IPv4 address
* **AAAA** → maps a domain to an IPv6 address
* **CNAME** → alias pointing to another domain
* **MX** → mail server record
* **NS** → DNS server information

Command used:

dig google.com

Observation:

The domain resolved successfully to IPv4 addresses. TTL shows how long the result is cached.

---

## Task 2 – IP Addressing

An IPv4 address is a numeric identifier for devices on a network, written in dotted format like `192.168.1.10`.

### Public vs Private IP

* Public IP → reachable from the internet
* Private IP → used inside local/private networks

Private ranges:

* 10.x.x.x
* 172.16.x.x – 172.31.x.x
* 192.168.x.x

Command used:

ip addr show

Observation:

The system has a private IP, confirming network connectivity.

---

## Task 3 – CIDR & Subnetting

CIDR shows how much of an IP address is reserved for the network.

Example:

192.168.1.0/24 → network portion + host portion.

Subnetting divides a large network into smaller sections for easier management and reduced traffic.

### CIDR Table

| CIDR | Subnet Mask     | Total IPs | Usable Hosts |
| ---- | --------------- | --------- | ------------ |
| /24  | 255.255.255.0   | 256       | 254          |
| /16  | 255.255.0.0     | 65,536    | 65,534       |
| /28  | 255.255.255.240 | 16        | 14           |

---

## Task 4 – Ports: Doors to Services

A port allows different services to run on the same machine.

| Port  | Service |
| ----- | ------- |
| 22    | SSH     |
| 80    | HTTP    |
| 443   | HTTPS   |
| 53    | DNS     |
| 3306  | MySQL   |
| 6379  | Redis   |
| 27017 | MongoDB |

Command used:

ss -tulpn

Observation:

Active services are listening on ports like SSH (22) and HTTP (80).

---

## Task 5 – Putting It Together

curl http://myapp.com:8080 uses DNS to find the IP, TCP/IP to connect, and port 8080 to reach the service.

If an app cannot reach a database at 10.0.1.50:3306, I would check connectivity, firewall rules, and whether the service is running.

---

## What I Learned

* DNS converts domain names into IP addresses
* CIDR helps organize networks
* Ports allow multiple services to run
* Networking concepts improve troubleshooting understanding
