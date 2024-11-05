resource "aws_instance" "bastion" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public-01.id
  key_name               = aws_key_pair.ubuntu-kp.key_name
  vpc_security_group_ids = [aws_security_group.bastion-sg.id]

  # Enable public IP assignment
  associate_public_ip_address = true

  # Attach IAM instance profile
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name        = "bastion-host"
  }
}