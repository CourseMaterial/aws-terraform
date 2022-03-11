output "private-ip" {
    description = "Private IP Address of EC2"
    value = aws_instance.instance.private_ip
}

output "public-ip" {
  description = "Public IP Address of EC2"
  value = aws_instance.instance.public_ip
}