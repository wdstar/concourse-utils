#!/bin/sh

yum update -y
echo "${CA_CERTS}" > /usr/share/pki/ca-trust-source/anchors/internal_ca.crt
update-ca-trust extract
