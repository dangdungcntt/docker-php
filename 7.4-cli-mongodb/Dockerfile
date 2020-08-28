FROM php:7.4-cli-alpine

RUN apk --update add --virtual build-dependencies build-base openssl-dev autoconf \
  && pecl install mongodb \
  && docker-php-ext-enable mongodb \
  && apk del build-dependencies build-base openssl-dev autoconf \
  && apk add --no-cache composer \
  && rm -rf /var/cache/apk/*

WORKDIR /usr/src/app