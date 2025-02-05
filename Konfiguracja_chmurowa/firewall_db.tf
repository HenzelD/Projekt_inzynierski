resource "aws_security_group" "firewall_db" {
  name        = "firewall_db"
  description = "firewall_db"
    tags = {
    Name = "firewall_db"
  }

  ingress {
    description     = "Allow MySQL traffic from web security group"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks = ["${aws_instance.web.public_ip}/32"]
  }

  ingress {
    description = "Allow ssh from my ip"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.your_ip]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.your_ip]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    ipv6_cidr_blocks = ["::/0"]
  }
}