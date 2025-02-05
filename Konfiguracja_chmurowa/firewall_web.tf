resource "aws_security_group" "firewall_web" {
  name        = "firewall_web"
  description = "firewall_web"
    tags = {
    Name = "firewall_web"
  }
  
  ingress {
  description = "Allow ssh from my ip"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = [var.your_ip]
  }

  ingress {
  description = "Allow http from anywhere"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
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

