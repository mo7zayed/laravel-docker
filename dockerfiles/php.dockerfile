FROM php:7.4-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql

RUN addgroup -g 1000 app && adduser -G app -g app -s /bin/sh -D app

USER app