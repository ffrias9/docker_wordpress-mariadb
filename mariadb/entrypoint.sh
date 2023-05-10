#!/bin/bash

service mariadb start

mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWD' WITH GRANT OPTION;"

mysql -u root -p $ROOT_PASSWD <<_EOF_
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
CREATE USER '$NEW_USER'@'$NEW_USER_HOST' IDENTIFIED BY '$NEW_USER_PASSWD';
CREATE DATABASE $NEW_DATABASE;
GRANT ALL ON $NEW_DATABASE.* TO '$NEW_USER'@'$NEW_USER_HOST';
FLUSH PRIVILEGES;
_EOF_

sed -i "s/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf;

service mariadb restart

tail -f /dev/null
