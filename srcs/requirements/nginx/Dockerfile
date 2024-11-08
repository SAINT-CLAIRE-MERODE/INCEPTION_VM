FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/conf.d/nginx.conf

COPY ./tools/nginx_setup.sh /

RUN chmod +x /nginx_setup.sh

CMD ["/nginx_setup.sh"]