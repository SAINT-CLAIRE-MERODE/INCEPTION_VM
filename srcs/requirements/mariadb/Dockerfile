FROM debian:bullseye

RUN apt-get update -y && \
    apt-get install -y mariadb-server mariadb-client && \
    rm -rf /var/lib/apt/lists/*

COPY ./tools/setup_database.sh.sh /usr/local/bin/setup_database.sh.sh

RUN chmod +x /usr/local/bin/setup_database.sh.sh 

CMD ["/usr/local/bin/setup_database.sh.sh"]
