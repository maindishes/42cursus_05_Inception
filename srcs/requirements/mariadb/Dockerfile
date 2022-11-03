FROM debian:buster

LABEL maintainer="junyopar"
LABEL email="42.4.junyopar@gmail.com"

RUN apt-get update
RUN apt-get -y install mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mariadb_setup.sh /tmp/

EXPOSE 3306

RUN chmod +x /tmp/mariadb_setup.sh

ENTRYPOINT [ "/tmp/mariadb_setup.sh" ]
# ENTRYPOINT ["tail", "-f", "/dev/null"]/
# CMD ["/bin/bash"]

CMD ["mysqld_safe"]
# mysqld_safe와 mysqld차이점 
#mysqld 는 mysql 이 멈춰있어야 된다.