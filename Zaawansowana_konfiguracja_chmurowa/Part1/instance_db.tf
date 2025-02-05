data "template_file" "user_data_db" {
  template = <<-EOF
    #!/bin/bash
    db_user="${var.db_user}"
    db_pass="${var.db_pass}"
    
    # Aktualizacja systemu
    sudo apt update
    sudo apt upgrade -y

    # Instalacja MySQL
    sudo apt install -y mysql-server
    sudo mysql

    # Tworzenie bazy danych i użytkownika
    sudo mysql -e "CREATE DATABASE moodle DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
    sudo mysql -e "CREATE USER '$db_user'@'%' IDENTIFIED BY '$db_pass';"
    sudo mysql -e "GRANT ALL ON moodle.* TO '$db_user'@'%';"
    sudo mysql -e "FLUSH PRIVILEGES;"

    # Modyfikacja ustawienia bind-address w MySQL
    sudo sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
    sudo systemctl restart mysql    
  EOF

  vars = {
    db_user = var.db_user
    db_pass = var.db_pass
  }
}




resource "aws_instance" "db" {
  ami                    = var.amiID
  instance_type          = var.db_instance_type
  key_name               = "key_db"
  vpc_security_group_ids = [aws_security_group.firewall_db.id]
  tags = {
    Name = "db"
  }
  user_data              = data.template_file.user_data_db.rendered
}

output "dbPublicIP" {
  description = "Public IP of the DB instance"
  value       = aws_instance.db.public_ip
}




