#!/bin/bash
alb_dns_name=$1
sudo sed -i "s|^\$CFG->wwwroot.*|\$CFG->wwwroot   = 'http://${alb_dns_name}/moodle';|" /var/www/html/moodle/config.php
sudo systemctl restart apache2
