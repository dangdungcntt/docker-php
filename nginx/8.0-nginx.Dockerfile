FROM dangdungcntt/phpearth:8.0-nginx

RUN apk add --no-cache \
    supervisor \
    jpegoptim \
    pngquant \
    && install-php-extensions redis-stable pdo_pgsql pdo_mysql

COPY php-fpm.d /usr/local/etc/php-fpm.d/

COPY conf.d /etc/nginx/conf.d/

COPY nginx.conf /etc/nginx/nginx.conf

COPY supervisord.conf /etc/supervisord.conf