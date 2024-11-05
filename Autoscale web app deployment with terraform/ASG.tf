resource "aws_launch_template" "templete" {
  image_id      = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.ubuntu-kp.id
  security_group_names = [ aws_security_group.web-sg.id ]
  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }
  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install -y nginx
    sudo systemctl restart nginx
    sudo systemctl enable nginx

  EOF
}

resource "aws_autoscaling_group" "asg" {
  vpc_zone_identifier = [aws_subnet.private-01.id, aws_subnet.private-02.id]
  desired_capacity   = 2
  max_size           = 3
  min_size           = 1

  launch_template {
    id      = aws_launch_template.templete.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "demo" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.test-tg.arn
}