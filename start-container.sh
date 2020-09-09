#!/usr/bin/env bash

if [ ! "production" == "$APP_ENV" ] && [ ! "prod" == "$APP_ENV" ]; then
    # Enable xdebug

    ## FPM
    ln -sf /etc/php/"$PHP_VERSION"/mods-available/xdebug.ini /etc/php/"$PHP_VERSION"/fpm/conf.d/20-xdebug.ini

    ## CLI
    ln -sf /etc/php/"$PHP_VERSION"/mods-available/xdebug.ini /etc/php/"$PHP_VERSION"/cli/conf.d/20-xdebug.ini
else
    # Disable xdebug

    ## FPM
    if [ -e /etc/php/"$PHP_VERSION"/fpm/conf.d/20-xdebug.ini ]; then
        rm -f /etc/php/"$PHP_VERSION"/fpm/conf.d/20-xdebug.ini
    fi

    ## CLI
    if [ -e /etc/php/"$PHP_VERSION"/cli/conf.d/20-xdebug.ini ]; then
        rm -f /etc/php/"$PHP_VERSION"/cli/conf.d/20-xdebug.ini
    fi
fi

sed -i "s/xdebug\.remote_host\=.*/xdebug\.remote_host\=$XDEBUG_HOST/g" /etc/php/7.2/mods-available/xdebug.ini

if [ ! -d /.composer ]; then
  mkdir /.composer
fi

chmod -R ugo+rw /.composer

if [ $# -gt 0 ]; then
  exec "$@"
else
  /usr/bin/supervisord
fi