resource "aws_instance" "app" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_group_ids
  user_data              = file(var.user_data_path)
  iam_instance_profile   = var.iam_instance_profile

  tags = {
    Name = "tf-docker-host"
    Env  = var.environment
  }
}
