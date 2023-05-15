FROM debian:11

ENV WORDPRESS_SERVER_IP="192.168.10.51:8080"

WORKDIR /etc/nginx/sites-available

VOLUME /var/www/html

RUN apt-get update && \
    apt-get install nginx -y && \
    useradd nginx -m -s /bin/bash -u 1001 && \
    chown -R nginx:nginx /var/log/nginx && \
    chmod -R 700 /var/log/nginx  && \
    chown -R nginx:nginx /run && \
    chmod -R 700 /run && \
    chown -R nginx:nginx /var/lib/nginx && \
    chmod -R 700 /var/lib/nginx && \
    chown -R nginx:nginx /etc/nginx && \
    chmod -R 700 /etc/nginx && \
    sed -i -e '/server_name _;/a \ \n\tlocation /wordpress {\n\
            \ \t\tproxy_pass http://'$WORDPRESS_SERVER_IP'/wordpress;\n\
            \ \t}' /etc/nginx/sites-available/default && \
    echo -e "server{\n\
          listen 8081;\n\
          location /wordpress {\n\
                  proxy_pass http://$WORDPRESS_SERVER_IP/wordpress;\n\
                  proxy_buffering off;\n\
                  proxy_set_header X-Real-IP \$remote_addr;\n\
                  proxy_set_header X-Forwarded-Host \$host;\n\
                  proxy_set_header X-Forwarded-Port \$server_port;\n\
    }}" > /etc/nginx/sites-available/wordpress.conf && \
    ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/

EXPOSE 8081

COPY entrypoint.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/entrypoint.sh && \
    chown nginx:nginx /usr/local/bin/entrypoint.sh

USER 1001

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
