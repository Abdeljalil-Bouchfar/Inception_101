#!/bin/sh

# starts the MySQL service
service mysql start 

# Create a database with the name specified in the environment variable (.env)
mysql -e "CREATE DATABASE IF NOT EXISTS '$DATABASE_NAME' ;"

# create a user with the username and password specified in the environment variables (.env)
mysql -e "CREATE USER IF NOT EXISTS '$USER'@'%' IDENTIFIED BY '$USER_PASS' ;"

# grant all privileges to the user on the database.
mysql -e "GRANT ALL PRIVILEGES ON '$DATABASE_NAME'.* TO '$USER'@'%' ;"

# change the password of the root user to the value specified in the environment variable.
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASS' ;"

# ensures that any changes made to the user accounts or their privileges
# are immediately available without requiring a server restart.
mysql -e "FLUSH PRIVILEGES;"

# Restart the MySQL service
kill $(cat /var/run/mysqld/mysqld.pid)
# # service mysql start
mysqld