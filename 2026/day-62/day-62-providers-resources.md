# Day 62 -- Providers, Resources and Dependencies

## Overview
In this project, I built a complete AWS infrastructure using Terraform. The goal was to understand how resources are connected and how Terraform manages dependencies automatically and manually.

---

## Task 1: AWS Provider

- Configured AWS provider with version ~> 5.0
- Initialized Terraform using terraform init
- Learned about .terraform.lock.hcl (locks provider versions)

### Key Concept
~> 5.0 → installs latest compatible version (5.x.x but not 6.x)

---

## Task 2: Build VPC

Resources created:

- VPC (10.0.0.0/16)
- Subnet (10.0.1.0/24)
- Internet Gateway
- Route Table
- Route (0.0.0.0/0 → IGW)
- Route Table Association

### Result
All resources successfully connected and verified in AWS console.

---

## Task 3: Implicit Dependencies

Terraform automatically detects dependencies using references.

### Example:
Subnet depends on VPC because it uses VPC ID.

### Answers:

- Terraform checks references between resources
- If subnet is created before VPC → error (VPC not found)
- Dependencies:

  - Subnet → VPC  
  - Internet Gateway → VPC  
  - Route Table → VPC  
  - Route → Route Table  
  - Route → Internet Gateway  
  - Association → Subnet  
  - Association → Route Table  

---

## Task 4: Security Group and EC2

### Security Group
- Allowed SSH (port 22)
- Allowed HTTP (port 80)
- Allowed all outbound traffic

### EC2 Instance
- Amazon Linux AMI
- Instance type: t3.micro
- Attached to subnet
- Attached security group
- Public IP enabled

### Result
EC2 instance created and accessible.

---

## Task 5: Explicit Dependencies

Created an S3 bucket for logs.

Used:
depends_on → to ensure S3 is created after EC2

### Reason
No direct reference exists, so Terraform cannot detect dependency automatically.

### Real Use Cases:
- EC2 must be created before provisioning script
- Application should start only after database is ready

---

## Task 6: Lifecycle Rules

Added lifecycle block:

- create_before_destroy = true

### Result:
Terraform creates new EC2 first, then destroys old one (zero downtime).

---

## Destroy Process

Used:
terraform destroy

### Observation:
Terraform deletes resources in reverse order:

EC2 → Security Group → Subnet → Route Table → IGW → VPC

---

## Lifecycle Arguments

### 1. create_before_destroy
Used to avoid downtime during replacement.

### 2. prevent_destroy
Prevents accidental deletion of critical resources.

### 3. ignore_changes
Ignores specific changes made outside Terraform.

---

## Dependency Graph

Used:
terraform graph

Visualized infrastructure dependencies.

---

## Final Learning

- Terraform uses references for implicit dependencies
- depends_on is used for manual control
- lifecycle rules improve reliability
- Always destroy resources to avoid cost

---

## Conclusion

This project helped me understand how to build and manage real-world AWS infrastructure using Terraform with proper dependency handling and lifecycle management.

---

# Rule to Remember

Create → Test → Destroy
