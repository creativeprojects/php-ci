FROM php:8.4-trixie

LABEL maintainer="Fred <Fred@CreativeProjects.Tech>" \
      version="8.4"

VOLUME /tmp/xdebug

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        git \
        default-mysql-client \
        libbz2-dev libzip-dev \
        libfreetype-dev \
        libjpeg-dev \
        libpng-dev \
        libcurl4-openssl-dev libpcre2-dev \
        libpq5 libpq-dev \
        libonig5 libonig-dev \
        gnupg \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install bz2 calendar exif gd gettext mbstring mysqli pdo_mysql pgsql pdo_pgsql sockets zip \
    && pecl install xdebug-3.4.5 \
    && docker-php-ext-enable xdebug \
    && pecl install igbinary \
    && printf "yes\n" | pecl install redis \
    && docker-php-ext-enable igbinary redis \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /tmp/xdebug \
    && chmod 777 /tmp/xdebug \
    && curl --location --output /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar \
    && chmod +x /usr/local/bin/phpunit \
    && curl --silent --show-error https://getcomposer.org/installer | http_proxy='' php -- --install-dir="/usr/local/bin" --filename="composer" \
    && chmod +x /usr/local/bin/composer \
    && echo "memory_limit=-1" > /usr/local/etc/php/conf.d/memory.ini

COPY ext-*.ini /usr/local/etc/php/conf.d/
COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
