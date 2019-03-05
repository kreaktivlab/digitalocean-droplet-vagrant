#!/bin/bash
echo "Updating apt-get"
sudo apt-get -qq update

echo "Installing vsftpd"
sudo ufw allow 20/tcp
sudo ufw allow 21/tcp
sudo ufw allow 990/tcp
sudo ufw allow 40000:50000/tcp
sudo apt-get -y install vsftpd > /dev/null 2>&1
sudo cp -f /vagrant/droplet1/vsftpd.conf /etc
sudo service vsftpd restart

echo "Installing apache2"
sudo apt-get -y install apache2 > /dev/null 2>&1
sudo a2enmod rewrite

sudo cp -f /vagrant/droplet1/000-default.conf /etc/apache2/sites-available
sudo cp -f /vagrant/droplet1/.htaccess /var/www/html

sudo systemctl restart apache2