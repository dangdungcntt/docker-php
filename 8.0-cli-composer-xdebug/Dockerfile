FROM dangdungcntt/php:8.0.0-cli-alpine

RUN install-php-extensions xdebug \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /usr/src/app