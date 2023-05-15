FROM debian:11

ENV WORDPRESS_SERVER_IP="192.168.10.51:8080"

WORKDIR /etc/nginx/sites-available

VOLUME /etc/nginx/sites-available

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
    chmod -R 700 /etc/nginx

EXPOSE 8081

COPY entrypoint.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/entrypoint.sh && \
    chown nginx:nginx /usr/local/bin/entrypoint.sh

USER 1001

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
