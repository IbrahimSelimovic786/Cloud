output "alb_dns_name" {
  description = "DNS name of the load balancer"
  value       = aws_lb.app_alb.dns_name
}

output "alb_zone_id" {
  description = "Zone ID of the load balancer"
  value       = aws_lb.app_alb.zone_id
}

output "application_url" {
  description = "Application URL"
  value       = "http://${aws_lb.app_alb.dns_name}"
}

output "api_url" {
  description = "API URL"
  value       = "http://${aws_lb.app_alb.dns_name}/api"
}

output "rds_endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.app_db.endpoint
  sensitive   = true
}

output "instance_ids" {
  description = "EC2 Instance IDs"
  value       = aws_instance.app_instance[*].id
}

output "instance_public_ips" {
  description = "EC2 Instance Public IPs"
  value       = aws_instance.app_instance[*].public_ip
}
