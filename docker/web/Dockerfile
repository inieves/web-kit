FROM debian:stretch-slim

# INSTALL NGINX
RUN \
	set -x && \
	apt-get update && \
	apt-get install -y --no-install-recommends nginx gettext-base netcat emacs && \
	mkdir /var/www/code && \
	mkdir /var/www/code/php && \
	mkdir /var/www/resource && \
	mkdir /var/www/resource/static && \
	mkdir /var/www/resource/upload && \
	mkdir /etc/nginx/certs && \
	rm -rf /var/www/html && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	rm /etc/nginx/sites-enabled/default && \
	mkdir /etc/nginx/conf_app

# Define mountable directories.
VOLUME ["/etc/nginx/certs", "/var/log/nginx", "/var/www"]

# Define working directory.
WORKDIR /etc/nginx

# Expose ports.
EXPOSE 80
EXPOSE 443