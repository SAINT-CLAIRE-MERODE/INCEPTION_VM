#!/bin/bash

service mariadb start
sleep 2

mysql_secure_installation << EOF
$MYSQL_PASSWORD
n
n
Y
Y
Y
EOF

mariadb -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_ROOT_PASSWORD};"
mariadb -e "CREATE USER IF NOT EXISTS '${MYSQL_DATABASE}'@'%' IDENTIFIED BY '${MYSQL_USER}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${MYSQL_ROOT_PASSWORD}.* TO '${MYSQL_DATABASE}'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

sed -i "s/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

mysqld_safe