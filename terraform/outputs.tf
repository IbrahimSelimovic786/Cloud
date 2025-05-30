# outputs.tf
output "alb_dns_name" {
  description = "DNS name of the load balancer"
  value       = aws_lb.app_alb.dns_name
}

output "alb_zone_id" {
  description = "Zone ID of the load balancer"
  value       = aws_lb.main.zone_id
}

output "application_url" {
  description = "Application URL"
  value       = "http://${aws_lb.main.dns_name}"
}

output "api_url" {
  description = "API URL"
  value       = "http://${aws_lb.main.dns_name}/api"
}

output "rds_endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.app_db.endpoint
  sensitive   = true
}

output "frontend_instance_id" {
  description = "Frontend EC2 instance ID"
  value       = aws_instance.frontend.id
}

output "backend_instance_id" {
  description = "Backend EC2 instance ID"
  value       = aws_instance.backend.id
}

output "frontend_public_ip" {
  description = "Frontend instance public IP"
  value       = aws_instance.frontend.public_ip
}

output "backend_public_ip" {
  description = "Backend instance public IP"
  value       = aws_instance.backend.public_ip
}