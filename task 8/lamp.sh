#!/usr/bin/sh
sudo apt update
sudo apt install apache2
sudo ufw app list
sudo systemctl enable apache2
cd /var/www/html/
ls
sudo rm index.nginx-debian.html
gedit index.html
ls
sudo apt install mariadb-server
sudo mysql_secure_installation
sudo mysql
sudo apt install php libapache2-mod-php php-mysql
sudo vim /etc/apache2/mods-enabled/dir.conf 
sudo systemctl restart apache2
sudo systemctl status apache2
sudo nginx -s stop
sudo gedit index.php
