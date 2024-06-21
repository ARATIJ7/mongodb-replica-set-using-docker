output "instance_ips" {
  description = "The IP addresses of the MongoDB instances"
  value       = aws_instance.mongo[*].public_ip
}
