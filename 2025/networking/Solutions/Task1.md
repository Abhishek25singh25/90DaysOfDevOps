# Task1: OSI & TCP/IP Models with Real-World Examples

## 1. OSI Model (7 Layers) and Real-World Examples

### **1. Application Layer**

* **Function:** Provides services to user applications.
* **Protocols:** HTTP, HTTPS, FTP, SMTP.
* **Real-World Example:**

  * Using **Chrome** to open a website using **HTTP/HTTPS**.
  * Sending an email using **SMTP**.

### **2. Presentation Layer**

* **Function:** Data translation, encryption, compression.
* **Real-World Example:**

  * **SSL/TLS encryption** when browsing banking websites.
  * **JPEG/PNG** image conversion.

### **3. Session Layer**

* **Function:** Manages connections/sessions between devices.
* **Real-World Example:**

  * Logging into a website and maintaining your login session.
  * Video call apps maintaining an active session.

### **4. Transport Layer**

* **Function:** Reliable/unreliable delivery, segmentation.
* **Protocols:** TCP, UDP.
* **Real-World Examples:**

  * **TCP**: File downloads (reliable, ordered).
  * **UDP**: Online gaming, live streaming (fast, no retransmission).

### **5. Network Layer**

* **Function:** Routing packets.
* **Protocols:** IP.
* **Real-World Example:**

  * Your router forwarding packets using **IP addresses**.

### **6. Data Link Layer**

* **Function:** MAC addressing, framing.
* **Protocols:** Ethernet, Wi-Fi.
* **Real-World Example:**

  * Devices communicating over **Wi-Fi/Ethernet** using MAC addresses.

### **7. Physical Layer**

* **Function:** Transmission of raw bits.
* **Real-World Example:**

  * Fiber optic cables, LAN cables, Wi-Fi radio signals.

---

## 2. TCP/IP Model (4 Layers) and Real-World Examples

### **1. Application Layer**

* **Contains OSI layers:** Application + Presentation + Session.
* **Real-World Example:**

  * Web browsing (HTTP, HTTPS).
  * Email (SMTP, POP3, IMAP).

### **2. Transport Layer**

* **Protocols:** TCP, UDP.
* **Real-World Example:**

  * **TCP:** Netflix downloads, file transfer.
  * **UDP:** Live cricket streaming, VoIP.

### **3. Internet Layer**

* **Protocols:** IP, ICMP.
* **Real-World Example:**

  * IP routing across the internet.
  * ICMP used in **ping** command.

### **4. Network Interface Layer**

* **Contains OSI layers:** Data Link + Physical.
* **Real-World Example:**

  * Devices communicating over LAN/Wi-Fi hardware.
  * MAC address used for local communication.

---

## Summary Table

| OSI Layer    | Real-World Example                   |
| ------------ | ------------------------------------ |
| Application  | Opening a website (HTTP)             |
| Presentation | TLS encryption (HTTPS)               |
| Session      | Login session on a website           |
| Transport    | TCP for downloads, UDP for streaming |
| Network      | Routing using IP                     |
| Data Link    | Wi-Fi/Ethernet frames                |
| Physical     | Cables, signals                      |

| TCP/IP Layer      | Real-World Example      |
| ----------------- | ----------------------- |
| Application       | HTTP, FTP, SMTP         |
| Transport         | TCP/UDP usage           |
| Internet          | IP routing, ping        |
| Network Interface | Wi-Fi/Ethernet hardware |

