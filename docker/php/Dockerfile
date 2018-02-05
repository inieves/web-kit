FROM php:fpm-alpine3.7

RUN \
	adduser -D -g 'fpm' fpm && \
	sed -i "s|www-data|fpm|g" /usr/local/etc/php-fpm.d/www.conf