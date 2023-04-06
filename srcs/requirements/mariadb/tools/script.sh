#!/bin/bash

# starts the MySQL service
service mysql start 

# Create a database with the name specified in the environment variable (.env)
mysql -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME ;"

# create a user with the username and password specified in the environment variables (.env)
mysql -e "CREATE USER IF NOT EXISTS '$USER'@'%' IDENTIFIED BY '$PASS' ;"

# grant all privileges to the user on the database.
mysql -e "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$USER'@'%';"

# change the password of the root user to the value specified in the environment variable.
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$PASS' ;"

# Restart the MySQL service
kill $(cat /var/run/mysqld/mysqld.pid)
mysqld