#!/bin/sh

cd /var/www/html/camagru/
composer.phar dump-env prod
composer.phar install
composer.phar dump-autoload
