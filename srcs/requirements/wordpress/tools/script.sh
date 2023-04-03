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

mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

sed -i "s/username_here/$USER/g" wp-config.php
sed -i "s/password_here/$USER_PASS/g" wp-config.php
sed -i "s/localhost/$DATABASE_NAME/g" wp-config.php
sed -i "s/database_name_here/$DATABASE_NAME/g" wp-config.php

# Creating the wp-config.php file using this command.
# wp config create --dbname=$DATABASE_NAME --dbuser=$USER --dbpass=$USER_PASS --dbhost=mariadb:3306 --path='/var/www/wordpress' --allow-root 

# Installing wordpress using the given environment variables to avoid showing the wordpress installation page everytime we run the containe
wp core install --url=$DOMAIN_NAME --title=DopamInception --admin_user=$USER --admin_password=$USER_PASS --admin_email=$USER_EMAIL --allow-root
wp user create $USER $USER_EMAIL --role=author --user_pass=$USER_PASS --allow-root

php-fpm7.3 -F