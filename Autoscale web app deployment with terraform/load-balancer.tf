resource "aws_lb" "test-lb" {
  name               = "test-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web-sg.id]
  subnets            = [aws_subnet.public-01.id, aws_subnet.public-02.id]

  enable_deletion_protection = true
}

resource "aws_lb_target_group" "test-tg" {
  name     = "test-tg"
  port     = 80
  protocol = "HTTP"
  target_type = "alb"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_listener" "test" {
  load_balancer_arn = aws_lb.test-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test-tg.arn
  }
}
