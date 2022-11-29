#!/bin/sh

set -e

#mysql start 해야 mariadb 가동할수있다. 의존성인가..? 
sed -i s/'password ='/"password = $WP_ADMIN_PWD"/g /etc/mysql/debian.cnf
service mysql start;
sleep 2;
# # 설정 파일이 있으면 아래 실행 하지 못하도록 하기
# # 여기서 ~@'%' 는 localhost/ 외부 모든곳에서 접속할수 있는 권한을 부여하는것이다.
# # GRANT: 계정 권한을 준다
# # ALL : 모든 권한 허용 = 관리자
# # wylee-developer.tistory.com/23

# 이건 mariadb의 유저를 만드는것이다. 또는 외부에서 접속 가능하게 하는 User만드는것 
# wordpress 설정할때 mydb의 유저를 만드는것이고! 
# sed -i s/'password ='/"password = $WP_ADMIN_PWD"/g /etc/mysql/debian.cnf
mysql -uroot -p$WP_ADMIN_PWD -e "CREATE DATABASE IF NOT EXISTS $WP_DATABASE";
mysql -uroot -p$WP_ADMIN_PWD -e "GRANT ALL PRIVILEGES ON *.* TO '$WP_ADMIN'@'%' IDENTIFIED BY '$WP_ADMIN_PWD'";
mysql -uroot -p$WP_ADMIN_PWD -e "GRANT ALL PRIVILEGES ON $WP_DATABASE.* TO '$WP_USER'@'%' IDENTIFIED BY '$WP_USER_PWD'";
mysql -uroot -p$WP_ADMIN_PWD -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$WP_ADMIN_PWD')";
mysql -uroot -p$WP_ADMIN_PWD -e "FLUSH PRIVILEGES";
# mysql < /tmp/mysql.sql;
# eval "echo \"$(cat /tmp/mysql.sql)\"" | mysql
service mysql stop;
# /usr/bin/mysqladmin -u root -p123 shutdown;

exec "$@";

