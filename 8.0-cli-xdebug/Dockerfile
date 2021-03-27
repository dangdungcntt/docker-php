FROM dangdungcntt/php:8.0-cli-alpine

RUN install-php-extensions mongodb xdebug

ENV PATH="/root/.composer/vendor/bin:${PATH}"

RUN composer global require laravel/installer