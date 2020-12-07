FROM php:8.0.0-cli-alpine

RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug \
    && apk del $PHPIZE_DEPS \
    && docker-php-ext-enable xdebug \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /usr/src/app