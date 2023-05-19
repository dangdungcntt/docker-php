FROM dangdungcntt/php:8.1-fpm-alpine3.18

# When using Composer, disable the warning about running commands as root/super user
ENV COMPOSER_ALLOW_SUPERUSER=1

# Persistent runtime dependencies
ARG DEPS="\
        nginx \
        nginx-mod-http-headers-more \
        curl \
        ca-certificates \
        runit \
"

RUN set -x \
    && apk add --no-cache $DEPS \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY tags/nginx /

EXPOSE 80

CMD ["/sbin/runit-wrapper"]
