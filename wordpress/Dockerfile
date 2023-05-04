FROM debian:11

EXPOSE 8080

WORKDIR /var/www/html

RUN apt-get update && \
    apt-get install apache2 wget php php-bcmath php-curl php-imagick php-gd php-mysql -y && \
    service apache2 start && \
    wget https://wordpress.org/latest.tar.gz && \
    tar -zxf latest.tar.gz -C /var/www/html/ && \
    chown www-data.www-data -R /var/www/html/wordpress/* && \
    find /var/www/html/wordpress/ -type d -exec chmod 744 {} \; && \
    find /var/www/html/wordpress/ -type f -exec chmod 744 {} \; && \
    a2enmod rewrite && \
#    sed -i "s/Listen 80/Listen 8080/g" /etc/apache2/ports.conf && \
    service apache2 restart

#USER 1001

CMD ["apache2ctl", "-D", "FOREGROUND"]
