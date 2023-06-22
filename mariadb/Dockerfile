FROM debian:11

ENV ROOT_PASSWD="toor"
ENV NEW_USER="wordpress"
ENV NEW_USER_HOST="%"
ENV NEW_USER_PASSWD="Passw0rd!"
ENV NEW_DATABASE="wordpress"

WORKDIR /var/lib/mysql

VOLUME /var/lib/mysql

RUN apt-get update && \
    apt-get install mariadb-client mariadb-server -y && \
    useradd -u 1001 -s /bin/bash -m mariadb && \
    /etc/init.d/mariadb start && \
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWD' WITH GRANT OPTION;" && \
    chown -R 1001:1001 /var/lib/mysql/ && \
    chmod -R 770 /var/lib/mysql/ && \
    chown -R 1001:1001 /var/log/mysql/ && \
    chmod -R 770 /var/log/mysql/ && \
    chown -R 1001:1001 /run/mysqld && \
    chmod -R 770 /run/mysqld && \
    chown 1001:1001 /etc/init.d/mariadb && \
    chmod 770 /etc/init.d/mariadb && \
    chown -R 1001:1001 /etc/mysql/ && \
    chmod -R 770 /etc/mysql/ && \
    chown 1001:1001 /usr/sbin/mariadbd && \
    chmod 770 /usr/sbin/mariadbd && \
    cp -r /var/lib/mysql/* /tmp && \
    chown -R 1001:1001 /tmp && \
    chmod -R 777 /tmp

EXPOSE 3306

COPY entrypoint.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/entrypoint.sh && \
    chown 1001:1001 /usr/local/bin/entrypoint.sh

USER 1001

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
