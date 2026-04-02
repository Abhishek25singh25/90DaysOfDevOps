# Region

variable "region" {
  type        = string
  description = "To store the region for aws to use"
  default     = "ap-south-1"

}

# VPC_cidr

variable "vpc_cidr" {
  type        = string
  description = "This is the default VPC_cidr"
  default     = "10.0.0.0/16"
}

# subnet_cidr

variable "subnet_cidr" {
  type        = string
  description = "This is the default subnet cidr"
  default     = "10.0.1.0/24"
}

# instance_type

variable "instance_type" {
  type        = string
  description = "This is the default instance type to use"
  default     = "t3.micro"
}

# project_name

variable "project_name" {
  type        = string
  description = "Name of the project"


}
# environment

variable "environment" {
  type        = string
  description = "This is the default description"
  default     = "dev"

}

# allowed_ports

variable "allowed_ports" {
  type        = list(number)
  description = "List of allowed ports"
  default     = [22, 80, 443]

}

# extra tags
variable "extra_tags" {
  type        = map(string)
  description = "Additional tags"
  default     = {}
}
