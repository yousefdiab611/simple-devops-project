resource "aws_instance" "tomcat" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  iam_instance_profile   = aws_iam_instance_profile.tomcat_jenkins_ec2_profile.name
  vpc_security_group_ids = ["${aws_security_group.allow_jenkins_tomcat.id}"]
  tags = {
    Name = var.project
    OS   = var.os
  }
  user_data = file("user-data.sh")
}
