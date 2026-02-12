# Day 14 – Networking Fundamentals & Hands-on Checks

## Goal

Today I practiced basic networking concepts and troubleshooting commands to understand how systems communicate over a network. The focus was to run real checks and observe how connectivity works step by step.

---

## Quick Concepts

### OSI vs TCP/IP

* The OSI model explains networking through layered communication, helping identify where failures occur.
* TCP/IP is the practical internet networking stack that handles addressing, transport, and application communication.

### Protocol Placement

* IP → device addressing and routing
* TCP/UDP → data transport reliability/speed
* DNS → domain name resolution
* HTTP/HTTPS → web communication

### Real Example

Running:

curl https://example.com

Flow:

Application (HTTP request) → Transport (TCP connection) → Internet (IP routing)

---

## Hands-on Networking Checks

**Target host:** google.com

### Identity Check

Command: hostname -I
Observation: Confirmed system IP and network identity.

---

### Reachability Test

Command: ping google.com
Observation: Ping successful with stable latency.

---

### Path Check

Command: traceroute google.com
Observation: Packets traveled through multiple hops.

---

### Listening Ports

Command: ss -tulpn
Observation: Identified active services and listening ports.

---

### DNS Resolution

Command: dig google.com
Observation: Domain resolved to a valid IP address.

---

### HTTP Check

Command: curl -I https://google.com
Observation: Received HTTP response confirming accessibility.

---

### Connections Snapshot

Command: netstat -an | head
Observation: Displayed listening and active connections.

---

## Networking Troubleshooting Logic

Connectivity checks follow a layered approach:

IP identity → reachability → routing → DNS → service response

This structure helps isolate network issues quickly.

---

## Key Learning

Basic networking commands provide immediate visibility into connectivity and service availability. Practicing these checks builds confidence in real-world troubleshooting.
