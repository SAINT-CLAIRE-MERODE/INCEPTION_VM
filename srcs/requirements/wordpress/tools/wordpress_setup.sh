#!/bin/bash

sleep 3

mkdir /var/www/
mkdir -p /var/www/html

cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

wp core config --dbhost="mariadb" --dbname=$MYSQL_ROOT_PASSWORD --dbuser=$MYSQL_DATABASE --dbpass=$MYSQL_USER --path=/var/www/html --allow-root

echo "define('FS_METHOD', 'direct');" >> /var/www/html/wp-config.php

wp core install --url=$WORDPRESS_DB_HOST/ --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email --allow-root

wp user create $WORDPRESS_USER $WORDPRESS_EMAIL --role=author --user_pass=$WORDPRESS_PASSWORD --allow-root

wp core is-installed --allow-root

wp user list --allow-root

wp theme install astra --activate --allow-root

wp plugin update --all --allow-root

mkdir /run/php

/usr/sbin/php-fpm7.4 -F