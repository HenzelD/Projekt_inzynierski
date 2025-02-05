resource "aws_instance" "web" {
  
  ami                    = var.amiID
  instance_type          = var.web_instance_type
  key_name               = "key_web"
  vpc_security_group_ids = [aws_security_group.firewall_web.id]
  tags = {
    Name    = "web"
  }
  user_data              = data.template_file.user_data.rendered
}

output "WebPublicIP" {
  description = "AMI ID of Ubuntu instance"
  value       = aws_instance.web.public_ip
}


 
