FROM dangdungcntt/phpearth:7.4-nginx

WORKDIR /home/app

COPY nginx.conf /etc/nginx/nginx.conf

COPY conf.d /etc/nginx/conf.d/

COPY www.conf /usr/local/etc/php-fpm.d/www.conf

COPY empty.conf /usr/local/etc/php-fpm.d/zz-docker.conf

COPY supervisord.conf /etc/supervisord.conf

RUN apk add --no-cache \
    git \
    mysql-client \
    supervisor \
    jpegoptim \
    pngquant \
    optipng \
    gifsicle \
    composer \
    && docker-php-ext-install pdo_mysql \
    && composer self-update --2
