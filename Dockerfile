FROM php:7.4.12-apache

COPY upload.ini /usr/local/etc/php/upload.ini
COPY index.php /var/www/html/index.php
