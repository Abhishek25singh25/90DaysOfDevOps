variable "cidr" {
  description = "cidr block for vpc"
  type        = string

}

variable "public_subnet_cidr" {
  type = string
}


variable "environment" {
  description = "environment for project"
  type        = string


}

variable "project_name" {
  description = "Name of the project"
  type        = string

}