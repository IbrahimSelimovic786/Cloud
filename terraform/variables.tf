variable "db_username" {
  description = "RDS korisničko ime"
  type        = string
}

variable "db_password" {
  description = "RDS lozinka"
  type        = string
  sensitive   = true
}

variable "repo_url" {
  description = "GitHub repo URL"
  type        = string
}

variable "key_pair_name" {
  description = "AWS EC2 key pair ime"
  type        = string
}
