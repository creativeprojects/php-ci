# php-ci

PHP images for running unit tests in Continuous Integration

These images are based on the php official image, with these modules added:

* bz2
* calendar
* curl
* exif
* gd
* gettext
* mbstring
* mysqli
* pdo
* pdo_mysql
* pgsql
* pdo_pgsql
* sockets
* zip
* xdebug (PECL)
* igbinary (PECL)
* redis (PECL)

Also [phpunit](https://phpunit.de/) and [composer](https://getcomposer.org/) are installed by default.

## php 5.6

* xdebug 2.5.5
* igbinary 2.0.8
* php redis 4.3.0

[Dockerfile](https://github.com/creativeprojects/php-ci/blob/master/php5.6.Dockerfile)

## php 7.0

* xdebug 2.6.1
* igbinary
* php redis

[Dockerfile](https://github.com/creativeprojects/php-ci/blob/master/php7.0.Dockerfile)

## php 7.1

* xdebug 2.7.2
* igbinary
* php redis

[Dockerfile](https://github.com/creativeprojects/php-ci/blob/master/php7.1.Dockerfile)

## php 7.2

* xdebug 2.7.2
* igbinary
* php redis

[Dockerfile](https://github.com/creativeprojects/php-ci/blob/master/php7.2.Dockerfile)

## php 7.3

* xdebug 2.7.2
* igbinary
* php redis

[Dockerfile](https://github.com/creativeprojects/php-ci/blob/master/php7.3.Dockerfile)

## php 7.4

* xdebug 3.1.1
* igbinary
* php redis

[Dockerfile](https://github.com/creativeprojects/php-ci/blob/master/php7.4.Dockerfile)

## php 8.2 based on debian bookworm

* xdebug 3.4.5
* igbinary (latest)
* php redis (latest)

[Dockerfile](https://github.com/creativeprojects/php-ci/blob/master/php8.2.Dockerfile)

## php 8.4 based on debian trixie

* xdebug 3.4.5
* igbinary (latest)
* php redis (latest)

[Dockerfile](https://github.com/creativeprojects/php-ci/blob/master/php8.4.Dockerfile)
