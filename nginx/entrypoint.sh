#!/bin/bash

sed -i "s/80$/8081/g" /etc/nginx/sites-available/default

sed -i -e '/server_name _;/a \ \n\tlocation /wordpress {\n\
	\ \t\tproxy_pass http://'$WORDPRESS_SERVER_IP'/wordpress;\n\
	\ \t}' /etc/nginx/sites-available/default

echo -e "server{\n
      listen 8081;\n
      location /wordpress {\n
              proxy_pass http://$WORDPRESS_SERVER_IP/wordpress;\n
              proxy_buffering off;\n
              proxy_set_header X-Real-IP \$remote_addr;\n
              proxy_set_header X-Forwarded-Host \$host;\n
              proxy_set_header X-Forwarded-Port \$server_port;\n
}}" > /etc/nginx/sites-available/wordpress.conf

ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/

/etc/init.d/nginx start -g daemon off;

tail -f /dev/null
