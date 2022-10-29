FROM debian:buster

LABEL maintainer="junyopar"
LABEL email="42.4.junyopar@gmail.com"

RUN apt-get update
RUN apt-get install -y curl sudo php-fpm php-mysql
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp
RUN mkdir -p /var/www/html/wordpress


COPY ./conf/www.conf /etc//etc/php/7.3/fpm/pool.d/
COPY ./tools/wordpress_setup.sh /tmp/

EXPOSE 9000

RUN chmod +x /tmp/wordpress_setup.sh

ENTRYPOINT [ "/tmp/wordpress_setup.sh" ]

CMD [ "php-fpm7.3", "-F" ]
