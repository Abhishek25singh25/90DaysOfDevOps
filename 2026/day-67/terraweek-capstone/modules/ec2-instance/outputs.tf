output "instance_id" {
  description = "Instance id for server"
  value       = aws_instance.ec2_instance

}

output "public_ip" {
  description = "Public IP of ec2"
  value       = aws_instance.ec2_instance.public_ip
}