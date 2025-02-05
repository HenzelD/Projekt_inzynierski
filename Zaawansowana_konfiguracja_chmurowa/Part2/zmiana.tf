resource "null_resource" "additional_commands" {
  depends_on = [aws_instance.web, aws_lb.main]

  provisioner "file" {
    source      = "additional_commands.sh"
    destination = "/tmp/additional_commands.sh"

    connection {
      host        = aws_instance.web.public_ip
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("key_web")
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/additional_commands.sh",
      "/tmp/additional_commands.sh ${aws_lb.main.dns_name}"
    ]

    connection {
      host        = aws_instance.web.public_ip
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("key_web")
    }
  }
}
