FROM debian:11

ENV ROOT_PASSWD="toor"
ENV NEW_USER="wordpress"
ENV NEW_USER_HOST="%"
ENV NEW_USER_PASSWD="Passw0rd!"
ENV NEW_DATABASE="wordpress"

WORKDIR /var/lib/mysql

VOLUME /var/lib/mysql

RUN apt-get update && \
    apt-get install mariadb-client mariadb-server -y

EXPOSE 3306

COPY entrypoint.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
