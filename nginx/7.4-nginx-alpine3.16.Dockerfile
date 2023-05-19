FROM dangdungcntt/phpearth:7.4-nginx-alpine3.16

RUN apk add --no-cache \
    mysql-client \
    supervisor \
    jpegoptim \
    pngquant \
    && install-php-extensions redis-stable pdo_mysql

COPY php-fpm.d /usr/local/etc/php-fpm.d/

COPY conf.d /etc/nginx/conf.d/

COPY nginx.conf /etc/nginx/nginx.conf

COPY supervisord.conf /etc/supervisord.conf