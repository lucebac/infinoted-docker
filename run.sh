#!/bin/sh

mkdir -p /data
mkdir -p /logs

chown infinoted:infinoted /data -R
chown infinoted:infinoted /logs -R

if [ ! -e /data/infinoted-key.pem ] || [ ! -e /data/infinoted-cert.pem ]; then
    su infinoted -c "infinoted --config-file=/etc/infinoted/infinoted.conf --create-key --create-certificate"
fi

su infinoted -c "infinoted --config-file=/etc/infinoted/infinoted.conf"
