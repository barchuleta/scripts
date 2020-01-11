#!/bin/bash

system_update () {
    apt-get update;
    apt-get upgrade -y;
    apt-get dist-upgrade -y;
    apt-get autoremove -y; 
    apt-get autoclean;
    apt-get clean;
}

system_update;

apt-get install -y vim unzip screen tmux apache2 mysql-server \
php libapache2-mod-php php-mcrypt php-mysql php-mbstring php-gd \
php-imagick php-xml php-xml-parser php-xmlrpc php-xml-rpc2 \
php-xml-serializer php-xml-svg php-apcu php-getid3 

mysql_secure_installation;

apt-get update;
apt-get install -y software-properties-common;
add-apt-repository universe;
add-apt-repository ppa:certbot/certbot;
apt-get update;
apt-get install -y certbot python-certbot-apache;

# Add the repository 'ppa:ondrej/php'
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo add-apt-repository ppa:ondrej/apache2
sudo apt update

# Install PHP 7.3
sudo apt install -y php7.3 php7.3-cli libapache2-mod-php7.3
sudo apt install -y php-imagick php-gettext php-memcache php-apcu php-pear php-xml php-xmlrpc
sudo apt install -y php-memcached php-mysql php-intl php-mbstring php-curl php-gd
sudo apt install -y php7.3-common php7.3-mysql php7.3-cgi 
sudo apt install -y php7.3-curl php7.3-zip php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-xsl
sudo apt install -y php7.3-dev php7.3-bz2 php7.3-intl php7.3-json php7.3-opcache php7.3-readline 
sudo apt install -y php7.3-imap php7.3-pspell php7.3-recode php7.3-sqlite3 php7.3-tidy 

# Update the Apache's PHP version
sudo a2dismod php7.0
sudo a2enmod php7.3 rewrite expires deflate headers
sudo systemctl restart apache2.service

# Update the CLI PHP version
sudo update-alternatives --set php /usr/bin/php7.3
system_update;
