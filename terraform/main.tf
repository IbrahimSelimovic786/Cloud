provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_pair_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC3c2lGRKiB22JOo6+t37ETTvvQgi6tvFacEyETlSs0ep8FK/FUA7kH2k0inHOt5Bc2xoHBDzzpqRv4ydH3WVxR/SljJV9l03cRD/ShlIlnM/+xKlP8wHf5Chnc3wY0RyHoe/NQN6vchLhDj1ObYiXq3PPMhUaC+PbHVifPTpQ0KJU6mL0wWt2yQn3vi3+zLGeK2ZbNxNKuTVgxsWjBdIOgN8hhONBORcdUQUUydgjFBE1t4X6JmMsU9Y9XZ+1fMimVzHW52GsfOil6XiqtAVoPZx0xvOLZrJwCFTLiOCjv2kCwvn8PHFHBawCfIHFAgJaFL+qAAcFDgeWvhuPgPvbI71PTRA//Up/CE83EzZEyF2QnNA+QLk6h4RTDsgDS9DpU5sO55Nbijo35sAbhDbPi0SsGGtLjvJw1fQfq7vrAbk7SsaihpGeI9zUVfE5OAFwsSoPwGkUrAj9cETk3tJ8C2cKqHQXUI8WbKQm/9LkTYHHNoG9bbzmpcaZKa+hw0bJG1rigXnKl1hpmCoHZOiM3ywORZhpX9yBJJY0/VBXYGKAEDwTq4NhQZtmXS8pBngMisFNomisUVR2ysfFWlBYnHDPLUPTMbxlzKQWwldWxUE/jC5R+G+w20JFqJW1YO9kkn6vSqIqCE518Xq1lFlSQfn7cfUCoKx0djr+SD5HUwQ== ibrahim.selimovic@fet.ba"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "allow_http_ssh" {
  name        = "allow_http_ssh"
  description = "Allow HTTP, SSH, and app ports"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8085
    to_port     = 8085
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet.public_a.id, aws_subnet.public_b.id]
}

resource "aws_db_instance" "app_db" {
  identifier              = "app-db"
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  db_name                 = "appdb"
  username                = var.db_username
  password                = var.db_password
  skip_final_snapshot     = true
  publicly_accessible     = true
  vpc_security_group_ids  = [aws_security_group.allow_http_ssh.id]
  db_subnet_group_name    = aws_db_subnet_group.default.name
}

resource "aws_instance" "app_instance_a" {
  ami                    = "ami-0c7217cdde317cfec" # Amazon Linux 2 us-east-1a
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.generated_key.key_name
  subnet_id              = aws_subnet.public_a.id
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]
  user_data              = file("ec2-user-data.sh")
  tags = {
    Name = "AppInstanceA"
  }
}

resource "aws_instance" "app_instance_b" {
  ami                    = "ami-0c7217cdde317cfec" # Amazon Linux 2 us-east-1b
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.generated_key.key_name
  subnet_id              = aws_subnet.public_b.id
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]
  user_data              = file("ec2-user-data.sh")
  tags = {
    Name = "AppInstanceB"
  }
}
