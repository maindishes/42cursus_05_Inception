FROM debian:buster

LABEL maintainer="junyopar"
LABEL email="42.4.junyopar@gmail.com"

RUN apt-get update
RUN apt-get -y install mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/ssl.sh /tmp/

EXPOSE 3306

RUN chmod +x /tmp/ssl.sh

ENTRYPOINT [ "/tmp/ssl.sh" ]
# ENTRYPOINT ["/bin/bash"]
# CMD ["/bin/bash"]
CMD [ "nginx", "-g", "daemon off;" ]
