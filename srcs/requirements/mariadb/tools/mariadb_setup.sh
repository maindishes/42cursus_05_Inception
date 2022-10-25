


#mysql start 해야 mariadb 가동할수있다. 의존성인가..? 
service mysql start;

# 설정 파일이 있으면 아래 실행 하지 못하도록 하기

mysql -e "CREATE DATABASE IF NOT EXISTS {$DB_NAME}";
mysql -e "CREATE USER IF NOT EXISTS '{$WP_ADMIN}'@'%' IDENTIFIED BY '{$WP_ADMIN_PASSWORD}'";
mysql -e "GRANT ALL PRIVILEGES ON {$WP_DB_NAME}.* TO '{$WP_ADMIN}'@'%'";
mysql -e "FLUSH PRIVILEGES";



