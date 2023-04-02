# Use debian:buster Linux distribution as a base image
FROM debian:buster

# Update apk && upgrade existing packages && install mariadb
RUN	apt-get update && apt-get upgrade -y && \
	apt-get install -y php7.3 php7.3-fpm php7.3-mysql

# Download WP-CLI
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /


# Making the wp-cli.phar file executable and moving it to the /usr/local/bin/ path
# and renaming it 'wp' to use that as the command and not 'wp-cli.phar'
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Copy the PHP-FPM configuration file into the container
COPY conf/php-fpm.conf /etc/php/7.3/php-fpm.conf

# Copy the script to setup wordpess
COPY tools/script.sh /script.sh

RUN mkdir -p /run/php
ENTRYPOINT ["bash", "script.sh"]

CMD ["php-fpm7.3", "-R", "-F"]
