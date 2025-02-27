variable "ami_id" {
  type    = string
  default = "ami-00bb6a80f01f03502"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "terraform-kp"
}

variable "vpc_id" {
  type    = string
  default = "vpc-0c44ed15fe6e1ba97"
}

variable "db_name" {
  type    = string
  default = "terraform_db"
}

variable "identifier" {
  type    = string
  default = "terraform-rds"
}

variable "db_username" {
  type    = string
  default = "admin"
}

variable "db_password" {
  type    = string
  default = "admin123"
}

variable "bucket_name" {
  type    = string
  default = "terraform-s3bkt"
}
