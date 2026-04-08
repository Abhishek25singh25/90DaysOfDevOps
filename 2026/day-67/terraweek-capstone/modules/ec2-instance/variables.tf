variable "ami_id" {
  description = "AMI id for the  instance"
  type        = string

}

variable "instance_type" {
  description = "The instace type for ec2"
  type        = string

}

variable "subnet_id" {
  description = "The subnet_id of ec2"
  type        = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "environment" {
  description = "environment for project"
  type        = string


}

variable "project_name" {
  description = "Name of the project"
  type        = string

}