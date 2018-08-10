FROM alpine:3.8
RUN apk update && apk upgrade
RUN apk add nginx php php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl mariadb mariadb-client --no-cache
RUN chown -R mysql /var/lib/mysql
RUN chown -R mysql /var/tmp
RUN mkdir /run/mysqld
RUN chown -R mysql /run/mysqld
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
RUN adduser -D -g 'www' www
RUN mkdir /www
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/php-fpm7.conf /etc/php7/php-fpm.d/www.conf
COPY config/run.sh /run.sh
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
ENTRYPOINT ["sh", "/run.sh"]
