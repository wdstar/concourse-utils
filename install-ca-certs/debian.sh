#!/bin/sh

apt-get update
apt-get install -y ca-certificates
echo "${CA_CERTS}" > /usr/share/ca-certificates/internal_ca.crt
echo 'internal_ca.crt' >> /etc/ca-certificates.conf
update-ca-certificates
