#!/bin/sh

# wp-cli.phar이 있는 경로에서
# chmod +x wp-cli.phar;
# mv wp-cli.phar /usr/local/bin/wp;
while ! mariadb -hmariadb -u$WP_ADMIN -p$WP_ADMIN_PWD $WP_DATABASE > /dev/null 2>&1; do
	echo "Waiting for MariaDB ..."
    sleep 2
done

# 사용자 만들어서  wp 실행 시키기.?? -> 있는 사용자와 그룹에 권한을 줘서 실행시키기
chown -R www-data:www-data /var/www;
# chmod 777 /var/www/wordpress;
# 이방법 말고 wordpress 파일 권한을 www-data 한테 주는걸로~ chown 으로 해보자 

#  얘가 깔려있는지 없는지 확인 해서 없을때만 깔기? 안하면 또 깔게 되면 에러 난다.
# if [! -f /var/www/html/wordpress/index.php]; then
sudo -u www-data wp core download --path=/var/www/html/wordpress
# fi
# mariadb에 있는 유저로 내 db로 연결 

sudo -u www-data wp config create --dbname=$WP_DATABASE --dbuser=$WP_ADMIN --dbpass=$WP_ADMIN_PWD --dbhost=mariadb --path=/var/www/html/wordpress
sudo -u www-data wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --path=/var/www/html/wordpress
sudo -u www-data wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PWD --role=author --path=/var/www/html/wordpress

# create the PID file(/run/php/php7.3-fpm.pid)
service php7.3-fpm start
service php7.3-fpm stop

echo "[ START WRODPRESS CONTAINER ]"

exec "$@"