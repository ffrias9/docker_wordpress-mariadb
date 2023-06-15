#!/bin/bash

#sed -i "s/80$/8081/g" /etc/nginx/sites-available/default

sed -i "s/192.168.10.51:8080/$WORDPRESS_SERVER_IP/g" /etc/nginx/sites-available/default

sed -i "s/192.168.10.51:8080/$WORDPRESS_SERVER_IP/g" /etc/nginx/sites-available/wordpress.conf

/etc/init.d/nginx start -g daemon off;

tail -f /dev/null
