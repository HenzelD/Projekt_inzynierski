resource "aws_security_group" "firewall_elb" {
  name        = "firewall_elb"
  description = "firewall_elb"
    tags = {
    Name = "firewall_elb"
  }

  ingress {
  description = "Allow http from anywhere"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
  description = "Allow http from anywhere"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  ipv6_cidr_blocks = ["::/0"]
  }

  egress {
  description = "Allow all outbound traffic"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
  description = "Allow all outbound traffic"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  ipv6_cidr_blocks = ["::/0"]
  }
}

