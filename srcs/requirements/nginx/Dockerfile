# Use debian:buster Linux distribution as a base image
FROM debian:buster

# Update apt && upgrade existing packages && install mariadb
# install nginx and openssl
RUN	apt-get update && apt-get upgrade -y && \
	apt-get install -y nginx openssl

# Generate a self-signed certificate and a key
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
-subj "/C=EN/ST=IDF/L=BG/O=1337/OU=1337/CN=abouchfa.1337.ma/UID=abouchfa" \
-out /etc/ssl/certs/inception.crt \
-keyout /etc/ssl/private/inception.key

# Copy nginx configiration file into the container
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Statrt nginx server
ENTRYPOINT ["nginx", "-g", "daemon off;"]