FROM debian:jessie-slim

# INSTALL NGINX
RUN \
	set -x && \
	apt-get update && \
	apt-get install -y --no-install-recommends nginx gettext-base netcat && \
	mkdir /var/www/code && \
	mkdir /var/www/static && \
	mkdir /etc/nginx/certs && \
	rm -rf /var/www/html && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

COPY ./docker/web/nginx.conf /etc/nginx/default.conf

# Define mountable directories.
VOLUME ["/etc/nginx/certs", "/var/log/nginx", "/var/www"]

# Define working directory.
WORKDIR /etc/nginx

# Expose ports.
EXPOSE 80
EXPOSE 443