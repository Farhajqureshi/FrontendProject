variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "tfstate_bucket" {
  type = string
}

variable "lock_table" {
  type    = string
  default = ""
}

variable "my_ip_cidr" {
  description = "CIDR for SSH access (your IP)"
  type        = string
}

variable "app_port" {
  type    = number
  default = 80
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "key_name" {
  type = string
}

variable "public_key_path" {
  type = string
}

variable "user_data_path" {
  type    = string
  default = "user_data.sh"
}
