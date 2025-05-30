variable "db_username" {
  description = "RDS korisničko ime"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "RDS lozinka"
  type        = string
  sensitive   = true
  default     = "Admin1234!"
}

variable "repo_url" {
  description = "GitHub repo URL"
  type        = string
  default     = "https://github.com/IbrahimSelimovic786/Cloud.git"
}

variable "key_pair_name" {
  description = "AWS EC2 key pair ime"
  type        = string
  default     = "cloud9-key"
}
