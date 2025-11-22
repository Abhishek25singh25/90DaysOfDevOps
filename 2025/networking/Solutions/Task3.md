# Launching AWS EC2 Instance & Configuring Security Groups (Root User)

AWS EC2 (Elastic Compute Cloud) lets you run virtual servers in the cloud.  
Security Groups act as virtual firewalls controlling inbound and outbound traffic to your instance.

This guide explains how to launch an EC2 instance and configure Security Groups using **root login**.

---

## Step 1: Sign in to AWS
1. Go to [AWS Management Console](https://aws.amazon.com/console/).  
2. Sign in with your AWS credentials.

---

## Step 2: Launch an EC2 Instance
1. Navigate to **EC2 → Instances → Launch Instances**.  
2. **Choose AMI (Amazon Machine Image):**  
   - Select your preferred Linux AMI (Amazon Linux, Ubuntu, etc.).  
3. **Choose Instance Type:**  
   - Select **t2.micro** (Free Tier eligible).  
4. Click **Next: Configure Instance Details** → leave defaults → **Next**.  

---

## Step 3: Configure Security Group
1. Create a **new Security Group** or select an existing one.  
2. **Add Inbound Rules:**  
   - **SSH (Port 22)** → Source: **My IP** (restrict access).  
   - **HTTP (Port 80)** → Source: **Anywhere (0.0.0.0/0)** (if hosting a website).  
   - **HTTPS (Port 443)** → Source: **Anywhere (0.0.0.0/0)**.  
3. Outbound rules can remain default (all allowed).  

> **Tip:** Never leave SSH open to all (0.0.0.0/0) for security reasons.

---

## Step 4: Key Pair Setup
1. Create a new key pair and download the `.pem` file.  
2. You will use it to log in as **root**.

---

## Step 5: Launch Instance
1. Review your settings → click **Launch**.  
2. Wait for the instance to become **running**.

---

## Step 6: Connect as Root
1. Make the key file secure:  
```bash
chmod 400 my-key.pem

