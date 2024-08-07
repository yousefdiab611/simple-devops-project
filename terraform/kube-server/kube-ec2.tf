resource "aws_instance" "kube" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  iam_instance_profile   = aws_iam_instance_profile.kube_jenkins_ec2_profile.name
  vpc_security_group_ids = ["${aws_security_group.allow_jenkins_kube.id}"]
  tags = {
    Name = var.project
    OS   = var.os
  }
  user_data = file("user-data.sh")
}
