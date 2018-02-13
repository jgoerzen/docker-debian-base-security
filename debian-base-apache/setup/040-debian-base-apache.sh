#!/bin/bash

set -e
set -x

mv /usr/sbin/policy-rc.d.disabled /usr/sbin/policy-rc.d
echo 'deb http://ftp.debian.org/debian jessie-backports main' >> /etc/apt/sources.list
# Install python-ndg-httpsclient per #861513
apt-get update
apt-get -y --no-install-recommends install apache2 ssl-cert
apt-get -y --no-install-recommends -t jessie-backports install certbot python-certbot-apache python-ndg-httpsclient \
             acme-tiny
apt-get -y -u dist-upgrade

apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
/usr/local/bin/docker-wipelogs

mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.disabled
