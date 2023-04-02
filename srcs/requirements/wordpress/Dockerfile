# Use debian:buster Linux distribution as a base image
FROM debian:buster

# Update apk && upgrade existing packages && install mariadb
RUN	apt-get update && apt-get upgrade -y && \
	apt-get install -y php7.3 php7.3-fpm php7.3-mysql curl

# Download WP-CLI
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /

# Copy the PHP-FPM configuration file into the container
COPY conf/php-fpm.conf /etc/php/7.3/php-fpm.conf

# Copy the script to setup wordpess
COPY tools/script.sh /script.sh

ENTRYPOINT ["bash", "script.sh"] 