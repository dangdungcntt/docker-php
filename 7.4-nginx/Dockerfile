FROM dangdungcntt/phpearth:7.4-nginx

WORKDIR /home/app

COPY nginx.conf /etc/nginx/nginx.conf

COPY conf.d /etc/nginx/conf.d/

COPY www.conf /etc/php/7.4/php-fpm.d/www.conf

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
