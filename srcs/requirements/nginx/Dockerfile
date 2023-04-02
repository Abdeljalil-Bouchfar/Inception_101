# Use Alpine Linux distribution as a base image
FROM alpine:3.16

# Update apk && upgrade existing packages
# install nginx and openssl
RUN	apk update && apk upgrade && \
	apk add --no-cache nginx openssl

# Generate a self-signed certificate and a key
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
-subj "/C=EN/ST=IDF/L=BG/O=1337/OU=1337/CN=abouchfa.1337.ma/UID=abouchfa" \
-out /etc/ssl/certs/inception.crt \
-keyout /etc/ssl/private/inception.key

# Copy nginx configiration file into the container
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Statrt nginx server
CMD ["nginx", "-g", "daemon off;"]