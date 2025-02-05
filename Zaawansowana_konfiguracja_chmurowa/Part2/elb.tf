# Network infrastructure
resource "aws_default_subnet" "defaulta" {
  availability_zone = "eu-west-2a"
  tags = {
    Name = "Default subnet for eu-west-2a"
  }
}
resource "aws_default_subnet" "defaultb" {
  availability_zone = "eu-west-2b"
  tags = {
    Name = "Default subnet for eu-west-2b"
  }
}
resource "aws_default_subnet" "defaultc" {
  availability_zone = "eu-west-2c"

  tags = {
    Name = "Default subnet for eu-west-2c"
  }
}
resource "aws_default_vpc" "default"{
}
# Application Load Balancer
resource "aws_lb" "main" {
  name               = "example-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.firewall_elb.id]
  subnets            = [aws_default_subnet.defaulta.id,aws_default_subnet.defaultb.id,aws_default_subnet.defaultc.id]
  enable_deletion_protection = false
  tags = {
    Name = "example-alb"
  }
}
# Target Group
resource "aws_lb_target_group" "main" {
  name        = "example-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id = aws_default_vpc.default.id
  target_type = "instance"
  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"
  }
  tags = {
    Name = "example-tg"
  }
}
# Listener dla ALB (HTTP)
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.main.arn}"
  }
}
output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = aws_lb.main.dns_name
}
resource "aws_lb_target_group_attachment" "target_grupa2" {
  target_group_arn = aws_lb_target_group.main.arn
  target_id        = aws_instance.web.id
  port             = 80
}