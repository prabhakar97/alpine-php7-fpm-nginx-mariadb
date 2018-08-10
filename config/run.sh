echo "Starting php-fpm7 ..."
php-fpm7
echo "Starting mariadb ..."
mysqld --user=mysql &
echo "Starting nginx in the foreground. Ctrl+C to terminate."
nginx -g 'daemon off;'
