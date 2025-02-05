data "template_file" "user_data" {
  template = <<-EOF
    #!/bin/bash
    efs_id="${aws_efs_file_system.efs.id}"
    sudo apt update -y
    sudo apt install -y mysql-client apache2 php php-mysql php-mbstring php-xml php-curl php-zip php-gd php-intl php-soap git binutils rustc cargo pkg-config libssl-dev gettext nfs-common
    sudo wget https://download.moodle.org/download.php/direct/stable405/moodle-latest-405.tgz
    sudo mv moodle-latest-405.tgz /var/www/html/
    cd /var/www/html/
    sudo tar -xf moodle-latest-405.tgz
    sudo chown www-data moodle
    cd ..
    sudo mkdir moodledata
    sudo mkdir /tmp/efs
    cd /tmp/efs
    sudo git clone https://github.com/aws/efs-utils
    cd efs-utils
    sudo ./build-deb.sh
    sudo apt-get install -y ./build/amazon-efs-utils*deb
    cd /var/www/
    echo "$efs_id.efs.eu-west-2.amazonaws.com:/ /var/www/moodledata nfs4 _netdev,nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport 0 0" >> /etc/fstab
    sudo mount -a
    sudo rm -rf /tmp/efs
    sudo chown www-data moodledata
    sudo systemctl restart apache2.service
    sudo sed -i 's/^;\?max_input_vars\s*=\s*[0-9]*/max_input_vars = 5000/' /etc/php/8.1/apache2/php.ini
    sudo systemctl restart apache2.service
  EOF

  vars = {
    efs_id = aws_efs_file_system.efs.id
  }
}





resource "aws_instance" "web" {
  
  ami                    = var.amiID
  instance_type          = var.web_instance_type
  key_name               = "key_web"
  vpc_security_group_ids = [aws_security_group.firewall_web.id]
  tags = {
    Name    = "web"
  }
  user_data              = data.template_file.user_data.rendered
  depends_on = [aws_efs_file_system.efs]

}

output "WebPublicIP" {
  description = "AMI ID of Ubuntu instance"
  value       = aws_instance.web.public_ip
}


 
