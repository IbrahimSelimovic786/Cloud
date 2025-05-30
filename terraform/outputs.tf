output "ec2_instance_a_public_ip" {
  value = aws_instance.app_instance_a.public_ip
}

output "ec2_instance_b_public_ip" {
  value = aws_instance.app_instance_b.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.app_db.endpoint
}
