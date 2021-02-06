FROM composer:latest

RUN addgroup -g 1000 app && adduser -G app -g app -s /bin/sh -D app

USER app

ENTRYPOINT [ "composer" ]