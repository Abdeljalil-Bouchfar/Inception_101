# Use debian:buster Linux distribution as a base image
FROM debian:buster

# Update apt && upgrade existing packages && install mariadb
RUN	apt-get update && apt-get upgrade -y && \
	apt-get install -y php7.3 php7.3-fpm php7.3-mysql mariadb-client curl

# Download WP-CLI
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /

# Copy the PHP-FPM configuration file into the container
COPY conf/www.conf /etc/php/7.3/fpm/pool.d

# Copy the script to setup wordpess
COPY tools/script.sh /script.sh

EXPOSE 9000

ENTRYPOINT ["bash", "script.sh"]