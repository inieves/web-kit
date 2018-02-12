# music

## dev Environment

### web

Docker Info

* id: web
* service: nginx (1.6.2)
* serves: [./code](./code) [./static](./static)
* logs: [./logs/web](./logs/web)

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
* serves: [./db](./db)
* logs: [./logs/db](./logs/db)

Contact Info

* host: localhost
* socket: /var/run/mysqld/mysqld.sock
* port: 3306
* name: app

Account: root

* name: root
* password: [./secrets/dev/auth/db/.en_root_password](./secrets/dev/auth/db/.en_root_password)
* remote login: no
* SSL required: no

Account: app

* name: app
* password: [./secrets/dev/auth/db/.en_user_password](./secrets/dev/auth/db/.en_user_password)
* remote login: yes
* SSL required: sometimes (only for remote login)

SSL Credentials

* Certificate Authority: [./secrets/dev/ssl/db/ca.pem](./secrets/dev/ssl/db/ca.pem)
* Client Cert: [./secrets/dev/ssl/db/client-cert.pem](./secrets/dev/ssl/db/client-cert.pem)
* Client Key: [./secrets/dev/ssl/db/client-key.pem](./secrets/dev/ssl/db/client-key.pem)

### php

Docker Info

* id: php
* service: php-fpm (7.1.14)
* serves: [./code/php](./code/php)
* logs: [./logs/web](./logs/web)

Contact Info

* socket: /sockets/web-to-php/docker.sock
* port: none (not listening on 9000)