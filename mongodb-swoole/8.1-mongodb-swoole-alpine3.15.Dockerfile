FROM dangdungcntt/php:8.1-nginx-mongodb-alpine3.15

RUN install-php-extensions swoole-stable pcntl