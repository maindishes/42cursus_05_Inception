#!/bin/sh
set -e
    mkdir /etc/nginx/ssl

	openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Gun/CN=localhost" \
    -out /etc/nginx/ssl/private/nginx.crt \
    -keyout /etc/nginx/ssl/certs/nginx.key


exec $@