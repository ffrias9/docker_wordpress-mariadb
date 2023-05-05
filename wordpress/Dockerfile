FROM debian:11

RUN apt-get update && \
    apt-get install apache2 wget php php-bcmath php-curl php-imagick php-gd php-mysql vim -y && \
    service apache2 start && \
    wget https://wordpress.org/latest.tar.gz && \
    tar -zxf latest.tar.gz && \
    rm latest.tar.gz && \
    useradd -u 1001 -s /bin/bash -m wordpress && \
    chown wordpress:wordpress -R /var/log/apache2 && \
    chown wordpress:wordpress -R ./wordpress/* && \
    find ./wordpress/ -type d -exec chmod 755 {} \; && \
    find ./wordpress/ -type f -exec chmod 655 {} \; && \
    a2enmod rewrite && \
    sed -i "s/Listen 80/Listen 8080/g" /etc/apache2/ports.conf && \
    service apache2 restart

USER 1001

WORKDIR /var/www/html

VOLUME /var/www/html

EXPOSE 8080

CMD ["apache2ctl", "-D", "FOREGROUND"]
