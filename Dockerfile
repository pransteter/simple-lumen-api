FROM php:7.3-fpm-alpine

COPY ./fpm/php.ini /usr/local/etc/php/php.ini

COPY . /var/www/html/

RUN apk add --update --no-cache --virtual git vim \
    && docker-php-ext-install pdo pdo_mysql opcache \
    && docker-php-ext-enable pdo pdo_mysql opcache \
    && curl -sS https://getcomposer.org/installer | php \
    && mv -f composer.phar /usr/local/bin/composer \
    && composer install -o