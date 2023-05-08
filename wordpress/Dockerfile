FROM debian:11

RUN apt-get update && \
    apt-get install apache2 apache2-utils wget php php-bcmath php-curl php-imagick php-gd php-mysql vim -y && \
    service apache2 start && \
    wget https://wordpress.org/latest.tar.gz && \
    tar -zxf latest.tar.gz -C /var/www/html/ && \
    rm /latest.tar.gz && \
    useradd -u 1001 -s /bin/bash -m wordpress && \
    chown www-data:www-data -R /var/www/html/wordpress && \
    find /var/www/html/wordpress/ -type d -exec chmod 755 {} \; && \
    find /var/www/html/wordpress/ -type f -exec chmod 655 {} \; && \
    a2enmod rewrite && \
#    sed -i "s/export APACHE_RUN_USER=www-data/export APACHE_RUN_USER=wordpress/g" /etc/apache2/envvars && \
    sed -i "s/Listen 80/Listen 8080/g" /etc/apache2/ports.conf && \
    service apache2 restart
#    echo "root:toor" | chpasswd

# USER 1001

WORKDIR /var/www/html

VOLUME /var/www/html

EXPOSE 8080

CMD ["apache2ctl", "-D", "FOREGROUND", "-k", "start"]
