output "vpc_id" {
  description = "Value of vpc"
  value       = aws_vpc.vpc.id
}

output "subnet_id" {
  description = "SUbnet id output"
  value       = aws_subnet.public_subnet.id
}