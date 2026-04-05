# Day 64 – Terraform State Management and Remote Backends

## Overview

Terraform state is the core component of Infrastructure as Code. It maintains a mapping between the configuration files and the real infrastructure deployed in the cloud.

---

## Task 1: State Inspection

* Used `terraform show` to view full infrastructure details
* Used `terraform state list` to see tracked resources
* Used `terraform state show` to inspect individual resources
* Observed that Terraform stores many attributes beyond configuration
* Identified the `serial` number as the version of the state file

---

## Task 2: Remote Backend Setup

* Created an S3 bucket to store Terraform state remotely
* Enabled versioning for backup and recovery
* Created a DynamoDB table for state locking
* Configured backend in `main.tf`
* Migrated state using `terraform init`
* Verified successful migration using `terraform plan` (No changes)

---

## Task 3: State Locking

* Simulated concurrent operations using two terminals
* Observed error: **"Error acquiring the state lock"**
* Learned that locking ensures only one operation modifies infrastructure at a time
* Prevents corruption of the state file in team environments

---

## Task 4: Import Existing Resource

* Created an S3 bucket manually in AWS
* Defined the same resource in Terraform configuration
* Used `terraform import` to bring the existing resource into Terraform state
* Verified using `terraform plan`
* Confirmed that Terraform did not recreate the resource

---

## Task 5: State Operations (mv & rm)

* Used `terraform state mv` to rename a resource without recreating it
* Used `terraform state rm` to remove a resource from Terraform state without deleting it in AWS
* Re-imported the resource using `terraform import`
* Verified consistency using `terraform plan`

---

## Task 6: State Drift Detection and Resolution

* Manually modified a resource (S3 bucket tag) in AWS console
* Ran `terraform plan` to detect drift
* Terraform identified differences between actual and desired state
* Used `terraform apply` to reconcile the drift
* Verified resolution using `terraform plan` (No changes)

---

## Key Learnings

* Terraform state is the source of truth for infrastructure
* Remote backends improve reliability and team collaboration
* State locking prevents conflicts and ensures safe operations
* Import helps manage pre-existing infrastructure
* Drift detection is critical for maintaining consistency

---

## Best Practices

* Always use remote backend (S3) instead of local state
* Enable versioning for recovery
* Use DynamoDB for state locking
* Avoid manual changes in production environments
* Use CI/CD pipelines for all infrastructure updates

---

## Conclusion

Mastering Terraform state management is essential for building reliable and scalable infrastructure. Proper handling of state ensures consistency, safety, and effective collaboration in real-world DevOps environments.

