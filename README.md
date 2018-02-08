# music

## dev Environment

### web

Docker Info

* id: web
* service: nginx (1.6.2)
* serves: [./app/code](./app/code) [./app/static](./app/static)
* logs: [./app/logs/web](./app/logs/web)

Contact Info

* host: localhost
* ports: 80, 443 (SSL)
* security: all port 80 traffic redirected to port 443 (SSL)

URLs

* url: [https://localhost](https://localhost)
* php info: [https://localhost/info.php](https://localhost/info.php)

### db

Docker Info

* id: db
* service: MySQL (5.7.21-1debian8)
* serves: [./app/db](./app/db)
* logs: [./app/logs/db](./app/logs/db)

Contact Info

* host: localhost
* socket: /var/run/mysqld/mysqld.sock
* port: 3306
* name: app

Account: root

* name: root
* password: [./config/private/auth/db/dev/.en_root_password](./config/private/auth/db/dev/.en_root_password)
* remote login: no
* SSL required: no

Account: app

* name: app
* password: [./config/private/auth/db/dev/.en_user_password](./config/private/auth/db/dev/.en_user_password)
* remote login: yes
* SSL required: sometimes (only for remote login)

SSL Credentials

* Certificate Authority: [./config/private/ssl/db/dev/ca.pem](./config/private/ssl/db/dev/ca.pem)
* Client Cert: [./config/private/ssl/db/dev/client-cert.pem](./config/private/ssl/db/dev/client-cert.pem)
* Client Key: [./config/private/ssl/db/dev/client-key.pem](./config/private/ssl/db/dev/client-key.pem)

### php

Docker Info

* id: php
* service: php-fpm (7.1.14)
* serves: [./app/code/php](./app/code/php)
* logs: [./app/logs/web](./app/logs/web)

Contact Info

* socket: /sockets/web-to-php/docker.sock
* port: none (not listening on 9000)