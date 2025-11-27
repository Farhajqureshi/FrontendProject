variable "ami" { type = string }
variable "instance_type" { type = string }
variable "key_name" { type = string }
variable "security_group_ids" { type = list(string) }
variable "iam_instance_profile" { type = string }
variable "user_data_path" { type = string }
variable "environment" { type = string }
