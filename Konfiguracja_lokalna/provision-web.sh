#!/bin/bash

sudo apt update
sudo apt install -y mysql-client apache2 php php-mysql php-mbstring php-xml php-curl php-zip php-gd php-intl php-soap
sudo wget https://download.moodle.org/download.php/direct/stable405/moodle-latest-405.tgz
sudo mv moodle-latest-405.tgz /var/www/html/
cd /var/www/html/
sudo tar -xf moodle-latest-405.tgz
sudo chown www-data moodle
cd ..
sudo mkdir moodledata
sudo chown www-data moodledata
sudo sed -i 's/^;\?max_input_vars\s*=\s*[0-9]*/max_input_vars = 5000/' /etc/php/8.1/apache2/php.ini
sudo systemctl restart apache2.service
