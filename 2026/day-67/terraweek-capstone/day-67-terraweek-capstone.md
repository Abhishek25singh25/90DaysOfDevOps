# 📄 Day 67 – TerraWeek Capstone: Multi-Environment Infrastructure (Theory Notes)

## 📌 Introduction

Day 67 is the final capstone of Terraform learning. It combines all concepts like modules, variables, state, and workspaces to build a real-world multi-environment infrastructure. The goal is to use a single codebase to manage multiple environments such as development, staging, and production. 

---

# 🔹 Task 1: Understanding Terraform Workspaces

### ✅ What are Workspaces?

Terraform workspaces allow you to manage multiple environments using the same configuration. Each workspace represents a separate environment.

### 🧠 Key Concept

* Default workspace = `default`
* You can create:

  * dev
  * staging
  * prod

### 📌 terraform.workspace

It returns the current workspace name being used inside the Terraform configuration.

### 📌 State File Storage

Each workspace stores its own state file separately:

* `terraform.tfstate.d/dev/`
* `terraform.tfstate.d/staging/`
* `terraform.tfstate.d/prod/`

### 📌 Workspaces vs Separate Directories

* Workspaces → same code, different state
* Directories → separate codebases

### 🎯 Conclusion

Workspaces help maintain clean and scalable infrastructure using a single codebase.

---

# 🔹 Task 2: Project Structure Best Practices

### ✅ Why Proper Structure is Important?

A clean file structure improves:

* Readability
* Maintainability
* Scalability

### 🧠 Key Files

* main.tf → main execution file
* variables.tf → input variables
* outputs.tf → output values
* providers.tf → provider configuration
* locals.tf → reusable values
* tfvars → environment-specific values

### 📌 Modules Directory

Contains reusable components:

* VPC
* Security Group
* EC2

### 📌 .gitignore Importance

Used to ignore:

* state files
* sensitive variables
* Terraform cache

### 🎯 Conclusion

Proper structure ensures modular and professional infrastructure setup.

---

# 🔹 Task 3: Custom Modules

### ✅ What are Modules?

Modules are reusable components used to organize Terraform code.

### 🧠 Modules in This Project

#### 1. VPC Module

* Creates network infrastructure
* Includes VPC, subnet, internet gateway
* Provides networking base

#### 2. Security Group Module

* Controls inbound and outbound traffic
* Uses dynamic rules for flexibility

#### 3. EC2 Module

* Launches virtual machines
* Connects with subnet and security group

### 🎯 Benefits

* Reusability
* Cleaner code
* Easy debugging

---

# 🔹 Task 4: Workspace-Aware Configuration

### ✅ Purpose

To make infrastructure change automatically based on environment.

### 🧠 How It Works

* terraform.workspace gives current environment
* Locals are used to generate dynamic values

### 📌 Example Behavior

* dev → small resources
* staging → medium resources
* prod → large resources

### 🎯 Key Advantage

Same code behaves differently for each environment.

---

# 🔹 Task 5: Multi-Environment Deployment

### ✅ What Happens Here?

Infrastructure is deployed for:

* dev
* staging
* prod

### 🧠 Key Concept

Each environment has:

* Separate VPC
* Separate EC2 instance
* Different configurations

### 📌 Isolation

Each environment is completely isolated:

* Different CIDR ranges
* Separate state files
* Independent resources

### 🎯 Outcome

Production-level infrastructure with environment separation.

---

# 🔹 Task 6: Terraform Best Practices

### ✅ Important Practices

#### 1. File Structure

Keep separate files for better organization.

#### 2. State Management

Use remote backend for team projects.

#### 3. Variables

Avoid hardcoding values.

#### 4. Modules

Use reusable modules for clean code.

#### 5. Workspaces

Use for environment isolation.

#### 6. Security

Do not expose sensitive data.

#### 7. Commands

Always run plan before apply.

#### 8. Tagging

Tag resources for easy identification.

#### 9. Naming Convention

Use consistent naming pattern.

#### 10. Cleanup

Destroy unused resources to save cost.

---

# 🔹 Task 7: Infrastructure Cleanup

### ✅ Why Cleanup is Important?

* Avoid unnecessary costs
* Maintain clean AWS account

### 🧠 Steps Involved

* Destroy resources for each environment
* Delete workspaces

### 📌 Verification

Ensure:

* No EC2 instances
* No VPCs
* No security groups

### 🎯 Conclusion

Always clean infrastructure after testing.

---

# 📊 Final Learning Summary

| Day | Concepts                         |
| --- | -------------------------------- |
| 61  | IaC, Terraform basics            |
| 62  | Providers and resources          |
| 63  | Variables and outputs            |
| 64  | State and backend                |
| 65  | Modules                          |
| 66  | EKS setup                        |
| 67  | Workspaces and multi-environment |

---

# 🎯 Final Conclusion

Day 67 demonstrates how to build scalable, modular, and environment-aware infrastructure using Terraform. It reflects real-world DevOps practices where a single codebase is used to manage multiple isolated environments efficiently.

---

