# Use debian:buster Linux distribution as a base image
FROM debian:buster

# Update apk && upgrade existing packages && install mariadb
RUN	apt-get update && apt-get upgrade -y && \
	apt-get install mariadb-server -y

# Copy Mariadb configiration file into the container
RUN sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the script to create the database and the user into the container
COPY tools/script.sh /script.sh

EXPOSE 3306

ENTRYPOINT ["bash", "script.sh"]