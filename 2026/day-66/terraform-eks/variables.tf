variable "region" {
  description = "The region for the eks cluster"
  type        = string
  default     = "ap-south-1"

}

variable "cluster_name" {
  description = "The name of cluster"
  type        = string
  default     = "terraweek-eks"

}

variable "cluster_version" {
  description = "The default version of cluster"
  type        = string
  default     = "1.31"

}

variable "node_instance_type" {
  description = "The instance type node"
  type        = string
  default     = "t3.medium"
}

variable "node_desired_count" {
  description = "The desired count of node"
  type        = string
  default     = "2"
}

variable "vpc_cidr" {
  description = "The vpc_cidr block"
  type        = string
  default     = "10.0.0.0/16"

}