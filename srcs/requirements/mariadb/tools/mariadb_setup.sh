#!/bin/sh

set -e

#mysql start 해야 mariadb 가동할수있다. 의존성인가..? 
service mysql start;
sleep 2;
# 설정 파일이 있으면 아래 실행 하지 못하도록 하기
# 여기서 ~@'%' 는 localhost/ 외부 모든곳에서 접속할수 있는 권한을 부여하는것이다.
# GRANT: 계정 권한을 준다
# ALL : 모든 권한 허용 = 관리자
# wylee-developer.tistory.com/23

# mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE";
# mysql -e "GRANT ALL PRIVILEGES ON *.* TO $MYSQL_ROOT@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'";
# mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD'";
# mysql -e "FLUSH PRIVILEGES";

mysql < /tmp/mysql.sql;
# eval "echo \"$(cat /tmp/mysql.sql)\"" | mysql

service mysql stop;

exec "$@";

# CREATE DATABASE IF NOT EXISTS $DB_NAME;
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';
# GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';
# FLUSH PRIVILEGES;