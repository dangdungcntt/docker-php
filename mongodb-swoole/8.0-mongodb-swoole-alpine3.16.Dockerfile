FROM dangdungcntt/php:8.0-nginx-mongodb-alpine3.16

RUN install-php-extensions swoole-stable pcntl