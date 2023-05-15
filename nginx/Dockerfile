FROM debian:11

ENV WORDPRESS_SERVER_IP="192.168.10.51:8080"

WORKDIR /etc/nginx/sites-available

VOLUME /etc/nginx/sites-available

RUN apt-get update && \
    apt-get install nginx -y

EXPOSE 8081

COPY entrypoint.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
