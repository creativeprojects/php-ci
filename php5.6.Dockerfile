FROM php:5.6

LABEL maintainer="Fred <Fred@CreativeProjects.Tech>" \
      version="5.6"

RUN http_proxy=$http_proxy apt-get update \
    && http_proxy=$http_proxy apt-get upgrade -y \
    && http_proxy=$http_proxy apt-get install -y \
        git \
        mysql-client \
        libbz2-dev libzip-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libcurl4-openssl-dev libpcre3-dev \
        libpq5 libpq-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include --with-jpeg-dir=/usr/include \
    && docker-php-ext-install bz2 calendar curl exif gd gettext mbstring mcrypt mysqli pdo pdo_mysql pgsql pdo_pgsql sockets zip \
    && pecl install xdebug-2.5.5 \
    && docker-php-ext-enable xdebug \
    && pecl install igbinary-2.0.8 \
    && printf "yes\n" | pecl install redis-4.3.0 \
    && docker-php-ext-enable igbinary redis \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && curl --location --output /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar \
    && chmod +x /usr/local/bin/phpunit \
    && curl --silent --show-error https://getcomposer.org/installer | http_proxy='' php -- --install-dir="/usr/local/bin" --filename="composer" \
    && chmod +x /usr/local/bin/composer

