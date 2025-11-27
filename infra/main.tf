# Data sources
data "aws_vpc" "default" {
  default = true
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["106180067221"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

# Modules
module "sg" {
  source     = "./modules/security_group"
  name       = "tf-ec2-sg"
  vpc_id     = data.aws_vpc.default.id
  my_ip_cidr = var.my_ip_cidr
  app_port   = var.app_port
}

module "keypair" {
  source          = "./modules/key_pair"
  key_name        = var.key_name
  public_key_path = var.public_key_path
}

module "iam" {
  source    = "./modules/iam"
  role_name = "ec2-ecr-pull-role"
}

module "ec2" {
  source               = "./modules/ec2"
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = var.instance_type
  key_name             = module.keypair.key_name
  security_group_ids   = [module.sg.security_group_id]
  iam_instance_profile = module.iam.instance_profile_name
  user_data_path       = var.user_data_path
  environment          = var.environment
}
