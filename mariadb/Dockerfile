FROM debian:11

ENV ROOT_PASSWD="toor"
ENV NEW_USER="wordpress"
ENV NEW_USER_HOST="%"
ENV NEW_USER_PASSWD="Passw0rd!"
ENV NEW_DATABASE="wordpress"

WORKDIR /var/lib/mysql

VOLUME /var/lib/mysql

RUN apt-get update && \
    apt-get install wget mariadb-client mariadb-server -y && \
    useradd -u 1001 -s /bin/bash -m mariadb && \
    /etc/init.d/mariadb start && \
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWD' WITH GRANT OPTION;" && \
    chown -R mariadb:mariadb /var/lib/mysql/ && \
    chmod -R 770 /var/lib/mysql/ && \
    chown -R mariadb:mariadb /run/mysqld && \
    chmod -R 770 /run/mysqld && \
    chown mariadb:mariadb /etc/init.d/mariadb && \
    chmod 770 /etc/init.d/mariadb && \
    chown -R mariadb:mariadb /etc/mysql/ && \
    chmod -R 770 /etc/mysql/ && \
    chown mariadb:mariadb /usr/sbin/mariadbd && \
    chmod 770 /usr/sbin/mariadbd && \
    wget https://github.com/prometheus/node_exporter/releases/download/v1.4.1/node_exporter-1.4.1.linux-amd64.tar.gz -P /opt && \
    tar -xzf /opt/node_exporter-1.4.1.linux-amd64.tar.gz && \
    rm /opt/node_exporter-*linux-amd64.tar.gz && \
    mv node_exporter-*linux-amd64 /opt/node_exporter

EXPOSE 3306
EXPOSE 9100

COPY entrypoint.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/entrypoint.sh && \
    chown mariadb:mariadb /usr/local/bin/entrypoint.sh

USER 1001

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
