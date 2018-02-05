FROM alpine:3.7

RUN \
	apk update && \
	apk add mysql mysql-client netcat-openbsd openssl && \
	rm -f /var/cache/apk/*

COPY ./docker/db/startup.sh /startup.sh
COPY ./docker/db/my.cnf /etc/mysql/my.cnf

RUN \
	chmod -R 755 /startup.sh

VOLUME ["/var/lib/mysql", "/var/log"]

EXPOSE 3306

CMD ["/startup.sh"]