
output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.test-lb.name
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "subnet_public_1_cidr" {
  description = "The CIDR block of public subnet 1"
  value       = aws_subnet.public-01.cidr_block
}

output "subnet_public_2_cidr" {
  description = "The CIDR block of public subnet 2"
  value       = aws_subnet.public-02.cidr_block
}


output "subnet_public_1_ipv4" {
  description = "The IPv4 addresses of public subnet 1"
  value       = aws_subnet.public-01.id
}

output "subnet_public_2_ipv4" {
  description = "The IPv4 addresses of public subnet 2"
  value       = aws_subnet.public-02.id
}

