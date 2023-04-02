#!/bin/sh

# Making the wp-cli.phar file executable and moving it to the /usr/local/bin/ path
# and renaming it 'wp' to use that as the command and not 'wp-cli.phar'
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/wordpress
mkdir -p /run/php

cd /var/www/wordpress

# Downloading and extracting Wordpress core files to the current directory
wp core download --allow-root

# Creating the wp-config.php file using this command.
wp core config --dbname=$DATABASE_NAME --dbuser=$USER --dbpass=$USER_PASS --dbhost=mariadb --allow-root

# Installing wordpress using the given environment variables to avoid showing the wordpress installation page everytime we run the containe
wp core install --url=$DOMAIN_NAME --title=DopamInception --admin_user=$USER --admin_password=$USER_PASS --admin_email=$USER_EMAIL --allow-root

php-fpm7.3 -F