FROM php:7.1.8-apache

COPY pdo/ /srv/app/public
COPY vhost.conf /etc/apache2/sites-available/000-default.conf


RUN docker-php-ext-install mbstring pdo pdo_mysql \
        && chown -R www-data:www-data /srv/app
