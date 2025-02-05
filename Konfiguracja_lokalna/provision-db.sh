#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install -y mysql-server
sudo mysql -e "CREATE DATABASE moodle DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
sudo mysql -e "CREATE USER '$db_user'@'$web_ip' IDENTIFIED BY '$db_password';"
sudo mysql -e "GRANT ALL ON moodle.* TO '$db_user'@'$web_ip';"
sudo mysql -e "FLUSH PRIVILEGES;"
sudo sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql
