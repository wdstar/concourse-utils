#!/bin/sh

apk update
apk add ca-certificates
echo "${CA_CERTS}" > /usr/share/ca-certificates/internal_ca.crt
echo 'internal_ca.crt' >> /etc/ca-certificates.conf
update-ca-certificates
