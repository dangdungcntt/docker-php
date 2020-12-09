FROM dangdungcntt/phpearth:8.0-nginx

RUN apk add --no-cache \
    git \
    mysql-client \
    supervisor \
    jpegoptim \
    pngquant \
    && install-php-extensions redis pdo_mysql \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY php-fpm.d /usr/local/etc/php-fpm.d/

COPY conf.d /etc/nginx/conf.d/

COPY nginx.conf /etc/nginx/nginx.conf

COPY supervisord.conf /etc/supervisord.conf