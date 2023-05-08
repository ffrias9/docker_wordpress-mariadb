FROM debian:11

ENV ROOT_PASSWD="toor"
ENV NEW_USER="wordpress"
ENV NEW_USER_HOST="%"
ENV NEW_USER_PASSWD="Passw0rd!"
ENV NEW_DATABASE="wordpress"

RUN apt-get update && \
    apt-get install mariadb-server mariadb-client -y

EXPOSE 3306

COPY entrypoint.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

