variable "vpc_id" {
  description = "The vpc_id"
  type        = string

}

variable "ingress_ports" {
  description = "The variable for the ingress port"
  type        = list(number)
  default     = [22, 80, 443]
}

variable "environment" {
  description = "The environment for the project"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string

}