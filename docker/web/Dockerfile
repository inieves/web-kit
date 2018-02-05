FROM alpine:3.7

# INSTALL NGINX
RUN \
	apk update && \
	apk add nginx gettext && \
	adduser -D -g 'www' www && \
	chown -R www:www /var/lib/nginx && \
	mkdir /var/code && \
	mkdir /var/static && \
	chown -R www:www /var/code && \
	chown -R www:www /var/static && \
	mkdir -p /run/nginx && \
	rm -rf /var/www/localhost && \
	sed -i "s|user nginx;|user www;|g" /etc/nginx/nginx.conf && \
	rm -f /var/cache/apk/*

COPY ./docker/web/nginx.conf /etc/nginx/default.conf

# Define mountable directories.
VOLUME ["/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/code", "/var/static"]

# Define working directory.
WORKDIR /etc/nginx

# Expose ports.
EXPOSE 80
EXPOSE 443