#!/bin/sh
set -e
    sed -i s/'{$DOMAIN_NAME}'/junyopar@42.fr/g /etc/nginx/sites-available/default
    mkdir -p /etc/nginx/ssl/private
    mkdir -p /etc/nginx/ssl/certs

	openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Gun/CN=junyopar.42.fr" \
    -out /etc/nginx/ssl/certs/nginx.crt \
    -keyout /etc/nginx/ssl/private/nginx.key


exec "$@"