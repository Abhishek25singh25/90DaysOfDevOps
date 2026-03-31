# Day 61 – Introduction to Terraform and First AWS Infrastructure

## 🔥 Overview

Today I started my Terraform journey and learned how to create AWS infrastructure using code instead of manually configuring resources.

---

## 💡 What is Infrastructure as Code (IaC)

Infrastructure as Code means creating and managing cloud resources using code. It helps automate infrastructure, reduce errors, and make deployments consistent and repeatable.

---

## ⚙️ Setup

### Install Terraform

```bash
terraform -version
```

### Configure AWS

```bash
aws configure
aws sts get-caller-identity
```

---

## 🏗️ Terraform Project

### Create Folder

```bash
mkdir terraform-basics
cd terraform-basics
```

---

## 📦 main.tf

```hcl
provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "terraform-bucket-josh-batch"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t3.micro"

  tags = {
    Name = "TerraWeek-Day1"
  }
}
```

---

## 🚀 Terraform Commands

```bash
terraform init
terraform plan
terraform apply
```

---

## 🔍 Verification

* S3 bucket created in AWS console
* EC2 instance running successfully

---

## 📂 Terraform State

* Terraform stores all resource details in `terraform.tfstate`
* It tracks what is already created

### Commands:

```bash
terraform show
terraform state list
terraform state show aws_s3_bucket.my_bucket
terraform state show aws_instance.my_ec2
```

---

## 🔄 Modify and Update

Changed tag:

```hcl
Name = "TerraWeek-Modified"
```

### Plan Output Meaning:

* `+` → create
* `~` → update
* `-` → delete

This was an **in-place update**

---

## 💣 Destroy Resources

```bash
terraform destroy
```

All resources were deleted successfully.

---

## 📊 Key Learnings

* Terraform uses state file to track resources
* Infrastructure can be created, updated, and deleted using code
* IAM permissions are important
* Debugging AWS errors is part of real DevOps

---

## ✅ Conclusion

Successfully created and managed AWS infrastructure using Terraform and understood how Infrastructure as Code works in real-world scenarios.

---

#90DaysOfDevOps #Terraform #DevOps #TerraWeek #TrainWithShubham

