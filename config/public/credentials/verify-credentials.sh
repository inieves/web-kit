#!/bin/sh

# The core of the issue, you've used exactly the same information both for the client
# and the server certificate (same country, organization, locality, etc). And OpenSSL
# doesn't like that. Recreating certificates with different description should solve this problem.

cd certs

openssl verify -CAfile ca-cert.pem server-cert.pem client-cert.pem

cd ..