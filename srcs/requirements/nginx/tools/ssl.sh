#!/bin/sh
set -e
    sed -i s/'{$DOMAIN_NAME}'/$DOMAIN_NAME/g /etc/nginx/sites-available/default
    mkdir -p /etc/nginx/ssl/private
    mkdir -p /etc/nginx/ssl/certs
# req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes
	openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
    -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Gun/CN=$DOMAIN_NAME" \
    -out /etc/nginx/ssl/certs/nginx.crt \
    -keyout /etc/nginx/ssl/private/nginx.key;


exec "$@"