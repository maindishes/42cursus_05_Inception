FROM debian:buster

LABEL maintainer="junyopar"
LABEL email="42.4.junyopar@gmail.com"

RUN apt-get update
RUN apt-get install -y curl
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN apt-get install -y php-fpm php-mysql

COPY ./conf/nginx.conf /etc/nginx/sites-available/default
COPY ./tools/ssl.sh /tmp/

EXPOSE 443

RUN chmod +x /tmp/ssl.sh

ENTRYPOINT [ "/tmp/ssl.sh" ]
# ENTRYPOINT ["/bin/bash"]
# CMD ["/bin/bash"]
CMD [ "nginx", "-g", "daemon off;" ]
