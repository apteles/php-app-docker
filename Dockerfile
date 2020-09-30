FROM ubuntu:18.04 as base
LABEL org.opencontainers.image.maintainer="André Teles"
LABEL org.opencontainers.image.author="andre.telestp@gmail.com"
LABEL org.opencontainers.image.title="Image for projects php"
LABEL org.opencontainers.image.licenses=MIT

EXPOSE 8080
ENV PORT 8080
ENV XDEBUG_HOST=0.0.0.0 
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y gnupg tzdata software-properties-common \
  && echo "UTC" > /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata

RUN useradd -ms /bin/bash php

RUN add-apt-repository ppa:ondrej/php

RUN apt-get update \
  && apt-get install -y curl zip unzip git supervisor sqlite3 \
  nginx php7.4-fpm php7.4-cli \
  php7.4-pgsql php7.4-sqlite3 php7.4-gd \
  php7.4-curl php7.4-memcached \
  php7.4-imap php7.4-mysql php7.4-mbstring \
  php7.4-xml php7.4-zip php7.4-bcmath php7.4-soap \
  php7.4-intl php7.4-readline php7.4-xdebug \
  php-msgpack php-igbinary \
  && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
  && mkdir /run/php \
  && apt-get -y autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && echo "daemon off;" >> /etc/nginx/nginx.conf
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log \
  && chown 1000.1000 /usr/bin/composer

ADD default /etc/nginx/sites-available/default
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
ADD start-container.sh /usr/bin/start-container
COPY xdebug.ini /etc/php/7.4/mods-available/xdebug.ini
COPY start-container.sh /usr/local/bin/start-container.sh
RUN chmod +x /usr/local/bin/start-container.sh


WORKDIR /var/www/application

COPY application/composer.json ./
COPY application/composer.lock ./
ENV PATH /app/vendor/.bin:$PATH
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]
CMD ["start-container.sh"]

FROM base as dev
ENV PHP_ENV=development
RUN composer config --list
RUN composer install && composer clearcache
# The line bellow should be fixed. It does not replace do content in .env correctly
#RUN sed -i "s/xdebug\.remote_host\=.*/xdebug\.remote_host\=${XDEBUG_HOST}/g" /etc/php/7.4/mods-available/xdebug.ini
USER php
CMD ["composer","server"]