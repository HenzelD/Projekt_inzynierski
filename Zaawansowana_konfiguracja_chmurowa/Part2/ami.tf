resource "aws_ami_from_instance" "example" {
  name               = "terraform-example"
  source_instance_id = aws_instance.web.id
}
resource "aws_instance" "neweb" {
  count                  = var.how_many_instances
  ami                    = aws_ami_from_instance.example.id
  instance_type          = "t2.micro"
  key_name               = "key_web"
  vpc_security_group_ids = [aws_security_group.firewall_web.id]
  tags = {
    Name    = "app-${count.index + 1}"
  }
}
resource "aws_security_group_rule" "add_new_app1_users" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.firewall_db.id
  cidr_blocks              = ["${aws_instance.neweb[0].public_ip}/32"] 
}
resource "aws_security_group_rule" "add_new_app2_users" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.firewall_db.id
  cidr_blocks              = ["${aws_instance.neweb[1].public_ip}/32"] 
}
output "app1PublicIP" {
  description = "app1 ID of Ubuntu instance"
  value       = aws_instance.neweb[0].public_ip
}
output "app2PublicIP" {
  description = "app2 ID of Ubuntu instance"
  value       = aws_instance.neweb[1].public_ip
}
resource "aws_lb_target_group_attachment" "target_grupa" {
  count            = length(aws_instance.neweb)
  target_group_arn = aws_lb_target_group.main.arn
  target_id        = aws_instance.neweb[count.index].id
  port             = 80
}





