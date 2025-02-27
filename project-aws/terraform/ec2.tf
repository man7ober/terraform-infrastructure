# AWS EC2 INSTANCE
resource "aws_instance" "my_ec2_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.my_ec2_sg.id]
  key_name                    = var.key_name
  depends_on                  = [aws_s3_bucket.my_s3_bucket]
  user_data                   = file("script.sh")
  user_data_replace_on_change = true

  tags = {
    Name = "terraform-ec2"
  }
}

# AWS EC2 SECURITY GROUP
resource "aws_security_group" "my_ec2_sg" {
  name        = "terraform-ec2-sg"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22 # for ssh into server
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TCP"
    from_port   = 3000 # for nodejs server
    to_port     = 3000
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

# OUTPUTS

output "ec2_public_ip" {
  value = aws_instance.my_ec2_instance.public_ip
}
