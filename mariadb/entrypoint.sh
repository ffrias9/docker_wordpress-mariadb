#!/bin/bash

service mariadb start

mysql -u root -p"$ROOT_PASSWD" -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$ROOT_PASSWD' WITH GRANT OPTION;"
mysql -u root -p"$ROOT_PASSWD" -e "FLUSH PRIVILEGES;"
mysql -u root -p"$ROOT_PASSWD" -e "CREATE USER '$NEW_USER'@'$NEW_USER_HOST' IDENTIFIED BY '$NEW_USER_PASSWD';"
mysql -u root -p"$ROOT_PASSWD" -e "CREATE DATABASE $NEW_DATABASE;"
mysql -u root -p"$ROOT_PASSWD" -e "GRANT ALL ON $NEW_DATABASE.* TO '$NEW_USER'@'$NEW_USER_HOST';"
mysql -u root -p"$ROOT_PASSWD" -e "FLUSH PRIVILEGES;"

tail -f /dev/null
