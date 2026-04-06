# 🚀 Terraform Modules - Tasks 1 to 5 (Complete Notes)

---

# 📌 Task 1: Understand Modules

## 🔹 Root Module

* Main Terraform folder
* Where we run:

  * `terraform init`
  * `terraform plan`
  * `terraform apply`

## 🔹 Child Module

* Reusable Terraform code
* Called inside root module

## 🧠 Summary

* Root = main controller
* Child = reusable component

---

# 📌 Task 2: Build EC2 Module

## 📁 modules/ec2-instance/

### 🔹 variables.tf

```hcl
variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "subnet_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "instance_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
```

---

### 🔹 main.tf

```hcl
resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  tags = merge(
    {
      Name = var.instance_name
    },
    var.tags
  )
}
```

---

### 🔹 outputs.tf

```hcl
output "instance_id" {
  value = aws_instance.this.id
}

output "public_ip" {
  value = aws_instance.this.public_ip
}

output "private_ip" {
  value = aws_instance.this.private_ip
}
```

---

# 📌 Task 3: Build Security Group Module

## 📁 modules/security-group/

### 🔹 variables.tf

```hcl
variable "vpc_id" {
  type = string
}

variable "sg_name" {
  type = string
}

variable "ingress_ports" {
  type    = list(number)
  default = [22, 80]
}

variable "tags" {
  type    = map(string)
  default = {}
}
```

---

### 🔹 main.tf

```hcl
resource "aws_security_group" "this" {
  name   = var.sg_name
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_ports

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name = var.sg_name
    },
    var.tags
  )
}
```

---

### 🔹 outputs.tf

```hcl
output "sg_id" {
  value = aws_security_group.this.id
}
```

---

# 📌 Task 4: Call Modules from Root

## 🔹 Root main.tf

```hcl
provider "aws" {
  region = "ap-south-1"
}

locals {
  common_tags = {
    Project = "TerraWeek"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_vpc" "root" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.root.id
  cidr_block = "10.0.1.0/24"
}

module "web_sg" {
  source        = "./modules/security-group"
  vpc_id        = aws_vpc.root.id
  sg_name       = "terraweek-web-sg"
  ingress_ports = [22, 80, 443]
  tags          = local.common_tags
}

module "web_server" {
  source             = "./modules/ec2-instance"
  ami_id             = data.aws_ami.amazon_linux.id
  instance_type      = "t2.micro"
  subnet_id          = aws_subnet.public.id
  security_group_ids = [module.web_sg.sg_id]
  instance_name      = "terraweek-web"
  tags               = local.common_tags
}

module "api_server" {
  source             = "./modules/ec2-instance"
  ami_id             = data.aws_ami.amazon_linux.id
  instance_type      = "t2.micro"
  subnet_id          = aws_subnet.public.id
  security_group_ids = [module.web_sg.sg_id]
  instance_name      = "terraweek-api"
  tags               = local.common_tags
}
```

---

## 🔹 outputs.tf

```hcl
output "web_server_ip" {
  value = module.web_server.public_ip
}

output "api_server_ip" {
  value = module.api_server.public_ip
}
```

---

# 📌 Task 5: Use Public Registry Module

## 🔹 Replace VPC with Registry Module

```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "terraweek-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway   = false
  enable_dns_hostnames = true

  tags = local.common_tags
}
```

---

## 🔹 Update References

```hcl
module.vpc.vpc_id
module.vpc.public_subnets[0]
```

---

## 🔹 Commands

```bash
terraform init
terraform plan
terraform apply
```

---

## 🔹 Comparison

### Manual VPC

* VPC
* Subnet
* IGW
* Route Table

### Registry Module

* 15–20 resources automatically created

---

## 🔹 Important Question

### Where are modules downloaded?

```
.terraform/modules/
```

---

# 🧠 Final Summary

* Modules = reusable Terraform code
* Root module = main entry point
* Child modules = reusable components
* Registry modules = production-ready infrastructure

---

# 💡 One-line

**Terraform modules help build scalable, reusable, and clean infrastructure with minimal code.**

---
