#!/bin/sh

mkdir certs
cd certs

openssl req -x509 -newkey rsa:2048 \
-keyout server-key-enc.pem -out server-cert.pem \
-subj '/DC=com/DC=example/CN=server' -passout pass:qwerty

openssl rsa -in server-key-enc.pem -out server-key.pem \
-passin pass:qwerty -passout pass:

openssl req -x509 -newkey rsa:2048 \
-keyout client-key-enc.pem -out client-cert.pem \
-subj '/DC=com/DC=example/CN=client' -passout pass:qwerty

openssl rsa -in client-key-enc.pem -out client-key.pem \
-passin pass:qwerty -passout pass:

cat server-cert.pem client-cert.pem > ca.pem

rm server-key-enc.pem
rm client-key-enc.pem

openssl verify -CAfile ca.pem server-cert.pem client-cert.pem

cd ..