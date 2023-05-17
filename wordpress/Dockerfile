FROM debian:11

RUN apt-get update && \
    apt-get install apache2 apache2-utils wget php php-bcmath php-curl php-imagick php-gd php-mysql vim -y && \
    apache2ctl -k start && \
    wget https://wordpress.org/latest.tar.gz && \
    tar -zxf latest.tar.gz -C /var/www/html/ && \
    rm /latest.tar.gz && \
    useradd -u 1001 -s /bin/bash -m wordpress && \
    chown wordpress:wordpress -R /var/www/html/wordpress && \
    chmod 700 /var/www/html/wordpress && \
    find /var/www/html/wordpress/* -type d -exec chmod 500 {} \; && \
    find /var/www/html/wordpress/* -type f -exec chmod 600 {} \; && \
    chown root:wordpress -R /var/log/apache2 && \
    chmod 750 /var/log/apache2 && \
    chmod 660 /var/log/apache2/* && \
    chown root:wordpress -R /var/run/apache2 && \
    chmod 770 /var/run/apache2 && \
    a2enmod rewrite && \
    sed -i "s/Listen 80/Listen 8080/g" /etc/apache2/ports.conf && \
    apache2ctl -k restart && \
    wget https://github.com/prometheus/node_exporter/releases/download/v1.4.1/node_exporter-1.4.1.linux-amd64.tar.gz -P /opt && \
    tar -xzf /opt/node_exporter-1.4.1.linux-amd64.tar.gz && \
    rm /opt/node_exporter-*linux-amd64.tar.gz && \
    mv node_exporter-*linux-amd64 /opt/node_exporter

WORKDIR /var/www/html

VOLUME /var/www/html

EXPOSE 8080
EXPOSE 9100

COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod 777 /usr/bin/entrypoint.sh

USER 1001

ENTRYPOINT /usr/bin/entrypoint.sh
