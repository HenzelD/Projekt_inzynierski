data "aws_vpc" "default" {
  default = true
}

# Pobierz domyślne podsieci w domyślnej VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_efs_file_system" "efs" {
  creation_token = "efs"
  tags = {
    Name = "efs"
  }
}

resource "aws_security_group" "efs" {
  name        = "efs-sg"
  description = "Allow NFS traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Możesz ograniczyć to do CIDR swojej VPC lub podsieci
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Tworzenie Mount Targets w każdej podsieci
resource "aws_efs_mount_target" "example" {
  for_each       = toset(data.aws_subnets.default.ids) # Pętla dla każdej podsieci
  file_system_id = aws_efs_file_system.efs.id
  subnet_id      = each.value
  security_groups = [aws_security_group.efs.id]

  depends_on = [aws_efs_file_system.efs]  # Zapewnienie, że EFS zostanie utworzony przed Mount Target
}



output "efs_id" {
  description = "IP addresses of the EFS mount targets"
  value       = [aws_efs_file_system.efs.id]
}