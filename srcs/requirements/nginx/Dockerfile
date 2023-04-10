# Use debian:buster Linux distribution as a base image
FROM debian:buster

# Update apt && upgrade existing packages && install mariadb
RUN	apt-get update && apt-get upgrade -y && \
	apt-get install -y nginx

# Copy a self-signed certificate and a key
COPY tools/inception.crt /etc/ssl/certs/inception.crt
COPY tools/inception.key /etc/ssl/private/inception.key

# Copy nginx configiration file into the container
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Statrt nginx server
ENTRYPOINT ["nginx", "-g", "daemon off;"]