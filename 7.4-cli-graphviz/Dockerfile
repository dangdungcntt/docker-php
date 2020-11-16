FROM php:7.4-cli-alpine

RUN apk add --no-cache git ttf-opensans graphviz \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /usr/src/app