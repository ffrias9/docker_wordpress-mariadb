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
            \ \t}' /etc/nginx/sites-available/default

EXPOSE 80

COPY entrypoint.sh /usr/local/bin/
COPY wordpress.conf /etc/nginx/sites-available/

RUN chmod u+x /usr/local/bin/entrypoint.sh && \
    chown nginx:nginx /usr/local/bin/entrypoint.sh &&\
    ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/

USER 1001

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
