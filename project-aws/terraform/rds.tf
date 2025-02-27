# AWS RDS
resource "aws_db_instance" "my_rds_instance" {
  allocated_storage      = 10
  db_name                = var.db_name
  identifier             = var.identifier
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.my_rds_sg.id]
}

# AWS RDS SECURITY GROUP
resource "aws_security_group" "my_rds_sg" {
  vpc_id      = var.vpc_id
  name        = "terraform-rds-sg"
  description = "Allow MySQL traffic"

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = [aws_security_group.my_ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# OUTPUTS

output "rds_endpoint" {
  value = aws_db_instance.my_rds_instance.endpoint
}

output "rds_database" {
  value = aws_db_instance.my_rds_instance.db_name
}
