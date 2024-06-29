
# Security group for EC2 instances
resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "SeguridadEC2"
  vpc_id      = aws_vpc.main.id

  # Inbound rule for SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound rule for HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web_sg"
  }
}

# EC2 instance 1
resource "aws_instance" "web_instance_1" {
  ami           = "ami-01b799c439fd5516a"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_1.id
  associate_public_ip_address = true
  key_name      = "keyKarina"

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "web_instance_1"
  }
}

# EC2 instance 2
resource "aws_instance" "web_instance_2" {
  ami           = "ami-01b799c439fd5516a"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_2.id
  associate_public_ip_address = true
  key_name      = "keyKarina"

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "web_instance_2"
  }
}
