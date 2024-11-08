FROM debian:bullseye

RUN apt-get update -y && \
    apt-get install -y php7.4-fpm php7.4-mysql wget curl && \
    apt-get clean

COPY ./tools/wordpress_setup.sh /
COPY ./tools/www.conf /etc/php/7.4/fpm/pool.d/

RUN chmod +x /wordpress_setup.sh

CMD ["/wordpress_setup.sh"]
