# Linux Networking Commands Cheat Sheet

## Objective

Learn and practice essential Linux networking commands to check connectivity, trace routes, inspect network statistics, make HTTP requests, and perform DNS lookups.

---

## 1️⃣ `ping` - Check Connectivity

**Purpose:** Verify if a host is reachable over the network.

**Usage:**

```bash
ping <hostname_or_ip>
```

**Example:**

```bash
ping google.com
```

* Sends ICMP packets to the host.
* `Ctrl+C` to stop.
* Shows packet loss and response time.

---

## 2️⃣ `traceroute` / `tracert` - Trace Packet Route

**Purpose:** Trace the path packets take to reach a destination.

**Usage (Linux):**

```bash
traceroute <hostname_or_ip>
```

**Usage (Windows):**

```cmd
tracert <hostname_or_ip>
```

**Example:**

```bash
traceroute google.com
```

* Shows all intermediate routers (hops) and response times.

---

## 3️⃣ `netstat` - Network Statistics

**Purpose:** View active connections, listening ports, and routing tables.

**Usage:**

```bash
netstat -a          # Show all connections
netstat -tuln       # Show listening TCP/UDP ports
netstat -r          # Show routing table
```

* `-a` → all sockets
* `-t` → TCP
* `-u` → UDP
* `-l` → listening
* `-n` → numeric addresses

---

## 4️⃣ `curl` - Make HTTP Requests

**Purpose:** Transfer data from or to a server using URL.

**Usage:**

```bash
curl <URL>
```

**Example:**

```bash
curl https://example.com
```

* Can be used to GET, POST data, download files, and test APIs.
* Options: `-I` (headers only), `-O` (save output to file).

---

## 5️⃣ `dig` / `nslookup` - DNS Lookup

**Purpose:** Query DNS records for a domain.

**Usage (`dig`):**

```bash
dig <domain_name>
```

**Example:**

```bash
dig google.com
```

* Shows A, MX, CNAME, and other DNS records.

**Usage (`nslookup`):**

```bash
nslookup <domain_name>
```

**Example:**

```bash
nslookup google.com
```

* Interactive and simple DNS lookup tool.

---

## Notes

* Always test `ping` first to check basic connectivity.
* Use `traceroute` to debug network delays or routing issues.
* `netstat` helps to monitor open ports and connections.
* `curl` is essential for web/API testing.
* `dig` and `nslookup` are useful for troubleshooting DNS problems.

---

## References

* `man ping`, `man traceroute`, `man netstat`, `man curl`, `man dig`, `man nslookup`

