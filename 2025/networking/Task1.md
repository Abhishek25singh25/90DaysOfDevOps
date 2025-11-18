✅ 1. OSI MODEL (Open Systems Interconnection Model)

The OSI model is a conceptual framework used to describe how data communication happens between two devices in a network.
It has 7 layers, and each layer performs a specific function.

OSI Model – 7 Layers (Top to Bottom)

Application Layer

Provides network services to the end user (e.g., browser, email).

Protocols: HTTP, FTP, SMTP.

Presentation Layer

Translates data, encrypts, decrypts, compresses.

Example: SSL/TLS encryption.

Session Layer

Manages sessions (start, maintain, end).

Example: Login session on a website.

Transport Layer

Responsible for segmentation, flow control, error control.

Ensures reliable/unreliable delivery with TCP/UDP.

Network Layer

Performs routing and logical addressing (IP).

Protocols: IP, ICMP.

Data Link Layer

Handles MAC addressing, framing, and error detection.

Example: Switches.

Physical Layer

Deals with physical transmission of bits through cables, signals.

Example: Ethernet cable, HUB.

✅ 2. TCP/IP MODEL (Transmission Control Protocol / Internet Protocol)

TCP/IP is a practical model used in real networks and the internet.
It has 4 layers.

TCP/IP Model – 4 Layers (Top to Bottom)

Application Layer

Contains all application-related protocols.

HTTP, FTP, DNS, SMTP.

Transport Layer

Ensures end-to-end delivery using TCP/UDP.

Error control, flow control, segmentation.

Internet Layer

Handles logical addressing and routing.

Protocols: IP, ICMP, ARP.

Network Access (Link) Layer

Deals with physical transmission and MAC addresses.

Includes Data Link + Physical layer functions.

✅ 3. DIFFERENCE BETWEEN OSI MODEL AND TCP/IP MODEL
Point	OSI Model	TCP/IP Model
Layers	7 layers	4 layers
Type	Theoretical/reference model	Practical/implementation model
Usage	Used for learning & understanding	Used in real-world networks/internet
Developed By	ISO	DoD (Department of Defense)
Layer merging	No merging	Combines OSI’s App + Presentation + Session into one Application layer
Transport Protocols	Not specified	Uses TCP and UDP
Network Layer Function	Only routing	Routing + addressing clearly defined
Flexibility	Strict layer boundaries	More flexible
Reliability	Handled at Transport layer	Also handled at Transport layer (TCP)
✅ 4. OSI vs TCP/IP Layer Mapping
OSI Layers (7)	TCP/IP Layers (4)
Application	Application
Presentation	Application
Session	Application
Transport	Transport
Network	Internet
Data Link	Network Access
Physical	Network Access
