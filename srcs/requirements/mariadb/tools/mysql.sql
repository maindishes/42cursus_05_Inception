CREATE DATABASE IF NOT EXISTS {$WP_DATABASE};
--GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'rootpass';
GRANT ALL PRIVILEGES ON *.* TO '{$WP_ADMIN}'@'%' IDENTIFIED BY '{$WP_ADMIN_PWD}';
GRANT ALL PRIVILEGES ON {$WP_DATABASE}.* TO {$WP_USER}@'%' IDENTIFIED BY '{$WP_USER_PWD}';
FLUSH PRIVILEGES;